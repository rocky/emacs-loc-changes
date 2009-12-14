(make-variable-buffer-local 'loc-changes-alist)
(defvar loc-changes-alist '()
  "A buffer-local association-list (alist) of line numbers and
their corresponding markers in the buffer. The 'key' is the line number; the value
the marker"
  )


(defun loc-changes-goto-line (line-number)
  "The Emacs `goto-line' docstring says it is the wrong thing to
use that function in a Lisp program. So here is something that I
proclaim is okay to use in a Lisp program."
  (unless (wholenump line-number)
    (error "Expecting line-number parameter `%s' to be a whole number"
	   line-number))
  (unless (> line-number 0)
    (error "Expecting line-number parameter to be greater than 0"))
  (let ((last-line (line-number-at-pos (point-max))))
    (unless (<= line-number last-line)
      (error 
       "Line number %d should not exceed %d, the number of lines in the buffer"
       line-number last-line))
    (goto-char (point-min))
    (forward-line (1- line-number)))
)


(defun loc-changes-add (line-number &optional opt-buffer)
  "Add a marker at LINE-NUMBER and record LINE-NUMBER and its
marker association in `loc-changes-alist'."
  (let ((buffer (or opt-buffer (current-buffer))))
    (with-current-buffer buffer
      (loc-changes-goto-line buffer)
      (setq loc-changes-alist 
	    (cons line-number (point-marker)) 
	    loc-changes-alist)
      ))
)

(defun loc-changes-clear (&optional opt-buffer)
  "Remove all location-tracking associations in BUFFER."
  (let ((buffer (or opt-buffer (current-buffer)))
	)
    (with-current-buffer buffer
      (setq loc-changes-alist '())
      ))
)

(defun loc-changes-resync (&optional opt-buffer)
  "Take existing marks and use the current (updated) positions for each of those.
This may be useful for example in debugging if you save the
buffer and then cause the debugger to reread/reevaluate the file
so that its positions are will be reflected."
  (error "To be continued....")
  )

(defun loc-changes-goto (position &optional opt-buffer no-update)
  "Go to the position inside BUFFER taking into account the
previous location marks. Normally if the position hasn't been
seen before, we will add a new mark for this position. However if
NO-UPDATE is set, no mark is added."
  (error "To be continued....")
  )

(provide 'loc-changes)
