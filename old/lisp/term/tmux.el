;; wrap around screen.el from standard emacs distribution for tmux
;; (tmux works better as tmux, not emulating screen)

(load "term/screen")

(defun terminal-init-tmux ()
  "Shim wrapping around terminal-init-screen"
  (terminal-init-screen))
