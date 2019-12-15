
;; clojure-mode-extra-font-locking https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook
            'zmd-lisp-tweaks))

(use-package clojure-mode-extra-font-locking)

(use-package cider)

(use-package groovy-mode)
