: ; exec $(/usr/bin/which emacs) -batch -load "$0" -f "main" -- "$@"
;;; -*- lexical-binding: t -*-

(require 'cl-lib)

(defun greet ()
  (princ "Hello, world.\n"))

(defun main ()
  (greet))
