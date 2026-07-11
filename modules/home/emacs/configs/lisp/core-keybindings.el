;;; core-keybindings.el --- 全局按键绑定 -*- lexical-binding: t; -*-

(require 'evil)

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
