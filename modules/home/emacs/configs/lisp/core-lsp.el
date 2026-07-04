;;; core-lsp.el --- LSP（基于内置 Eglot）配置 -*- lexical-binding: t; -*-

;; 用 Eglot 而不是 lsp-mode：Eglot 从 Emacs 29 开始内置，你用的
;; emacs31-nox 自带，不需要在 home.nix 里额外声明包，配置也更轻量。

;; === 0. 显式注册语言服务器 ===
;; Eglot 内置了一份相当全的 major-mode -> 服务器映射表
;; （变量 eglot-server-programs），但不确定 nixd / taplo /
;; bash-language-server 是不是已经在里面、版本是否符合预期。
;; 用 add-to-list 显式声明一遍最安全：add-to-list 会把新条目插到
;; 列表最前面，即使 Eglot 自带列表里已经有同 mode 的条目，
;; 由于 eglot 用 assoc 从前往后找第一个匹配，我们这条会优先生效，
;; 结果是确定的，不用去猜 Eglot 当前版本内置列表里到底有没有。
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(nix-mode . ("nixd")))
  (add-to-list 'eglot-server-programs '(conf-toml-mode . ("taplo" "lsp" "stdio")))
  (add-to-list 'eglot-server-programs '(sh-mode . ("bash-language-server" "start"))))

;; === 1. nix-mode ===
;; 需要 home.nix 里的 nix-mode 包（提供语法高亮/缩进），
;; eglot-ensure 触发时会自动去找 PATH 里的 nixd
(use-package nix-mode
  :hook (nix-mode . eglot-ensure))

;; === 2. kdl-mode ===
;; 目前没有成熟的 KDL 语言服务器，这里只启用语法高亮，不接 eglot
(use-package kdl-mode)

;; === 3. TOML / Shell ===
;; 这两个的 major mode 都是 Emacs 内置的（conf-toml-mode / sh-mode），
;; 不需要额外的包，只需要告诉 eglot 该用哪个语言服务器、并在打开
;; 对应文件时启动它
(add-hook 'conf-toml-mode-hook #'eglot-ensure)
(add-hook 'sh-mode-hook #'eglot-ensure)

;; === 4. Rust ===
;; rust-ts-mode 是 Emacs 29+ 内置的树屏蔽（tree-sitter）major mode，
;; 不需要额外的 elisp 包，但需要 Rust 的 tree-sitter grammar 存在，
;; 否则 Emacs 会在打开 .rs 文件时自动退回普通的 fundamental-mode。
;;
;; 获取 grammar 最简单的办法：在某个已经有 rustup/cargo 的环境里
;; 执行一次 (treesit-install-language-grammar 'rust) 交互式安装，
;; 装好之后是一个 .so 文件，路径由 treesit-extra-load-path 管理，
;; 之后就一直可用了，不需要每个项目重复装。
(when (treesit-language-available-p 'rust)
  (add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode)))

;; rust-analyzer 的路径不用在这里写死：eglot 内置就知道 rust-ts-mode /
;; rust-mode 该用 "rust-analyzer" 这个命令名去启动，只要 PATH 里能
;; 找到它就行。而 PATH 里有没有 rust-analyzer，就交给下面的 envrc 处理——
;; 有意不在 home.nix 里全局装 rust-analyzer，而是让每个 Rust 项目自己
;; 的 flake devShell 提供，这样不同项目可以用不同版本的工具链，
;; 也不会出现"系统一个版本、项目又要求另一个版本"的冲突。
(add-hook 'rust-ts-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'eglot-ensure)  ; 没装 grammar 时的兜底

;; === 5. envrc：让 Eglot 感知 direnv 提供的 per-project 环境 ===
;; 原理：envrc-mode 会在打开某个属于 .envrc 管理的项目里的文件时，
;; 运行一次 direnv，把结果（包括 PATH）设置成该 buffer 局部的
;; process-environment。这样当 eglot-ensure 在这个 buffer 里
;; 启动 rust-analyzer 时，用的就是 direnv 算出来的、这个项目专属的
;; PATH，而不是 Emacs 启动时那个全局的 PATH。
;;
;; 注意：envrc-global-mode 官方建议放在其他全局 minor mode 都启用
;; 之后再开（见 envrc 包的 README），所以这里没有直接
;; (envrc-global-mode 1)，而是挂在 after-init-hook 的尾部执行，
;; 确保它排在 core-ui.el / core-completion.el 里那些全局 mode 后面。
(use-package envrc)
(use-package inheritenv)  ; envrc 的配套依赖，没有 :config 可写，只是确保被加载

(add-hook 'after-init-hook #'envrc-global-mode 90)

;; === 6. Elisp 本身不需要 LSP ===
;; Emacs 自带 elisp-flymake-byte-compile 这个 flymake 后端就足够
;; 检查语法/未定义变量之类的问题了，接 eglot 反而没有对应的语言服务器、
;; 也没必要。这里只是把 flymake-mode 显式打开（默认不是自动开启的）。
(add-hook 'emacs-lisp-mode-hook #'flymake-mode)

(provide 'core-lsp)
;;; core-lsp.el ends here
