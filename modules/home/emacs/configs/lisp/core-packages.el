;;; lisp/core-packages.el
(defvar my-required-packages
  '(evil evil-collection))

(dolist (pkg my-required-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(provide 'core-packages)
