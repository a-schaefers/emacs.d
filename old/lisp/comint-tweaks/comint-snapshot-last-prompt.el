;;;
;;; Modified by Zeb DeOs <zebdeos@bayprogrammer.com>
;;;
;;;   17-June-2018:
;;;
;;;     * extracted comint-snapshot-last-prompt function from comint.el
;;;       distributed with Emacs 24.5.1
;;;
;;;     * modified comint-snapshot-last-prompt to disable overwriting ansi
;;;       colors in prompt
;;;
;;;     * use conditional to scope modification to only apply to Emacs 24
;;;
;;; Original copyright & license statement follows (note, this file as modified
;;; is NOT part of the official GNU Emacs distribution):
;;;

;;; comint.el --- general command interpreter in a window stuff -*- lexical-binding: t -*-

;; Copyright (C) 1988, 1990, 1992-2015 Free Software Foundation, Inc.

;; Author: Olin Shivers <shivers@cs.cmu.edu>
;;	Simon Marshall <simon@gnu.org>
;; Maintainer: emacs-devel@gnu.org
;; Keywords: processes
;; Package: emacs

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.


(if (= emacs-major-version 24)

(defun comint-snapshot-last-prompt ()
  "Snapshot the current `comint-last-prompt'.
Freezes the `font-lock-face' text property in place."
  (when comint-last-prompt
    ;; Reset comint-last-prompt so later on comint-output-filter does
    ;; not remove the font-lock-face text property of the previous
    ;; (this) prompt.
    (setq comint-last-prompt nil)))

)


(provide 'comint-tweaks/comint-snapshot-last-prompt)
