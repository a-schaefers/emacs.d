
(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-ignore-order)
          (t . ivy--regex-plus)))

  ;; https://emacs.stackexchange.com/questions/38841/counsel-m-x-always-shows
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")

  (global-set-key (kbd "C-c C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (counsel-mode)

  ;; https://emacs.stackexchange.com/questions/33701/do-not-open-dired-for-directories-when-using-counsel-find-file/33706#33706
  (with-eval-after-load 'counsel
    (let ((done (where-is-internal #'ivy-done     ivy-minibuffer-map t))
          (alt  (where-is-internal #'ivy-alt-done ivy-minibuffer-map t)))
      (define-key counsel-find-file-map done #'ivy-alt-done)
      (define-key counsel-find-file-map alt  #'ivy-done))
    (define-key counsel-mode-map (kbd "M-y") nil)))

(use-package  counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))
