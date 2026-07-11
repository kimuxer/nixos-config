;;; === FILE: modules/home/emacs/configs/lisp/core-magit.el ===
;;; core-magit.el --- Magit / Git 相关配置 -*- lexical-binding: t; -*-

;; 之前 magit 的 use-package 块临时放在 core-keybindings.el 里，
;; 现在拆成独立模块，keybindings 文件只保留"按什么键"，
;; 具体这个包怎么配置放这里，职责分开更好维护。

;; :bind 而不是 :demand：magit 不需要在启动时就加载，只有真正
;; 按下 C-x g（或者 core-keybindings.el 里的 SPC g s）第一次触发时
;; 才会被加载，:bind 会自动生成对应的 autoload 触发点，不影响启动速度。
(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  ;; 显示更细粒度的高亮（单词级别的增删对比，而不是整行标红/标绿）
  (setq magit-diff-refine-hunk 'all)

  ;; 执行 magit 命令前，自动保存所有属于当前仓库、且已修改的文件，
  ;; 不用每次手动 C-x C-s 再切回来 commit
  (setq magit-save-repository-buffers 'dontask)

  ;; magit-status 默认在当前 frame 内全屏显示，返回时能恢复原来的
  ;; 窗口布局，这个是个人喜好设置，如果不喜欢可以删掉这行
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; 让 project.el 的 project-switch-project (SPC p p) 弹出的命令列表里
;; 也能直接选 "Magit status"，不用切完项目再单独按一次 C-x g
(with-eval-after-load 'project
  (add-to-list 'project-switch-commands '(magit-status "Magit status") t))

(provide 'core-magit)
;;; core-magit.el ends here
