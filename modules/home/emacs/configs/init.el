;;; === FILE: modules/home/emacs/configs/init.el ===
;;; init.el --- 主配置入口 -*- lexical-binding: t; -*-

;; === 1. 加载路径 ===
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; === 2. use-package ===
;; Nix 已经把插件放进了 load-path，这里不需要 package.el 相关初始化
(require 'use-package)
(setq use-package-always-defer t)
;; 建议开启，方便排查“为什么某个包没加载”之类的问题（仅在交互式/调试时打开即可）
;; (setq use-package-verbose t)

;; === 3. 核心模块 ===
;; 只用 require 一种方式加载，按下面列表的顺序加载，
;; 顺序很重要：比如 core-keybindings 里如果引用了 core-ui / core-evil
;; 定义的变量或函数，必须保证它们已经先被加载。
;;
;; 之前的版本里这里用 require 加载一遍，随后又用
;; (mapc #'load (directory-files modules-dir ...)) 把 modules/ 目录下
;; 的文件重新执行了一遍——导致每个模块被加载两次（load-theme、
;; add-hook、advice-add 等都会被重复调用）。现在只保留这一种方式。
(defvar my-core-modules
  '(core-ui
    core-evil
    core-magit
    core-completion
    core-editor
    core-formatting  ; 必须在 core-keybindings 之前加载：后者绑定了 apheleia-format-buffer，
                      ; 如果 core-formatting.el 从未被 require，这个符号就不会被定义，
                      ; 按 SPC c f 会报 "Symbol's function definition is void" 错误
    core-lsp
    core-keybindings)  ; core-keybindings 放最后，因为它引用了前面模块定义的命令/符号
  "核心模块加载顺序，务必保证依赖在前。")

(dolist (m my-core-modules)
  (condition-case err
      (require m)
    (error
     (message "[init] 加载模块 %s 失败: %s" m (error-message-string err)))))

;; 如果以后要新增“可选/非核心”模块，且不在乎具体加载顺序，
;; 可以放到 modules/ 目录下，用 require 而不是 load 来加载，
;; 这样即使被重复引用（比如某个模块内部又 require 了它）也不会重复执行：
;;
;; (let ((modules-dir (expand-file-name "modules" user-emacs-directory)))
;;   (when (file-directory-p modules-dir)
;;     (dolist (file (directory-files modules-dir t "\\.el$"))
;;       (require (intern (file-name-base file)) file))))
;;
;; 注意：这里换成了 require + 显式提供文件路径，而不是 load，
;; 前提是每个模块文件里都有对应的 (provide 'xxx)。

;; === 4. 备份与自动保存 ===
;; 说明：下面两个设置分别管的是两件不同的事，并不冲突：
;;   - auto-save-visited-mode：定时把“当前编辑内容”直接写回原文件本身
;;     （不是 #file# 临时文件），适合防止意外断电/崩溃丢失最新改动。
;;   - auto-save-file-name-transforms：控制经典的 `#file#` 自动保存临时文件
;;     存放位置，只对普通 auto-save（buffer 里 auto-save-mode）生效。
;; 两者可以同时开启，是两层不同粒度的保护；如果你不希望 Emacs
;; 定时直接覆盖原文件，把 auto-save-visited-mode 那行删掉即可。
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backup" user-emacs-directory))))
(setq delete-old-versions t
      kept-old-versions 2
      kept-new-versions 5
      version-control t)

(auto-save-visited-mode 1)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))

;; === 5. 启动结束后恢复正常 GC 阈值 ===
;; early-init.el 里把阈值拉到了 most-positive-fixnum，
;; 这里在 init 全部跑完之后恢复到一个常规值，避免运行期间内存占用失控。
(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024) ; 16MB
                  gc-cons-percentage 0.1))
          100) ; depth 100，尽量放到 after-init-hook 队列最后执行

(provide 'init)
;;; init.el ends here
