
(setq-default ido-default-buffer-method 'selected-window
              ido-default-file-method 'selected-window)

;; IDO-snippets from https://www.emacswiki.org/emacs/InteractivelyDoThings#toc9
(ido-mode 1)
(ido-everywhere 1)

(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapatoms (lambda (x)
                (push (prin1-to-string x t) tag-names))
              tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(global-set-key (kbd "C-c t") 'ido-find-tag)
(global-set-key (kbd "C-c p") 'ido-find-file-in-tag-files)


(use-package smex
  :ensure t
  :bind ("M-x" . smex)
  :bind ("M-X" . smex-major-mode-commands)
  :bind ("C-c C-c M-x" . execute-extended-command)
  :config
  (smex-initialize))

(use-package ido-at-point
  :ensure t
  :config
  (ido-at-point-mode))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

;; TODO(zmd): Error in post-command-hook (ido-exhibit): (invalid-regexp "Trailing backslash")
;;     ::: related to issue where vertical display gets messaged up from time to time?
(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))
