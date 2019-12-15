
;; $ fc-cache -fv
(use-package all-the-icons)

(use-package neotree
  :config
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )
