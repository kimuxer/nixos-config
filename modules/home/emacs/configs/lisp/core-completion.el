;;; core-completion.el --- 补全配置 -*- lexical-binding: t; -*-

;; 现代化的补全前端
;; vertico-mode 是 autoload 的函数，直接在 :init 里调用即可触发整个包
;; 被加载，不需要 :demand（这是 vertico 官方推荐的写法）
(use-package vertico
  :config
  (vertico-mode 1))

;; 模糊匹配算法
;; 这里必须加 :demand t：这个 use-package 块里没有 :bind/:hook/:commands
;; 这类会自动生成 autoload 触发点的关键字，只有 :custom。
;; 在全局 use-package-always-defer t 的设置下，如果不强制 :demand，
;; orderless 这个包永远不会被真正加载，`completion-styles` 里虽然
;; 写着 'orderless，但 completion-styles-alist 里根本没有对应的条目
;; （因为要 orderless.el 被加载了才会注册），补全会安静地退化成
;; 只用 basic 匹配，且不会有任何报错提示。
(use-package corfu
  :ensure t
  :demand t
  :config
  (global-corfu-mode 1)
  (setq corfu-auto t)        ;; 自动触发补全
  (setq corfu-cycle t))      ;; 支持循环

(use-package orderless
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 在 minibuffer 中提供候选词提示
;; 同 vertico，marginalia-mode 是 autoload 函数，:init 调用即可
(use-package marginalia
  :config
  (marginalia-mode 1))

(provide 'core-completion)
;;; core-completion.el ends here
