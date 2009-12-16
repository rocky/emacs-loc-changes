(require 'cl)
(require 'test-unit)
(load-file "../loc-changes.el")

(test-unit-clear-contexts)

(setq sample-buffer (find-file-noselect "./sample.txt"))
(context "basic-tests"
	 (tag basic-tests)
	   (specify "loc-changes-goto-line error conditions"
		    (assert-raises error (loc-changes-goto-line "foo"))
		    (message "buffer %s" (current-buffer))
		    (assert-raises error (loc-changes-goto-line 0))
		    (assert-raises error (loc-changes-goto-line 10000)))
	   (specify "loc-changes-goto-line"
		    (save-excursion
		      (set-buffer sample-buffer)
		      (loc-changes-goto-line 5)
		      (assert-equal 5 (line-number-at-pos (point)))))
	   (specify "loc-changes-clear-buffer null"
		    (loc-changes-clear-buffer)
		    (assert-equal '() loc-changes-alist))

	   (specify "loc-changes-add-and-goto - update"
		    (save-excursion
		      (set-buffer sample-buffer)
		      (loc-changes-add-and-goto 10)
		      (assert-equal 10 (line-number-at-pos)
				    "point should be at line 10")
		      (assert-t (assq 10 loc-changes-alist)
				"Should find 10 in loc-changes-alist")
		      (assert-t (markerp (cdr (assq 10 loc-changes-alist)))
				"10 in loc-changes-alist should be a marker"))
		    )

	   (specify "loc-changes-goto - update"
		    (save-excursion
		      (set-buffer sample-buffer)
		      (loc-changes-goto 11)
		      (assert-equal 11 (line-number-at-pos)
				    "point should be at line 11")
		      (assert-t (assq 11 loc-changes-alist)
				"Should find 11 in loc-changes-alist")
		      (assert-t (markerp (cdr (assq 11 loc-changes-alist)))
				"11 in loc-changes-alist should be a marker"))
		    )

	   (specify "loc-changes-goto - no update"
		    (save-excursion
		      (set-buffer sample-buffer)
		      (loc-changes-goto 12 nil 't)
		      (assert-equal 12 (line-number-at-pos)
				    "point should be at line 12")
		      (assert-nil (assq 12 loc-changes-alist)
				  "Should not find 12 in loc-changes-alist")
		      )
		    )
	   )

(test-unit "basic-tests")
