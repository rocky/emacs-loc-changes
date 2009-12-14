(require 'cl)
(require 'test-unit)
(load-file "../loc-changes.el")

(test-unit-clear-contexts)

;; Define a test named `foo'.
(context "basic-tests"
	 (tag basic-tests)
	 (specify "loc-changes-goto-line error conditions"
		  (assert-raises error (loc-changes-goto-line "foo"))
		  (assert-raises error (loc-changes-goto-line 0))
		  (assert-raises error (loc-changes-goto-line 10000)))
	 (specify "loc-changes-goto-line"
		  (save-excursion
		    (loc-changes-goto-line 5)
		    (assert-equal 5 (line-number-at-pos (point)))))

)

(test-unit "basic-tests")
