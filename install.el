#!/bin/sh
":"; exec emacs --quick --script "$0" -f "main" -- "$@" # -*- mode: emacs-lisp; lexical-binding: t; -*-

(require 'cl-lib)

(defun main ()
  (princ "TODO(zmd): write installer?\n"))
