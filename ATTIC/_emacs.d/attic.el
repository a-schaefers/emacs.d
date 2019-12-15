;; dumping grounds for referring to old stuff until I'm ready to leave it to
;; the sands of git






  ;;(set-face-attribute 'default nil
  ;;                    :font "-xos4-terminus-medium-r-*-*-14-*-*-*-*-*-*-*")






  ;; (was inside with-eval-after-load 'org ...)
  (define-key org-mode-map (kbd "<M-up>") nil)
  (define-key org-mode-map (kbd "<M-down>") nil)
  (define-key org-mode-map (kbd "<M-left>") nil)
  (define-key org-mode-map (kbd "<M-right>") nil)
  (define-key org-mode-map (kbd "<C-up>") 'org-metaup)
  (define-key org-mode-map (kbd "<C-down>") 'org-metadown)
  (define-key org-mode-map (kbd "<C-left>") 'org-metaleft)
  (define-key org-mode-map (kbd "<C-right>") 'org-metaright)
  (define-key org-mode-map (kbd "<C-S-up>") 'org-shiftmetaup)
  (define-key org-mode-map (kbd "<C-S-down>") 'org-shiftmetadown)
  (define-key org-mode-map (kbd "<C-S-left>") 'org-shiftmetaleft)
  (define-key org-mode-map (kbd "<C-S-right>") 'org-shiftmetaright)


(setq custom-file "~/.emacs.d/custom-set-bs.el")


;; color-theme https://download.savannah.nongnu.org/releases/color-theme/color-theme-6.6.0.tar.gz
(use-package color-theme :load-path "site-lisp/color-theme")

;; git subtree pull --squash -P dotfiles/emacs.d/site-lisp/color-theme-solarized https://github.com/sellout/emacs-color-theme-solarized master
(use-package color-theme-solarized
  :load-path "site-lisp/color-theme-solarized"
  :config
  ;;(defun choose-solarized-variant (frame)
  ;;  (let ((mode (if (display-graphic-p frame) 'light 'dark)))
  ;;    (set-frame-parameter frame 'background-mode mode)
  ;;    (set-terminal-parameter frame 'background-mode mode))
  ;;  (enable-theme 'solarized))
  ;;(add-hook 'after-make-frame-functions 'switch-to-solarized-light)
  (add-hook 'window-setup-hook
            (lambda () (switch-to-solarized-light)))
  (load-theme 'solarized t))

(defun switch-to-solarized-variant (variant)
  "Switch to the light or dark variant of the Solarized theme"
  (let ((frame (window-frame)))
       (set-frame-parameter frame 'background-mode variant)
       (set-terminal-parameter frame 'background-mode variant))
  (enable-theme 'solarized))

(defun switch-to-solarized-dark ()
  "Switch to the light or dark variant of the Solarized theme"
  (interactive)
  (switch-to-solarized-variant 'dark))

(defun switch-to-solarized-light ()
  "Switch to the light or dark variant of the Solarized theme"
  (interactive)
  (switch-to-solarized-variant 'light))

;; Make sure terminal frames behave nice w/terminal
(defun terminal-frame-tweaks (frame)
  (unless (display-multi-frame-p frame)
    (modify-frame-parameters frame
                             '((background-color . "unspecified-bg")))))

(defun transparent-terminal ()
  "Make current frame transparent (only if it's a TTY frame)"
  (interactive)
  (terminal-frame-tweaks (window-frame)))

;;(add-hook 'after-make-frame-functions 'terminal-frame-tweaks)
;;(add-hook 'window-setup-hook
;;          (lambda () (terminal-frame-tweaks (window-frame))))


;; Frame navigation
(global-set-key (kbd "M-`") (lambda () (interactive) (other-frame -1)))
(global-set-key (kbd "M-~") (lambda () (interactive) (other-frame 1)))







(defun universal-cut (text)
  (if window-system
      (gui-select-text text)
    (case system-type
      ('gnu/linux (linux-terminal-cut text))
      ('darwin (macos-terminal-cut text)))))

(defun universal-paste ()
  (if window-system
      (gui-selection-value)
    (case system-type
      ('gnu/linux (linux-terminal-paste))
      ('darwin (macos-terminal-paste)))))

(defun linux-terminal-cut (text)
  (pipe-process-shell-command text "xsel" "-ib"))

(defun linux-terminal-paste ()
  (shell-command-terminal-paste "xsel" "-ob"))

(defun macos-terminal-cut (text)
  (pipe-process-shell-command text "reattach-to-user-namespace" "pbcopy"))

(defun macos-terminal-paste ()
  (shell-command-terminal-paste "reattach-to-user-namespace" "pbpaste"))
