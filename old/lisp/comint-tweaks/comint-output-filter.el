;;;
;;; Modified by Zeb DeOs <zebdeos@bayprogrammer.com>
;;;
;;;   17-June-2018:
;;;
;;;     * extracted comint-ouput-filter function from comint.el distributed
;;;       with Emacs 24.5.1
;;;
;;;     * modified comint-output-filter to disable overwriting ansi colors in
;;;       prompt
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

;; The purpose of using this filter for comint processes
;; is to keep comint-last-input-end from moving forward
;; when output is inserted.
(defun comint-output-filter (process string)
  (let ((oprocbuf (process-buffer process)))
    ;; First check for killed buffer or no input.
    (when (and string oprocbuf (buffer-name oprocbuf))
      (with-current-buffer oprocbuf
	;; Run preoutput filters
	(let ((functions comint-preoutput-filter-functions))
	  (while (and functions string)
	    (if (eq (car functions) t)
		(let ((functions
                       (default-value 'comint-preoutput-filter-functions)))
		  (while (and functions string)
		    (setq string (funcall (car functions) string))
		    (setq functions (cdr functions))))
	      (setq string (funcall (car functions) string)))
	    (setq functions (cdr functions))))

	;; Insert STRING
	(let ((inhibit-read-only t)
              ;; The point should float after any insertion we do.
	      (saved-point (copy-marker (point) t)))

	  ;; We temporarily remove any buffer narrowing, in case the
	  ;; process mark is outside of the restriction
	  (save-restriction
	    (widen)

	    (goto-char (process-mark process))
	    (set-marker comint-last-output-start (point))

            ;; Try to skip repeated prompts, which can occur as a result of
            ;; commands sent without inserting them in the buffer.
            (let ((bol (save-excursion (forward-line 0) (point)))) ;No fields.
              (when (and (not (bolp))
                         (looking-back comint-prompt-regexp bol))
                (let* ((prompt (buffer-substring bol (point)))
                       (prompt-re (concat "\\`" (regexp-quote prompt))))
                  (while (string-match prompt-re string)
                    (setq string (substring string (match-end 0)))))))
            (while (string-match (concat "\\(^" comint-prompt-regexp
                                         "\\)\\1+")
                                 string)
              (setq string (replace-match "\\1" nil nil string)))

	    ;; insert-before-markers is a bad thing. XXX
	    ;; Luckily we don't have to use it any more, we use
	    ;; window-point-insertion-type instead.
	    (insert string)

	    ;; Advance process-mark
	    (set-marker (process-mark process) (point))

	    (unless comint-inhibit-carriage-motion
	      ;; Interpret any carriage motion characters (newline, backspace)
	      (comint-carriage-motion comint-last-output-start (point)))

	    ;; Run these hooks with point where the user had it.
	    (goto-char saved-point)
	    (run-hook-with-args 'comint-output-filter-functions string)
	    (set-marker saved-point (point))

	    (goto-char (process-mark process)) ; In case a filter moved it.

	    (unless comint-use-prompt-regexp
              (with-silent-modifications
                (add-text-properties comint-last-output-start (point)
                                     '(front-sticky
				       (field inhibit-line-move-field-capture)
				       rear-nonsticky t
				       field output
				       inhibit-line-move-field-capture t))))

	    ;; Highlight the prompt, where we define `prompt' to mean
	    ;; the most recent output that doesn't end with a newline.
	    (let ((prompt-start (save-excursion (forward-line 0) (point)))
		  (inhibit-read-only t))
	      (when comint-prompt-read-only
		(with-silent-modifications
		  (or (= (point-min) prompt-start)
		      (get-text-property (1- prompt-start) 'read-only)
		      (put-text-property (1- prompt-start)
					 prompt-start 'read-only 'fence))
		  (add-text-properties prompt-start (point)
				       '(read-only t front-sticky (read-only)))))
	      (when comint-last-prompt
		(remove-text-properties (car comint-last-prompt)
					(cdr comint-last-prompt)
					'(font-lock-face)))
	      (setq comint-last-prompt
		    (cons (copy-marker prompt-start) (point-marker))))
	    (goto-char saved-point)))))))

)


(provide 'comint-tweaks/comint-output-filter)
