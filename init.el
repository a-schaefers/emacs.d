;;; -*- lexical-binding: t -*-

;; TODO(zmd): extract sections into own files, modularize emacs conf

;; == Emacs TLS Settings =======================================================

(setq tls-checktrust t)
(setq gnutls-verify-error t)

(setq package-archives nil)
(setq package-enable-at-startup nil)

;; handy function to print out contents from a url fetch
;;
;; source: KIM Taegyoon
;;         https://stackoverflow.com/questions/4448055/download-a-file-with-emacs-lisp/23251190#23251190
;;
;; usage: (print (get-url "http://www.gnu.org"))
;;
;; use get-url function to check if tls is set up correctly; should get warning
;; that certs are wrong:
;;
;;  (print (get-url "https://wrong.host.badssl.com/"))
;;  (print (get-url "https://self-signed.badssl.com/"))
;;
;; and also make sure valid certs work:
;;
;;  (print (get-url "https://duckduckgo.com/"))
;;
(defun get-url (url)
  (with-current-buffer (url-retrieve-synchronously url) (buffer-string)))

;; == General Settings =========================================================

(column-number-mode t)
(display-time-mode t)
(global-font-lock-mode -1)
(menu-bar-mode -1)
(setq auto-save-default -1)
(setq backup-inhibited t)
(setq winner-dont-bind-my-keys t)
(transient-mark-mode -1)
(winner-mode t)
(show-paren-mode t)
(xterm-mouse-mode t)

(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(setq ring-bell-function 'ignore)
(setq-default sentence-end-double-space nil
              display-time-24hr-format 1
              fill-column 79
              frame-resize-pixelwise t
              indicate-empty-lines t
              inhibit-startup-screen t
              man-width 72
              truncate-lines t
              visible-cursor nil
              x-wait-for-event-timeout nil)

;; == Keybinding & Terminal Hacks ==============================================

(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 5)))

(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 5)))

