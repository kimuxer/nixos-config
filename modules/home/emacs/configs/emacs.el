;;; emacs.el  -*- lexical-binding: t; -*-

;; =============================================================================
;; 1. 【EARLY-INIT STAGE】 Performance and GUI Optimizations
;; =============================================================================
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Restore GC threshold after startup to prevent memory leaks
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

;; Prevent frame flickering on Wayland/PGTK before rendering
(setq frame-inhibit-implied-resize t)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-buffer-menu t)


;; =============================================================================
;; 2. 【INIT STAGE】 General Behavior and Core Settings
;; =============================================================================
(setq-default fill-column 80
              tab-width 2
              indent-tabs-mode nil)
(setq require-final-newline t)
(electric-pair-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)
(setq show-paren-context-when-offscreen 'child-frame)

;; Force UTF-8 environment
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Protect history file paths for read-only Nix store environment
(use-package savehist
  :ensure nil
  :init
  (setq savehist-file (expand-file-name "savehist" "~/.local/share/emacs/"))
  (savehist-mode 1))

(use-package recentf
  :ensure nil
  :init
  (setq recentf-save-file (expand-file-name "recentf" "~/.local/share/emacs/"))
  (recentf-mode 1)
  :config
  (setq recentf-max-saved-items 200))

(use-package saveplace
  :ensure nil
  :init
  (setq save-place-file (expand-file-name "places" "~/.local/share/emacs/"))
  (save-place-mode 1))

;; Smooth scrolling settings
(setq scroll-margin 2
      scroll-conservatively 101
      scroll-preserve-screen-position t)
(column-number-mode 1)
(setq ring-bell-function 'ignore)
(setq use-short-answers t)
(global-subword-mode 1)

(use-package vterm
  :commands vterm)

(use-package treesit-fold
  :hook (treesit-major-mode . treesit-fold-mode))


;; =============================================================================
;; 3. 【UI STAGE】 Appearance and Themes
;; =============================================================================
(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :demand t
  :config
  (setq doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-encoding t)
  (doom-modeline-mode 1))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)


;; =============================================================================
;; 4. 【EVIL STAGE】 Vim Keybindings and Integration
;; =============================================================================
(setq evil-want-keybinding nil)
(setq evil-want-integration t)

(use-package evil
  :demand t
  :config
  (setq evil-default-state 'normal)
  (setq evil-normal-state-cursor 'box)
  (setq evil-insert-state-cursor 'bar)
  (setq evil-emacs-state-cursor 'hbar)
  (setq evil-want-clipboard-init nil)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :demand t
  :config
  (evil-collection-init))

;; =============================================================================
;; 5. 【DEVELOPMENT】 Completion, Tree-sitter and LSP Integration
;; =============================================================================

;; -----------------------------------------------------------------------------
;; [Part A] Completion UI Framework (Vertico)
;; -----------------------------------------------------------------------------
(use-package vertico
  :config (vertico-mode 1))

(use-package corfu
  :demand t
  :config
  (global-corfu-mode 1)
  (setq corfu-auto t
        corfu-cycle t))

(use-package orderless
  :demand t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :config (marginalia-mode 1))


;; -----------------------------------------------------------------------------
;; [Part B] Syntax Highlighting (Tree-sitter)
;; -----------------------------------------------------------------------------
(setq major-mode-remap-alist
      '((rust-mode . rust-ts-mode)
        (bash-mode . bash-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode . json-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (yaml-mode . yaml-ts-mode)))

(add-hook 'treesit-major-mode-hook
          (lambda ()
            (treesit-inspect-mode -1)
            (local-set-key (kbd "C-c C-f") 'treesit-fold-toggle)))


;; -----------------------------------------------------------------------------
;; [Part C] LSP Code Intelligence (Eglot)
;; -----------------------------------------------------------------------------
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(nix-mode . ("nixd")))
  (add-to-list 'eglot-server-programs '(conf-toml-mode . ("taplo" "lsp" "stdio")))
  (add-to-list 'eglot-server-programs '(bash-ts-mode . ("bash-language-server" "start"))))

(add-hook 'rust-ts-mode-hook #'eglot-ensure)
(add-hook 'bash-ts-mode-hook #'eglot-ensure)
(add-hook 'conf-toml-mode-hook #'eglot-ensure)
(add-hook 'emacs-lisp-mode-hook #'flymake-mode)


;; -----------------------------------------------------------------------------
;; [Part D] Third-party Major Modes & Environment
;; -----------------------------------------------------------------------------
(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . eglot-ensure))

(use-package kdl-mode
  :mode "\\.kdl\\'")

(use-package envrc
  :hook (after-init . envrc-global-mode))
(use-package inheritenv)

;; -----------------------------------------------------------------------------
;; [Part E] Formatting & Linting
;; -----------------------------------------------------------------------------
(use-package apheleia
  :demand t
  :config
  (apheleia-global-mode +1)

  ;; 1. Configure formatting CLI commands
  (setf (alist-get 'nix-mode apheleia-formatters) '("alejandra" "-q"))
  (setf (alist-get 'shfmt apheleia-formatters) '("shfmt" "-i" "2" "-bn"))

  ;; 2. Map major modes to the formatters defined above
  ;; Crucial Fix: Ensure modern Tree-sitter mode (bash-ts-mode) is mapped!
  (setf (alist-get 'nix-mode apheleia-mode-formatter-alist) 'nix-mode)
  (setf (alist-get 'sh-mode apheleia-mode-formatter-alist) 'shfmt)
  (setf (alist-get 'bash-ts-mode apheleia-mode-formatter-alist) 'shfmt))

;; =============================================================================
;; 6. 【MAGIT】 Magit and Project Integration
;; =============================================================================
(use-package magit
  :config
  ;; Refine all hunks for crystal clear diffs
  (setq magit-diff-refine-hunk 'all)
  ;; Prevent annoying prompts when killing Emacs with active repo buffers
  (setq magit-save-repository-buffers 'dontask)
  ;; Control buffer display behavior to keep workspace clean
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Integrate Magit seamlessly into project.el switch menu
(with-eval-after-load 'project
  (add-to-list 'project-switch-commands '(magit-status "Magit status") t))

;; =============================================================================
;; 7. 【KEYBINDINGS】 Keybindings (Modern Leader Key Setup)
;; =============================================================================
(use-package consult)

(use-package which-key
  :init (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3))

(use-package general
  :demand t
  :config
  (general-evil-setup)

  ;; 1. Global Leader Key Setup (SPC)
  (general-create-definer my-leader-def
    :states '(normal visual motion)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  ;; 2. General Global Short-cuts
  (general-define-key
   :states 'normal
   "C-p" 'project-find-file) ; Quick file search via project.el

  ;; 3. SPC Leader Key Map
  (my-leader-def
    ;; Top-level single-letter binds
    "SPC" '(execute-extended-command :which-key "M-x")
    "/"   '(consult-line :which-key "Search buffer")

    ;; [b] Buffers (Fixed: Removed void keymap variable)
    "b"   '(:which-key "buffers")
    "bb"  '(switch-to-buffer :which-key "Switch buffer")
    "bd"  '(kill-current-buffer :which-key "Kill buffer")
    "bn"  '(next-buffer :which-key "Next buffer")
    "bp"  '(previous-buffer :which-key "Previous buffer")

    ;; [c] Code / LSP (Integration with Eglot from Part C)
    "c"   '(:which-key "code/lsp")
    "ca"  '(eglot-code-actions :which-key "Code actions")
    "cr"  '(eglot-rename :which-key "Rename symbol")
    "cf"  '(apheleia-format-buffer :which-key "Format buffer") ; Force Apheleia
    "cd"  '(eldoc :which-key "Show docs")

    ;; [f] Files
    "f"   '(:which-key "files")
    "ff"  '(find-file :which-key "Find file")
    "fr"  '(recentf-open-files :which-key "Recent files")

    ;; [g] Git (Integration with Magit)
    "g"   '(:which-key "git")
    "gg"  '(magit-status :which-key "Magit status")

    ;; [t] Toggle / Terminal (Integration with Vterm)
    "t"   '(:which-key "toggle/terminal")
    "tt"  '(vterm :which-key "Open Vterm")))
