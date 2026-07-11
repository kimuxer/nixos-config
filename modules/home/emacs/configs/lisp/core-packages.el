;;; lisp/core-packages.el
(defvar my-required-packages
  '(evil
    evil-collection
    which-key
    general
    )
)

(dolist (pkg my-required-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(provide 'core-packages)
