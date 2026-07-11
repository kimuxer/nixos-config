;;; ~/.emacs.d/post-init.el

;; 1. 设置加载路径，确保 Emacs 能找到你的 lisp 目录
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 2. 模块化加载，通过 require 引入你的各个功能模块
;; 这些模块完全独立，互不污染
(require 'core-packages)
(require 'core-ui)

(with-eval-after-load 'evil
  (require 'core-evil))
;; 使用 lambda 函数确保在 Emacs 启动的最后时刻才执行
(run-with-idle-timer 0 nil (lambda ()
                             (evil-mode 1)
                             (message "Evil mode activated successfully.")))

(provide 'post-init)
