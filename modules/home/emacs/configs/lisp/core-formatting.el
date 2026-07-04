;;; core-formatting.el --- 格式化自动化配置 -*- lexical-binding: t; -*-

(use-package apheleia
  :ensure t
  :demand t
  :config
  ;; 1. 开启全局模式
  (apheleia-global-mode +1)

  ;; 2. 自定义格式化程序映射
  ;; Apheleia 内置了大多数工具的配置，不需要写完整的执行路径
  ;; 如果你想调整参数，直接覆盖 alist-get 即可
  (setf (alist-get 'nix-mode apheleia-formatters) '("alejandra" "-q"))
  (setf (alist-get 'sh-mode apheleia-formatters) '("shfmt" "-i" "2" "-bn"))

  ;; 3. 如果需要对某些语言自定义特定参数
  ;; (setf (alist-get 'rust-mode apheleia-formatters) '("rustfmt" "--edition" "2021"))
)

(provide 'core-formatting)
;;; core-formatting.el ends here
