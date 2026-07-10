;;; === FILE: modules/home/emacs/configs/lisp/core-ui.el ===
;;; core-ui.el --- 界面配置 -*- lexical-binding: t; -*-

;; 注意：不再写 :ensure t，因为 Nix 已经提供了这些包

;; menu-bar-mode 已经在 early-init.el 里提前关闭了（避免终端启动时闪一下）。
;; tool-bar-mode 在这里删掉了：emacs-nox 编译时不带 GUI 工具栏支持，
;; 这个函数在 -nox 下大概率是 void-function，调用会直接报错，
;; 一旦报错，本文件末尾的 (provide 'core-ui) 就不会执行，
;; 会导致 init.el 里 dolist 循环报"加载模块 core-ui 失败"，
;; 即便前面 doom-themes / doom-modeline 已经正常配置好了。

(use-package doom-themes
  :demand t   ; 必须立即加载，否则主题不显示
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config))

(use-package doom-modeline
  :demand t   ; 必须立即加载，否则模式行不显示
  :config
  (setq doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-encoding t)
  (doom-modeline-mode 1))

;; 基础界面设置（这些不需要 use-package，直接 setq 即可）
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(provide 'core-ui)
;;; core-ui.el ends here
