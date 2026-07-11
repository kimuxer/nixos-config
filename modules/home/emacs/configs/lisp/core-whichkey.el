;;; lisp/core-whichkey.el --- 快捷键提示配置 -*- lexical-binding: t; -*-

(require 'which-key)

;; 设置延迟时间，单位秒 (比如按住 0.3 秒后显示提示)
(setq which-key-idle-delay 0.3)

;; 开启模式
(which-key-mode 1)

(provide 'core-whichkey)
