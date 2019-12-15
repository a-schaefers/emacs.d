(setq tls-checktrust t)
(setq gnutls-verify-error t)

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

(setq package-archives nil)
(setq package-enable-at-startup nil)

(eval-when-compile

  ;; https://melpa.org/#/getting-started
  (require 'package)
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "https://stable.melpa.org/packages/")) t)
  (package-initialize)

  (require 'subr-x)
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (add-to-list 'load-path "~/.emacs.d/site-lisp/")
  (add-to-list 'load-path "~/.emacs.d/site-lisp/tree/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/use-package/")
  (require 'use-package)
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/helm/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/magit/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/slime/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/themes/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/erlang/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/spinner/")
  (add-to-list 'load-path "~/.local/share/emacs/site-lisp/jump/"))

(defvar use-package-verbose t)
(setq use-package-always-defer nil
      use-package-always-ensure nil)

;; Theme & Theme Customizations

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#c5c8c6"])
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "e8ddce22383f985cbd89f1b660c0a04ac1a989299f05b18ebadfa8377eb9639e" "dfa614c0be6b8c0a0fc5fed8af59cbaa3aaca8a5cd3752b6d8b1af954f9b5614" "240d58b2adf1c857b348ba46b9715611cea37ba8e4373e8f6c6d29281a71e31b" "1bb0b06fc942a544e0d1cc47a2568732bdca66bbb0dc827e7fd314b76cb1cd23" "1d6a1e9c7b7c9ff647a7d13571f7c7502b0748b02282eca93f1cc63fe3168f53" "a3b2ecf414270c26bf4abed2b0bd367e037c00c33ef76bee09edf4839eb62a8c" "502a769449a25eaa393709a72460c0f014f571152258452f3e68050a9bccea15" "17ec754d2f8ad4d9cf824b9e63e752211f4e67fa48787f1e99e084ca2d433594" "60979a48ac66193a11cb04eb8db2598085fa9a08d4dd56158fd0597683fa0075" "e58810918edfc1eeef6a28f60d60cf644ad82aafcf265e0403cf1cc761230ad7" "236bf7475e1aeae8b798dc27f0be5a48d54367f0943875ebcb6bbae0b9edd310" "7547307425f63e5f62074a22879ac15e8928cbd584faadfd0f2ba01969838184" "15d5fdbe9dc7bc536528770aa4d693dadea0633d8634a9ca5d35deb9ec5d9064" "608b8c2d5ce9a20374c41e4fab1ceb92ab42b9559795237bd7ed9054fb4e20c3" "eb56e8e77c04038d18c7d589a5cd49488f7091b93df6589d9a18adb50e5012f3" "ef4d0d8e24f8bd60e109fed3b6415731decefbff80e40c06540ecf1d39611ad0" "0a0f3129a71e788dc68e023555f2b8a5913690ae0e3e247d02ea358c7921f21e" "f778a1ca0e6f6147c33506da076825024158ec6eed2abcc9bd99d700decf9bc6" "03baef91b7c16b3469e47583b6a50de92d47e3d4f666e5a9b7467f6aac2997e5" "0f5601acc302a0b58242654e38a615d1f0d8e5a8d6de5771606474b8b18c9f14" "f7cd4bd7119f851bb6a6ef2034dd17eafe9768334ec213e93d9d53c2853af0be" "28cfc933d6ca4445ef0c2331f939ff833101638072bcdbbca85176084c8fa6ab" "3d48bd724c8ec33891956668cc9a3a469b711dafd38cb24a59118d06d17129f9" "5996da58ef84c4e69d6dc803a68b7d31b6ef23d18c7fb1d3d433b612dab15180" "e1554e1ca218fd610d0cf61d4db9392b01c11b2d52b6818645d00041fb533bcc" "22fbbf99b1fe6c7a842697acc0731800af4a677e6969ffe5e1df154d2bc2314c" "a231923a087f9c0968ad08d30ec8f9e77da02583ad76c1f29aa4ecb0aefe613f" "07d731874d5931edfa0df9904c82eaac4cdeee4ca236fdb555d2a23c1e4f6efc" "7e14d01653ee202f5c28f7582164dfd7da2a88110ab2b2699fa09cfcd636b9a3" "941ffd51d438e672a076b23e843fd17ca87eaa4550f35c08fb2528b4387d72fd" "6b57b6450369cb6a189621c1755fdada6ac2b18b9fc228991d3e8511c2b50491" "f8cb4acf45df0ed6635217b574df4bdb2c3c572ec8d93311daf6a59b84e400ee" "0cd9c7956cebc6d3fa9d239743980928b542afb051c35b37fadfd20ac945785a" "0ed1bc69c6ec3ce0fb09ff7bfec9abfe6b65952270344c9f65bc340156fd20e5" "1a0cb951ac7eb1d53597ae3f0aea32685242f36047101ee286d3c56be44f6efd" "e5aa4bc07fee654bd2403a87def48bcb95e8c71700e3566dd23293fe5b5b0554" "7677fa577a7f3ead636830c4c150eb1b8a463e6bed49cc1e3007bf97c56d35ab" "ce281d8011645cb38f74edb98ef103f74e66ede9903ce2432ea28b42dc391350" "eaa25d37d0904f42612a5db0b9ba21a77d7ebb920dc1978771e0ad6a9cdb8360" "413d62b96948da3d63f28e6de99b25d15c039927e0cb6150b3e02ad6c4953a4d" "c99a1da7a595795eb9695044d2adf2ff730e3f94310247a692f16ec4d4243cf5" default)))
 '(fci-rule-color "#5c5e5e")
 '(global-whitespace-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c8c06c")
    (cons 60 "#dcc370")
    (cons 80 "#f0c674")
    (cons 100 "#eab56d")
    (cons 120 "#e3a366")
    (cons 140 "#de935f")
    (cons 160 "#d79e84")
    (cons 180 "#d0a9a9")
    (cons 200 "#c9b4cf")
    (cons 220 "#ca9aac")
    (cons 240 "#cb8089")
    (cons 260 "#cc6666")
    (cons 280 "#af6363")
    (cons 300 "#936060")
    (cons 320 "#765d5d")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil)
 '(whitespace-style (quote (face trailing tabs tab-mark)))
 '(xterm-color-names
   ["black" "red" "limegreen" "gold" "steelblue" "mediumvioletred" "darkturquoise" "gray"])
 '(xterm-color-names-bright
   ["lightgray" "tomato" "darkseagreen2" "yellow" "lightskyblue" "magenta" "turquoise" "white"])
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t nil :inherit nil))))

