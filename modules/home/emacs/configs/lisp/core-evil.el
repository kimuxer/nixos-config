;;; === FILE: modules/home/emacs/configs/lisp/core-evil.el ===
;;; core-evil.el --- Vim 模式配置 -*- lexical-binding: t; -*-

;;; lisp/core-evil.el --- Evil 模式配置 -*- lexical-binding: t; -*-

(require 'evil)

;; 1. 全局配置 (在激活模式前设置)
(setq evil-want-keybinding nil
      evil-want-integration t
      evil-want-clipboard-init nil
      evil-default-state 'normal)

;; 2. 强制开启 evil-mode 并确保其全局生效
;;(evil-mode 1)

;; 3. 为所有可能的基础模式预设状态
(evil-set-initial-state 'fundamental-mode 'normal)
(evil-set-initial-state 'text-mode 'normal)
(evil-set-initial-state 'prog-mode 'normal)

;; 4. 配置光标样式
(setq evil-normal-state-cursor 'box
      evil-insert-state-cursor 'bar
      evil-emacs-state-cursor 'hbar)

;; 5. 初始化 evil-collection (确保它在 evil 之后加载)
(require 'evil-collection)
(evil-collection-init)

;; 4. 剪切板分离功能函数 (留在这里，供 core-keybindings 调用)
(defun my/copy-to-system-clipboard (beg end)
  (interactive "r")
  (gui-set-selection 'CLIPBOARD (buffer-substring-no-properties beg end)))

(defun my/copy-line-to-system-clipboard ()
  (interactive)
  (gui-set-selection 'CLIPBOARD (buffer-substring-no-properties
                                 (line-beginning-position)
                                 (line-end-position))))

(defun my/paste-from-system-clipboard ()
  (interactive)
  (insert (gui-get-selection 'CLIPBOARD)))

(provide 'core-evil)
;;; core-evil.el ends here
