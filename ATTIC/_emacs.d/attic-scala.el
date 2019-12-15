
(use-package scala-mode
  :config
  (setq ensime-left-margin-gutter nil))

(use-package sbt-mode)

(use-package ensime
  :config
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil))

(use-package kotlin-mode)