;; General settings
(setq-default
 mode-line-format
 '("%e" mode-line-front-space mode-line-mule-info mode-line-client
   mode-line-modified mode-line-remote mode-line-frame-identification
   mode-line-buffer-identification "   " mode-line-position "  (%m) "
   mode-line-misc-info mode-line-end-spaces)
 sentence-end-double-space nil)

(column-number-mode 1)
(show-paren-mode)
(xterm-mouse-mode 1)
(display-time-mode 1)
(setq winner-dont-bind-my-keys t)
(winner-mode 1)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(setq ring-bell-function 'ignore)
(setq-default truncate-lines t
              inhibit-startup-screen t
              display-time-24hr-format 1
              indicate-empty-lines t
              man-width 72
              fill-column 79
              visible-cursor nil
              frame-resize-pixelwise t

              ;; fix super annoying lag on emacs 26+
              ;; https://github.com/emacs-helm/helm/issues/1976#issuecomment-378724670
              x-wait-for-event-timeout nil)

(setq default-frame-alist
      '((tool-bar-lines . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        ;;(cursor-type . (bar . 2))
        ;;(inhibit-double-buffering . t)
        ))

;; Disable Emacs auto backup and auto-save madness
(setq backup-inhibited t)
(setq auto-save-default nil)

;; OS-specific configuration
(when (or (eq system-type 'linux)
          (eq system-type 'gnu/linux))
  (set-face-attribute 'default nil
                      :height 120)
  (add-to-list 'default-frame-alist
               '(menu-bar-lines . 0))
  (setq x-super-keysym 'meta))

(when (eq system-type 'darwin)
  ;; TODO(zmd): reattach to user namespace... (such as for M-x shell)
  (set-face-attribute 'default nil
                      :family "Menlo"
                      :height 140)
  (add-to-list 'default-frame-alist
               '(menu-bar-lines . 1))
  (setq mac-command-key-is-meta t
        mac-command-modifier 'meta)

  ;;https://huytd.github.io/emacs-from-scratch.html#orge4bb006
  ;; Fancy titlebar for MacOS
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq ns-use-proxy-icon  nil
        frame-title-format nil)

  (global-set-key [home] 'move-beginning-of-line)
  (global-set-key [end] 'move-end-of-line))

;; vertical divider character
 ;; source: https://www.reddit.com/r/emacs/comments/3u0d0u/how_do_i_make_the_vertical_window_divider_more/cxb78ul/
(defun my-change-window-divider ()
  (let ((display-table (or buffer-display-table standard-display-table)))
    (set-display-table-slot display-table 5 ?│)
    (set-window-display-table (selected-window) display-table)))

(add-hook 'window-configuration-change-hook 'my-change-window-divider)

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
(global-set-key (kbd "<S-up>")    'zmd-windmove-up)
(global-set-key (kbd "<S-down>")  'zmd-windmove-down)
(global-set-key (kbd "<S-left>")  'zmd-windmove-left)
(global-set-key (kbd "<S-right>") 'zmd-windmove-right)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x o") 'other-window)

;; https://stackoverflow.com/questions/11721224/shift-arrow-selection-in-emacs#11724437
;; https://groups.google.com/forum/#!topic/gnu.emacs.help/ZGu2MNkJGrI
;; https://unix.stackexchange.com/questions/375825/how-can-emacs-be-configured-to-accept-shift-and-alt-cursor-combinations-properly/377432#377432
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

;; TODO(zmd): make frame tweak functions available for interactive use
;;     (sometimes after loading config you need to run some of them manually)
;;
;;     for now: (terminal-frame-tweaks (selected-frame))

;; Make sure terminal frames behave nice w/terminal
(defun terminal-frame-tweaks (frame)
  (unless (display-multi-frame-p frame)
    (modify-frame-parameters
     frame '((background-color . "unspecified-bg")))
    (xterm-mouse-mode 1)))
(add-hook 'after-make-frame-functions
          'terminal-frame-tweaks)

;; TODO(zmd): consider combining terminal-frame-tweaks and
;;     graphical-frame-tweaks into a single function.
(defun graphical-frame-tweaks (frame)
  ;;(if (display-multi-frame-p frame)
  ;;  (modify-frame-parameters
  ;;    frame '((cursor-color . "yellow"))))
  )
(add-hook 'after-make-frame-functions
          'graphical-frame-tweaks)

(defun terminal-window-tweaks ()
  (unless (window-system)
    (set-background-color "unspecified-bg")))
(add-hook 'window-setup-hook
          'terminal-window-tweaks)

;; Emacs / Tmux Navigation functions inspired by
;;   https://gist.github.com/nathanlippi/5923326 and
;;   https://github.com/christoomey/vim-tmux-navigator
(defun windmove-dispatch (dir)
  (if (inside-tmux?)
      (if (emacs-switch-window dir)
          nil
        (tmux-switch-pane dir))
    (emacs-switch-window dir)))

(defun inside-tmux? ()
  (and (not (window-system))
       (getenv "TMUX" (window-frame))))

(defun tmux-switch-pane (dir)
  ;; TODO(zmd): replace with (case dir ('up...
  (cond ((eq 'up dir)    (call-process-shell-command-in-frame-environment "tmux select-pane -U"))
        ((eq 'down dir)  (call-process-shell-command-in-frame-environment "tmux select-pane -D"))
        ((eq 'left dir)  (call-process-shell-command-in-frame-environment "tmux select-pane -L"))
        ((eq 'right dir) (call-process-shell-command-in-frame-environment "tmux select-pane -R"))))

(defun emacs-switch-window (dir)
  ;; TODO(zmd): replace with (case dir ('up...
  (ignore-errors (cond ((eq 'up dir)    (windmove-up))
                       ((eq 'down dir)  (windmove-down))
                       ((eq 'left dir)  (windmove-left))
                       ((eq 'right dir) (windmove-right)))))

(defun zmd-windmove-up    () (interactive) (windmove-dispatch 'up))
(defun zmd-windmove-down  () (interactive) (windmove-dispatch 'down))
(defun zmd-windmove-left  () (interactive) (windmove-dispatch 'left))
(defun zmd-windmove-right () (interactive) (windmove-dispatch 'right))

(defun call-process-shell-command-in-frame-environment (cmd &optional in buf disp)
  (if (frame-parameter nil 'environment)
      (let ((process-environment
             (frame-parameter nil 'environment)))
        (call-process-shell-command cmd in buf disp))
    (call-process-shell-command cmd in buf disp)))

(defun my-shell-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  ;;(add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t)
  (setq-local comint-prompt-regexp "^ .* \$ $")
  (display-line-numbers-mode 0))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

;; Clipboard integration when running in terminal (xclip / pbcopy)
;; functions adapted from: http://stackoverflow.com/questions/3216081/integrate-emacs-copy-paste-with-system-copy-paste/24557276#24557276

(setq interprogram-cut-function 'universal-cut)
(setq interprogram-paste-function 'universal-paste)

(global-unset-key (kbd "<M-f10>"))
(defun universal-cut (text)
  (if window-system
      (gui-select-text text)
    (pipe-process-shell-command text "clipc")))

(defun universal-paste ()
  (if window-system
      (gui-selection-value)
    (shell-command-terminal-paste "clipp")))

(defun pipe-process-shell-command (text command &rest args)
  (let* ((process-connection-type nil)
         (command-proxy (apply
                         'start-process
                         (append (list "pipe-process-shell-command" nil command)
                                 args))))
    (process-send-string command-proxy text)
    (process-send-eof command-proxy)))

(defun shell-command-terminal-paste (command &rest args)
  (let* ((command (string-join (append (list command) args) " "))
         (output (shell-command-to-string command))
         (last-kill (car kill-ring)))
    (unless (string= last-kill output)
      output)))

(eval-after-load 'shell '(comint-custom-bindings))
(defun comint-custom-bindings ()
  ;; NOTE(zmd): comint-clear-buffer is Emacs 25+
  (define-key shell-mode-map (kbd "C-c C-c l")
    'comint-clear-buffer))


;; directory tracking via Trey Jackson's blog post, see:
;;           http://trey-jackson.blogspot.com/2008_08_01_archive.html
;; see also: https://www.emacswiki.org/emacs/ShellDirtrackByPrompt

(add-hook 'shell-mode-hook
          #'(lambda ()
              (toggle-truncate-lines 0)
              (setq-local comint-prompt-regexp "^ .* \$ $")
              ;;(display-line-numbers-mode 0)
              (shell-dirtrack-mode 0)
              (add-hook 'comint-preoutput-filter-functions
                        'shell-sync-dir-with-prompt nil t)))

(defun shell-sync-dir-with-prompt (string)
  "A preoutput filter function (see `comint-preoutput-filter-functions')
which sets the shell buffer's path to the path embedded in a prompt string.
This is a more reliable way of keeping the shell buffer's path in sync
with the shell, without trying to pattern match against all
potential directory-changing commands, ala `shell-dirtrack-mode'.

In order to work, your shell must be configured to embed its current
working directory into the prompt.  Here is an example .zshrc
snippet which turns this behavior on when running as an inferior Emacs shell:

  if [ $EMACS ]; then
     prompt='|Pr0mPT|%~|[%n@%m]%~%# '
  fi

The part that Emacs cares about is the '|Pr0mPT|%~|'
Everything past that can be tailored to your liking.
"
  (if (string-match "|Pr0mPT|\\([^|]*\\)|" string)
      (let ((cwd (match-string 1 string)))
        (setq default-directory
              (if (string-equal "/" (substring cwd -1))
                  cwd
                (setq cwd (concat cwd "/"))))
        (replace-match "" t t string 0))
    string))

;; Emacs GUI-specific configuration
(if window-system
    (progn
      (global-unset-key (kbd "C-z"))))

;; TODO(zmd): zmd-comint-run (elminate tmux from workflow as much as possible)

;; Non-default for various file types (see also the packages at end)
(add-to-list 'auto-mode-alist '("zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zprofile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("zshenv\\'" . sh-mode))

;; Mode-specific settings (esp. for indentation defaults)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; enable hide show folding for ruyb
;; source: https://coderwall.com/p/u-l0ra/ruby-code-folding-in-emacs
(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[" "(")) ; Block start
      ,(rx (or "}" "]" ")" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

;;(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;;(add-hook 'prog-mode-hook #'hl-line-mode)


;; https://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs#683575
(defvar my-lisp-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'paredit-newline)
    map)
  "my-lisp-keys-minor-mode keymap.")

(define-minor-mode my-lisp-keys-minor-mode
  "A minor mode so that my lisp key settings override defaults."
  :init-value t
  :lighter " my-lisp-keys")


(defun zmd-lisp-tweaks ()
  (paredit-mode 1)
  (my-lisp-keys-minor-mode 1)
  (setq-local electric-indent-mode 1)
  (setq-local indent-tabs-mode nil))

(add-hook 'lisp-interaction-mode-hook
          '(lambda () (my-lisp-keys-minor-mode 0)))

(add-hook 'emacs-lisp-mode-hook
          'zmd-lisp-tweaks)

(add-hook 'lisp-mode-hook
          'zmd-lisp-tweaks)

(add-hook 'scheme-mode-hook
          'zmd-lisp-tweaks)

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

(add-hook 'js-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local js-indent-level 2)))

(add-hook 'html-mode-hook
          '(lambda ()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))))

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

(add-hook 'term-mode-hook
          '(lambda ()
             ;;(setq-local global-hl-line-mode nil)
             ))

(add-hook 'before-save-hook
          '(lambda ()
             (delete-trailing-whitespace)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (setq-local c-basic-offset 4)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 4)
             (c-set-offset 'substatement-open 0)))

;; Org-mode keybindings
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(set 'org-return-follows-link 1)

;; https://emacs.stackexchange.com/questions/22179/enable-visual-line-mode-and-org-indent-mode-when-opening-org-files#22180
(with-eval-after-load 'org
  (load-library "find-lisp")
  (setq
   org-capture-templates '(("t" "Todo" entry (file "~/Org/inbox.org")
                            "* TODO %?\n  %i\n  %a")
                           ("n" "Note" entry (file "~/Org/inbox.org")
                            "* %?            :unfiled: \n  %i\n")
                           ;; bookmark capture temporary, real solution is here:
                           ;; https://github.com/rexim/org-cliplink (maybe)
                           ("b" "Bookmark" entry (file "~/Org/inbox.org")
                            "* [[%?][]            :bookmark:unfiled: \n  %i\n")
                           ("d" "Diary" entry (file "~/Org/diary.org")
                            "* %<%Y-%m-%d %H:%M (%z)>\n\n%?"))
   ;;org-startup-indented t
   org-hide-leading-stars nil

   org-insert-heading '((heading . t) (plain-list-item . nil))
   org-cycle-separator-lines 1
   org-agenda-window-setup 'current-window
   org-log-done 'time)

  ;; (define-key org-mode-map (kbd "<S-up>") nil)
  ;; (define-key org-mode-map (kbd "<S-down>") nil)
  ;; (define-key org-mode-map (kbd "<S-left>") nil)
  ;; (define-key org-mode-map (kbd "<S-right>") nil)
  ;;
  ;; (define-key org-mode-map (kbd "C-c <up>") 'org-shiftup)
  ;; (define-key org-mode-map (kbd "C-c <down>") 'org-shiftdown)
  ;; (define-key org-mode-map (kbd "C-c <left>") 'org-shiftleft)
  ;; (define-key org-mode-map (kbd "C-c <right>") 'org-shiftright)

  ;; hack how org tries to find the color for the "invisible" star to INSIST
  ;; that it uses the colors I want (for some reason, when the 24 bit color is
  ;; used for the face foreground here in TTY it just ends up as white, rather
  ;; than being the exact color; so I'm fudging it to use a "near-enough" color
  ;; in TTYs)
  (defun org-find-invisible-foreground () "Stupid hack to force org-mode to obey." ()
         (if (window-system)
             "#0c1014"
           "gray8"))

  (add-hook 'org-mode-hook
            #'(lambda ()
                (setq-local truncate-lines nil)
                (setq-local fill-column 70)
                (setq-local auto-fill-mode t)
                (turn-on-auto-fill)))

  ;;(add-hook 'org-mode-hook #'visual-line-mode)

  ;; https://stackoverflow.com/questions/17215868/recursively-adding-org-files-in-a-top-level-directory-for-org-agenda-files-take#26548971
  (setq org-agenda-files
        (find-lisp-find-files "~/org" "\.org$")))

;; open web links in chromium (from org or elsewhere)
;; https://stackoverflow.com/questions/4506249/how-to-make-emacs-org-mode-open-links-to-sites-in-google-chrome/6309985#6309985
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;;- TODO, WTCH, READ, SOON, NEXT, |, DONE, DELG, CANC
;; english having no distinct spelling between present and past tense of "read"
;; is very very agrivating.
(setq org-todo-keywords
      '((sequence "TODO" "SOON" "NEXT" "NOW" "|" "DONE" "DELG" "CANC" )))

;; Other keybindings
(global-set-key
 (kbd "C-6")
 'mode-line-other-buffer)
(global-set-key
 (kbd "C-^")
 'mode-line-other-buffer)


;; source: https://www.emacswiki.org/emacs/TransparentEmacs
(defun zmd-frame-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque: ")
  (set-frame-parameter (selected-frame) 'alpha value))


(defun zmd-choose-scheme (choice)
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Choose a scheme:" '("gosh -i" "scheme" "chezscheme9.5" "kawa") nil t))))
  (setq scheme-program-name choice))

;; Use use-package to auto load and configure additional packages

;;
;; TODO(zmd): investigate the use of this :bind keyword for setting up
;;   bindings, looks nicer than the mish-mash of garbage I'm currently doing
;;

(use-package magit)

(use-package paredit
  :config
  ;; TODO(zmd): with-eval-after-load 'paredit ??
  (eval-after-load 'paredit
    '(define-key paredit-mode-map (kbd "C-j") nil)))

(use-package rainbow-delimiters)

(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("\.md\'" . markdown-mode))
  (add-hook 'markdown-mode-hook
            '(lambda()
               (setq-local indent-tabs-mode nil)
               (setq-local tab-width 4)
               (setq-local tab-stop-list '(4 8 16)))))

(use-package inf-ruby
  :config
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

(use-package company)

(use-package yasnippet)

(use-package go-mode
  :config
  (add-hook 'go-mode-hook
            '(lambda()
               (setq-local tab-width 2)
               (setq-local tab-stop-list '(2 4 6)))))

(use-package rust-mode)

(use-package coffee-mode
  :config
  (add-hook 'coffee-mode-hook
          '(lambda()
             ;;(setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))))
  (custom-set-variables '(coffee-tab-width 2)))

(use-package lua-mode
  :config
  (add-hook 'lua-mode-hook
          '(lambda()
             (electric-indent-local-mode -1)
             (setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6))
             (setq-local lua-indent-level 2))))

(use-package moonscript
  :config
  (add-hook 'moonscript-mode-hook
          '(lambda()
             ;;(setq-local electric-indent-mode nil)
             (setq-local indent-tabs-mode nil)
             (setq-local tab-width 2)
             (setq-local tab-stop-list '(2 4 6)))))

(use-package yaml-mode)

(use-package xterm-color
  :init
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))
  :config
  ;; all config copied from docs for xterm-color
  ;;(setq xterm-color-use-bold-for-bright t)
  (defun comint-add-hooks ()
    (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t))
  ;;(add-hook 'shell-mode-hook 'comint-add-hooks)
  ;;(add-hook 'alchemist-iex-mode-hook 'comint-add-hooks)
  ;;(add-hook 'inf-ruby-mode-hook 'comint-add-hooks)
  (add-hook 'comint-mode-hook 'comint-add-hooks)
  (require 'eshell)
  (add-hook 'eshell-before-prompt-hook
            (lambda ()
              (setq xterm-color-preserve-properties t)))
  (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
  (setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
  (setq compilation-environment '("TERM=xterm-256color"))
  (add-hook 'compilation-start-hook
            (lambda (proc)
              (when (eq (process-filter proc) 'compilation-filter)
                (set-process-filter
                 proc
                 (lambda (proc string)
                   (funcall 'compilation-filter proc
                            (xterm-color-filter string))))))))
(use-package helm
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

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package crux
  :config
  (global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
  (global-set-key (kbd "<home>") 'crux-move-beginning-of-line))

(use-package amx)

;; TODO(zmd): write (or steal) some hydras
(use-package hydra)

(use-package dumb-jump
  :config
  (dumb-jump-mode))

(use-package which-key
  :config
  (which-key-mode))

(use-package slime
  :config
  ;; Set your lisp system and, optionally, some contribs
  (setq slime-contribs '(slime-fancy))
  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
  (setq inferior-lisp-program "sbcl"))

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  ;;(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing nil)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-attr-indent-offset 2)
  (add-hook 'web-mode-hook
            '(lambda()
               (electric-indent-local-mode -1)
               (setq-local electric-indent-mode nil)
               (setq-local indent-tabs-mode nil)
               (setq-local tab-width 2)
               (setq-local tab-stop-list '(2 4 6)))))

(use-package alchemist)

(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config))
;;(load-theme 'Blow t)

(use-package lfe-mode)


(use-package erlang
  :config
  (let ((where-erlang-is
         (if (eq system-type 'darwin)
             "/usr/local/lib/erlang"
           "/usr/lib/erlang")))
    (setq erlang-root-dir where-erlang-is)
    (setq exec-path (cons (concat where-erlang-is "/bin") exec-path))
    (require 'erlang-start)))

(use-package tree-mode)

(use-package bui)

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package ht)

(use-package spinner)

(use-package lsp-mode
  :hook (scala-mode . lsp)
  :config (setq lsp-prefer-flymake nil))

(use-package helm-lsp)

(use-package company-lsp)

(use-package avy)

(use-package ace-window)

(use-package pfuture)

(use-package treemacs)

(use-package lsp-treemacs)

(use-package request)

(use-package lsp-ui)

(use-package lsp-java
  :after lsp
  :config
  (setq lsp-java-jdt-download-url "https://download.eclipse.org/che/che-ls-jdt/snapshots/che-jdt-language-server-latest.tar.gz")
  (add-hook 'java-mode-hook 'lsp))

(use-package dap-ui)
(use-package dap-mode
  :after lsp-mode dap-ui
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after (lsp-java))

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$"
  :interpreter
  ("scala" . scala-mode))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

;; TODO(zmd): hy cmd not detected b/c GUI emacs launched via UI doesn't have
;;   the pyenv context loaded (and thus doesn't know about the hy I install
;;   "globally" using pyenv...)
(use-package hy-mode)

(use-package toml-mode)

(use-package godot-gdscript
  :config
  (dolist (pattern '("\\.tscn\\'"
                   ;; Add more extensions here, if needed.
                   ))
    (add-to-list 'auto-mode-alist (cons pattern 'toml-mode))))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package queue)
(use-package a)
(use-package parseedn)
(use-package parseclj)
(use-package sesman)
(use-package peg)
(use-package edn)
(use-package jump)
(use-package findr)

(use-package smartparens)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package aggressive-indent)

(use-package clojure-mode
  :after clj-refactor yasnippet smartparens aggressive-indent
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1)               ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m")
    (subword-mode)
    (smartparens-strict-mode)
    (aggressive-indent-mode)
    (setq-local indent-tabs-mode nil))
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))
(use-package clojure-mode-extra-font-locking)

(use-package cider)

(use-package clj-refactor)
