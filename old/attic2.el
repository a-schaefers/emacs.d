;;
;; https://glyph.twistedmatrix.com/2015/11/editor-malware.html
;;
;; NOTE(zmd) 06-Oct-2018: the issues this addressed have been fixed in at least
;;   Emacs 26.1; the test of whether things are set up correctly given in the
;;   article does not give correct results under Emacs 26.1 (even though things
;;   ARE working correctly, as I verified via testing a different way).
;;
;;   This is the test that is no longer valid for newer emacs (gives false-positives that cert validation isn't working correctly):
;;
;;     (let ((bad-hosts
;;            (loop for bad
;;                  in `("https://wrong.host.badssl.com/"
;;                       "https://self-signed.badssl.com/")
;;                  if (condition-case e
;;                         (url-retrieve
;;                          bad (lambda (retrieved) t))
;;                       (error nil))
;;                  collect bad)))
;;       (if bad-hosts
;;           (error (format "tls misconfigured; retrieved %s ok"
;;                          bad-hosts))
;;         (url-retrieve "https://badssl.com"
;;                       (lambda (retrieved) t))))
;;
;; sudo apt install python-pip
;; python -m pip install --user certifi
(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python -m certifi")))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq tls-checktrust t)
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

;; https://stackoverflow.com/questions/6549622/adjusting-shell-mode-color-schemes#6550683
;; NOTE(zmd): set manually when using graphical-only frame
;;(setq ansi-color-names-vector
;;      ["black" "red" "limegreen" "gold" "steelblue" "mediumvioletred" "darkturquoise" "gray"])

;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

;; https://www.emacswiki.org/emacs/TransparentEmacs

(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(95 . 95) '(100 . 100)))))
(global-set-key (kbd "C-c C-t") 'toggle-transparency)
 Scroll wheel (OS X / iTerm2 / tmux)

;; Window navigation
(global-set-key
 (kbd "<S-up>")
 (lambda () (interactive) (windmove-dispatch 'up)))
(global-set-key
 (kbd "<S-down>")
 (lambda () (interactive) (windmove-dispatch 'down)))
(global-set-key
 (kbd "<S-left>")
 (lambda () (interactive) (windmove-dispatch 'left)))
(global-set-key
 (kbd "<S-right>")
 (lambda () (interactive) (windmove-dispatch 'right)))



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


(defun call-process-shell-command-in-frame-environment (cmd &optional in buf disp)
  (if (frame-parameter nil 'environment)
      (let ((process-environment
             (frame-parameter nil 'environment)))
        (call-process-shell-command cmd in buf disp))
    (call-process-shell-command cmd in buf disp)))



;; comint/shell-mode width hook (for emacc 24, 25 automatically seems to do do
;; the right thing
;; source: https://stackoverflow.com/questions/7987494/emacs-shell-mode-display-is-too-wide-after-splitting-window#11255996
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (set-process-window-size process (window-height) (window-width))))))

(defun my-shell-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t)
  (setq-local comint-prompt-regexp "^ .* \$ $")
  (display-line-numbers-mode 0))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)
