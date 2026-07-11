;;; core-keybindings.el --- 全局按键绑定 -*- lexical-binding: t; -*-

(require 'evil)
(require 'which-key)

;; 设置延迟时间，单位秒 (比如按住 0.3 秒后显示提示)
(setq which-key-idle-delay 0.3)

;; 开启模式
(which-key-mode 1)

(which-key-add-key-based-replacements
  "SPC f" "File"       ;; 将 SPC f 命名为 File
  "SPC b" "Buffer"     ;; 将 SPC b 命名为 Buffer
  "SPC w" "Window"     ;; 将 SPC w 命名为 Window
  "SPC P" "Project"    ;; 将 SPC P 命名为 Project
  "SPC c" "Code/LSP")  ;; 将 SPC c 命名为 Code/LSP

;; 1. 为 SPC 定义一个专用映射表 (Keymap)
(defvar my-leader-map (make-sparse-keymap))
(define-key evil-normal-state-map (kbd "SPC") my-leader-map)
(define-key evil-visual-state-map (kbd "SPC") my-leader-map)
(define-key evil-motion-state-map (kbd "SPC") my-leader-map)

;; 2. 使用 define-key 批量绑定到这个 map 上
;; 这种写法是标准的 Emacs/Evil 规范，不会导致“不是函数调用”的错误
(define-key my-leader-map (kbd "f f") #'find-file)
(define-key my-leader-map (kbd "f s") #'save-buffer)
(define-key my-leader-map (kbd "f r") #'recentf-open)

(define-key my-leader-map (kbd "b b") #'switch-to-buffer)
(define-key my-leader-map (kbd "b k") #'kill-current-buffer)
(define-key my-leader-map (kbd "b n") #'next-buffer)
(define-key my-leader-map (kbd "b p") #'previous-buffer)

(define-key my-leader-map (kbd "w s") #'split-window-below)
(define-key my-leader-map (kbd "w v") #'split-window-right)
(define-key my-leader-map (kbd "w d") #'delete-window)
(define-key my-leader-map (kbd "w o") #'delete-other-windows)

;; 注意：这里请确保你的 my/copy 等函数已经在其他地方定义好了
(define-key my-leader-map (kbd "y")   #'my/copy-to-system-clipboard)
(define-key my-leader-map (kbd "Y")   #'my/copy-line-to-system-clipboard)
(define-key my-leader-map (kbd "p")   #'my/paste-from-system-clipboard)

(define-key my-leader-map (kbd "g s") #'magit-status)

(define-key my-leader-map (kbd "c a") #'eglot-code-actions)
(define-key my-leader-map (kbd "c r") #'eglot-rename)
(define-key my-leader-map (kbd "c f") #'apheleia-format-buffer)

(define-key my-leader-map (kbd "P f") #'project-find-file)
(define-key my-leader-map (kbd "P p") #'project-switch-project)
(define-key my-leader-map (kbd "P b") #'project-switch-to-buffer)

(define-key my-leader-map (kbd "SPC") #'execute-extended-command)
(define-key my-leader-map (kbd "q q") #'save-buffers-kill-terminal)

;; 3. 非 leader 的全局绑定
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-c c") #'compile)

(provide 'core-keybindings)
