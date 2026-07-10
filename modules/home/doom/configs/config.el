;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Kim"
      user-mail-address "kimuxer@gmail.com")

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
(setq doom-font "JetBrainsMono Nerd Font:style=SemiBold:size=13"
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
;; (setq doom-theme 'doom-one)
(load-theme 'noctalia t)
;; 导入noctalia themes 目录加入到自定义主题加载路径中
(add-to-list 'custom-theme-load-path (expand-file-name "themes/" doom-user-dir))
(setq doom-theme 'noctalia)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(after! org
  (set-face-attribute 'org-level-1 nil :height 1.1)
  (set-face-attribute 'org-level-2 nil :height 1.0)
  (set-face-attribute 'org-level-3 nil :height 1.0)
  (set-face-attribute 'org-document-title nil :height 1.0))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.config/doom/org/")
(after! org-roam
  (setq org-roam-directory (file-truename "~/.config/doom/org/roam/"))
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
;; 让 Emacs 内部调用的子进程默认使用 bash（NixOS 中绝对存在）
(setq shell-file-name (executable-find "bash"))
(setq-default explicit-shell-file-name "/run/current-system/sw/bin/fish")

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
;;  "只 tangle 光标所在代码块对应的目标文件。"
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
        (:prefix ("b" . "babel")
         :desc "Tangle current block's file only" "T" #'+org/tangle-current-file-only)))

;; -------------------------------------------------------------------
;;  基础设置
;; -------------------------------------------------------------------

(after! org
  (setq org-startup-folded t)                 ; 打开时全部折叠
  (setq org-hide-leading-stars t)             ; 隐藏多余的星号
  (setq org-odd-levels-only nil)              ; 保持层级清晰

  ;; 如果文件真的很大（5000+ 行），可以启用
  (setq org-element-cache-persistent t)
  (setq org-element-use-cache t))

;; Evil 分屏后自动聚焦新窗
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; 排除，`projectile`/`consult-ripgrep`/`find-file` 索引
(after! projectile
  (dolist (dir '("result" "result-*" ".direnv"))
    (add-to-list 'projectile-globally-ignored-directories dir)))

;; which-key 弹出延
(setq which-key-idle-delay 0.3)

;; -------------------------------------------------------------------
;; 备份文件位置  ~/.cache/emacs
;; -------------------------------------------------------------------

(after! emacs
  ;; 1. 定义根路径
  (setq my-cache-dir (expand-file-name "~/.cache/emacs/"))

  ;; 2. 定义子路径
  (setq my-backup-dir (expand-file-name "backups/" my-cache-dir))
  (setq my-auto-save-dir (expand-file-name "auto-save/" my-cache-dir))

  ;; 3. 显式递归创建这三个目录
  (make-directory my-backup-dir t)
  (make-directory my-auto-save-dir t)

  ;; 4. 设置备份目录
  (setq backup-directory-alist
        `(("." . ,my-backup-dir)))

  ;; 5. 设置自动保存目录
  (setq auto-save-file-name-transforms
        `((".*" ,my-auto-save-dir t)))

  ;; 6. 历史记录路径
  (setq savehist-file (expand-file-name "history" my-cache-dir)))
