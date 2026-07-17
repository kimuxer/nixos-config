;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setopt user-full-name "Kim"
        user-mail-address "kimuxer@gmail.com")

;; 提前设置 org-directory，确保在 org 包被加载之前生效
(setopt org-directory "~/.cache/emacs/org/")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
(setopt doom-font "JetBrainsMono Nerd Font:style=SemiBold:size=13"
        doom-variable-pitch-font (font-spec :family "Noto Sans CJK SC" :size 13))

;; 让中文字符宽度与字体大小对齐英文字符（避免表格/对齐错位）
(add-hook 'after-setting-font-hook
          (lambda ()
            (dolist (charset '(kana han cjk-misc bopomofo))
              ;; 明确指定 :weight 'regular （如果觉得太细，可以改为 'medium 或 'bold）
              ;; 明确指定 :slant 'normal 阻断可能出现的衬线体误匹配
              (set-fontset-font t charset
                                (font-spec :family "Noto Sans CJK SC" :size 17 :weight 'regular :slant 'normal)
                                nil 'prepend))))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setopt doom-theme 'doom-one)

;; -------------------------------------------------------------------
;;  org 基础设置（普通变量，无需等待 org 包加载，可直接顶层设置）
;; -------------------------------------------------------------------
(setopt org-startup-folded 'fold             ; 打开时全部折叠（仅显示顶层标题）
         org-hide-leading-stars t             ; 隐藏多余的星号
         org-odd-levels-only nil              ; 保持层级清晰
       org-element-cache-persistent t
       org-src-fontify-natively t
       org-src-tab-acts-natively t
       org-element-use-cache t)

(after! org
  ;; 高度调整集中在一份数据里，方便以后新增层级或调整数值，无需重复写 set-face-attribute
  (dolist (face-height '((org-level-1        . 1.1)
                          (org-level-2        . 1.0)
                          (org-level-3        . 1.0)
                          (org-level-4        . 1.0)
                          (org-level-5        . 1.0)
                          (org-document-title . 1.1)))
    (set-face-attribute (car face-height) nil :height (cdr face-height))))

;; -------------------------------------------------------------------
;;  emacsclient -c 默认打开dashboard界面
;; -------------------------------------------------------------------
(defun +my/force-dashboard-h (frame)
  (with-selected-frame frame
    (when (get-buffer dashboard-buffer-name)
      (switch-to-buffer dashboard-buffer-name)
      (dashboard-refresh-buffer))))

(add-hook 'after-make-frame-functions #'+my/force-dashboard-h)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setopt display-line-numbers-type 'visual)

(after! org-roam
  (setopt org-roam-directory (file-truename "~/.cache/emacs/org/roam/"))
  ;; 确保目录存在，否则新机器上首次启动会因目录不存在而报错
  (make-directory org-roam-directory t)
  (org-roam-db-autosync-mode))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; -------------------------------------------------------------------
;; Fish Shell 兼容性配置（解决 doom doctor 的 POSIX 警告）
;; -------------------------------------------------------------------
;; 让 Emacs 内部调用的子进程默认使用 bash
;; 依次尝试 bash → sh（都通过 PATH 动态查找，不硬编码具体路径，
;; 因为 "/bin/sh" 在 NixOS 上未必存在，会导致 process-file 报 file-missing）。
;; 如果两个都找不到才保留原有值——切记不能像 `(executable-find "bash")'
;; 单独那样直接赋值：一旦 PATH 里没有 bash（比如 GUI 方式启动、没继承到完整 PATH 的
;; 情况），shell-file-name 会被直接设为 nil，导致 org-roam 等调用 fd/rg 的地方在
;; call-process-shell-command 时报 (wrong-type-argument stringp nil)。
(setopt shell-file-name
        (or (executable-find "bash")
            (executable-find "sh")
            shell-file-name))
;; 不再硬编码系统路径，改用 executable-find 动态查找 fish。
;; 这样无论 fish 是系统级安装还是 home-manager 管理，都能正确找到；
;; 如果 fish 不存在，则退回 nil，让 Emacs 使用默认 shell，而不是
;; 静默指向一个可能已经不存在的路径
;; 注：explicit-shell-file-name 是 buffer-local 变量，这里设置的是
;; 其全局默认值，用途与 setq! 不同，保持 setq-default 即可
(setq-default explicit-shell-file-name (executable-find "fish"))

;; -------------------------------------------------------------------
;;  添加警告信息到生成的文件
;; -------------------------------------------------------------------

(defun +my/add-tangle-warning-h ()
  (let* ((file buffer-file-name)
         (ext (file-name-extension file)))
    (when (member ext '("nix" "sh" "kdl" "el" "lua" "yaml"))
      (let ((comment-char (cond ((string= ext "kdl") "//")
                                ((string= ext "el") ";;")
                                ((string= ext "lua") "--")
                                (t "#"))))
        (save-excursion
          (goto-char (point-min))
          (unless (search-forward "DO NOT EDIT" nil t)
            (goto-char (point-min))
            (insert (format "%s DO NOT EDIT THIS FILE DIRECTLY.\n" comment-char)
                    (format "%s It is generated from flake.org by org-babel-tangle.\n\n" comment-char))
            (save-buffer)))))))

(add-hook 'org-babel-post-tangle-hook #'+my/add-tangle-warning-h)

;; -------------------------------------------------------------------
;;  " tangle 快捷键配置"
;; -------------------------------------------------------------------

(defun +org/tangle-current-file-only ()
  (interactive)
  (unless (org-in-src-block-p)
    (user-error "光标不在代码块内"))
  (org-babel-tangle '(16))
  (message "已成功 Tangle: %s" (buffer-file-name)))

(after! org
  (map! :map org-mode-map
        :localleader
        (:prefix-map ("m" . "tangle")
         :desc "Tangle whole file" "a" #'org-babel-tangle
         :desc "Detangle current file" "d" #'org-babel-detangle)
        (:prefix-map ("b" . "babel")
         :desc "Tangle current block's file only" "f" #'+org/tangle-current-file-only)))


;; -------------------------------------------------------------------
;; Evil 分屏后自动聚焦新窗
;; -------------------------------------------------------------------
(setopt evil-split-window-below t
        evil-vsplit-window-right t)

;; -------------------------------------------------------------------
;; 排除，`projectile`/`consult-ripgrep`/`find-file` 索引
;; -------------------------------------------------------------------
(after! projectile
  (dolist (dir '("result" "result-*" ".direnv"))
    (add-to-list 'projectile-globally-ignored-directories dir)))

;; -------------------------------------------------------------------
;; which-key 弹出延迟
;; -------------------------------------------------------------------
(setopt which-key-idle-delay 0.3)

;; -------------------------------------------------------------------
;; 备份文件位置  ~/.cache/emacs
;; -------------------------------------------------------------------
;; 原来用 (after! emacs ...) 包裹，但 Emacs 核心从不会
;; (provide 'emacs)，所以这个 after! 永远不会触发，里面的设置
;; 全部失效。这些是核心内建变量，启动早期就可用，直接去掉
;; after! 包裹、顶层执行即可
(let ((cache-dir (expand-file-name "~/.cache/emacs/")))
  (setopt backup-directory-alist `(("." . ,(expand-file-name "backups/" cache-dir)))
            auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-save/" cache-dir) t))
            savehist-file (expand-file-name "history" cache-dir))
  ;; 确保目录存在
  (make-directory (cdr (car backup-directory-alist)) t)
  (make-directory (cadr (car auto-save-file-name-transforms)) t))
