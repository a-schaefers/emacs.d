(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; stuff to look into later:
;;   - https://github.com/compunaut/helm-ido-like-guide
;;   - https://github.com/cute-jumper/helm-ext
;;
;; also, maybe, eventually, evaluate ivy/swiper/counsel as alternative
;; (partially or fully) to helm:
;;   - https://www.youtube.com/watch?v=VvnJQpTFVDc
;;   - https://sam217pa.github.io/2016/09/13/from-helm-to-ivy/
;;   - https://www.reddit.com/r/emacs/comments/51lqn9/helm_or_ivy/
;;   - https://github.com/abo-abo/swiper
;;   - https://github.com/DarwinAwardWinner/amx
(use-package helm
  :ensure t
  :config

  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)

  ;; configured according to: http://tuhdo.github.io/helm-intro.html
  (require 'helm)
  (require 'helm-config)

  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  ;;(when (executable-find "curl")
  ;;  (setq helm-google-suggest-use-curl-p t))

  ;;(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
  ;;      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
  ;;      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
  ;;      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
  ;;      helm-ff-file-name-history-use-recentf t
  ;;      helm-echo-input-in-header-line t)
  (setq helm-display-header-line nil)

  ;;(defun spacemacs//helm-hide-minibuffer-maybe ()
  ;;  "Hide minibuffer in Helm session if we use the header line as input field."
  ;;  (when (with-helm-buffer helm-echo-input-in-header-line)
  ;;    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
  ;;      (overlay-put ov 'window (selected-window))
  ;;      (overlay-put ov 'face
  ;;                   (let ((bg-color (face-background 'default nil)))
  ;;                     `(:background ,bg-color :foreground ,bg-color)))
  ;;      (setq-local cursor-type nil))))
  ;;
  ;;
  ;;(add-hook 'helm-minibuffer-set-up-hook
  ;;          'spacemacs//helm-hide-minibuffer-maybe)

  ;;(setq helm-autoresize-max-height 0)
  ;;(setq helm-autoresize-min-height 20)
  ;;(helm-autoresize-mode 1)

  (helm-mode 1))

(use-package helm-swoop
  :ensure t
  :config

  ;; from docs https://github.com/ShingoFukuyama/helm-swoop
  (require 'helm)

  ;; Locate the helm-swoop folder to your path
  (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
  (require 'helm-swoop)

  ;; Change the keybinds to whatever you like :)
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  ;; When doing evil-search, hand the word over to helm-swoop
  ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)

  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)

  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)

  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)

  ;; ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)

  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; If you prefer fuzzy matching
  (setq helm-swoop-use-fuzzy-match t))