(global-set-key (kbd "C-c w u") 'winner-undo)
(global-set-key (kbd "C-c w r") 'winner-redo)

;; C-x C-SPC should be the same as C-x SPC
(global-set-key (kbd "C-x C-SPC") 'rectangle-mark-mode)
(global-set-key (kbd "C-x C-@") 'rectangle-mark-mode)

;; Code folding
(global-set-key (kbd "C-c -") 'hs-hide-block)
(global-set-key (kbd "C-c =") 'hs-show-block)
(global-set-key (kbd "C-c `") 'hs-toggle-hiding)

;; Window navigation
(global-set-key (kbd "<S-up>")    'windmove-up)
(global-set-key (kbd "<S-down>")  'windmove-down)
(global-set-key (kbd "<S-left>")  'windmove-left)
(global-set-key (kbd "<S-right>") 'windmove-right)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x o") 'other-window)

(defadvice terminal-init-xterm (after map-S-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after map-S-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))
(defadvice terminal-init-xterm (after map-S-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;2D" [S-left]))
(defadvice terminal-init-xterm (after map-S-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;2C" [S-right]))

(defadvice terminal-init-xterm (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;5A" [C-up]))
(defadvice terminal-init-xterm (after map-C-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;5B" [C-down]))
(defadvice terminal-init-xterm (after map-C-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;5D" [C-left]))
(defadvice terminal-init-xterm (after map-C-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;5C" [C-right]))

(defadvice terminal-init-xterm (after map-M-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;3A" [M-up]))
(defadvice terminal-init-xterm (after map-M-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;3B" [M-down]))
(defadvice terminal-init-xterm (after map-M-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;3D" [M-left]))
(defadvice terminal-init-xterm (after map-M-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;3C" [M-right]))

(defadvice terminal-init-tmux (after map-S-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-tmux (after map-S-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))
(defadvice terminal-init-tmux (after map-S-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;2D" [S-left]))
(defadvice terminal-init-tmux (after map-S-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;2C" [S-right]))

(defadvice terminal-init-tmux (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;5A" [C-up]))
(defadvice terminal-init-tmux (after map-C-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;5B" [C-down]))
(defadvice terminal-init-tmux (after map-C-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;5D" [C-left]))
(defadvice terminal-init-tmux (after map-C-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;5C" [C-right]))

(defadvice terminal-init-tmux (after map-C-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;3A" [M-up]))
(defadvice terminal-init-tmux (after map-M-down-escape-sequence activate)
  (define-key input-decode-map "\e[1;3B" [M-down]))
(defadvice terminal-init-tmux (after map-M-left-escape-sequence activate)
  (define-key input-decode-map "\e[1;3D" [M-left]))
(defadvice terminal-init-tmux (after map-M-right-escape-sequence activate)
  (define-key input-decode-map "\e[1;3C" [M-right]))

;; == Comint Customizations ====================================================

(eval-after-load 'shell '(comint-custom-bindings))
(defun comint-custom-bindings ()
  ;; NOTE(zmd): comint-clear-buffer is Emacs 25+
  (define-key shell-mode-map (kbd "C-c C-c l")
    'comint-clear-buffer))

;; == Mode-specific Configuration ==============================================

;; Non-default for various file types (see also the packages at end)
(add-to-list 'auto-mode-alist '("zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zprofile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zshenv\\'" . sh-mode))

(add-to-list 'auto-mode-alist '("\\.scala\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.sbt\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.gdscript\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.rust\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.toml\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . zmd-generic-programming-mode))

;; TODO(zmd): priority to get proper mode plugins:
(add-to-list 'auto-mode-alist '("\\.clj\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.ex\\'" . zmd-generic-programming-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . zmd-generic-programming-mode))

(add-hook 'prog-mode-hook #'hs-minor-mode)

(add-hook 'before-save-hook
          '(lambda ()
             (delete-trailing-whitespace)))

;; enable hide show folding for ruby
;; source: https://coderwall.com/p/u-l0ra/ruby-code-folding-in-emacs
(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[" "(")) ; Block start
      ,(rx (or "}" "]" ")" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(define-derived-mode zmd-generic-programming-mode fundamental-mode "BayProgrammer Generic Programming Mode"
  "Major mode for editing languages for which we have no better mode for."
  (set (make-local-variable 'indent-line-function) 'tab-to-tab-stop)
  (electric-indent-local-mode -1)
  (setq-local electric-indent-mode nil)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2)
  (setq-local tab-stop-list '(2 4 6)))

(defun zmd-lisp-tweaks ()
  (setq-local electric-indent-mode 1)
  (setq-local indent-tabs-mode nil))

(add-hook 'emacs-lisp-mode-hook
          'zmd-lisp-tweaks)

(add-hook 'lisp-mode-hook
          'zmd-lisp-tweaks)

(add-hook 'scheme-mode-hook
          'zmd-lisp-tweaks)

(defun zmd-choose-scheme (choice)
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Choose a scheme:" '("gosh -i" "scheme" "racket" "guile") nil t))))
  (setq scheme-program-name choice))

(add-hook 'text-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))))

(add-hook 'c-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode 1)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local tab-stop-list '(4 8 16))
             (setq-local c-basic-offset 4)))

(add-hook 'java-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode 1)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local tab-stop-list '(4 8 16))
             (setq-local c-basic-offset 4)))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))))

(add-hook 'python-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (setq-local tab-stop-list '(4 8 12))))

(add-hook 'js-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local js-indent-level 2)))

(add-hook 'js-jsx-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local sgml-basic-offset 2)))

(add-hook 'html-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local sgml-basic-offset 2)))

(add-hook 'nxml-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local sgml-basic-offset 2)))

(add-hook 'css-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local css-indent-offset 2)))

(add-hook 'sh-mode-hook
          '(lambda ()
             (setq-local electric-indent-mode 1)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))

             (setq-local sh-basic-offset 2)
             (setq-local sh-indentation 2)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (setq-local c-basic-offset 4)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (c-set-offset 'substatement-open 0)))
