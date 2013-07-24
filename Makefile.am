SUBDIRS = test

lisp_files := $(wildcard *.el)
test_files := $(wildcard test/test-*.el)

EXTRA_DIST = $(lisp_files) $(test_files) README.textile

CHECK_FILES = $(notdir $(test_files:.el=.run))

lisp_LISP = $(lisp_files)

check: test

#: Run all tests without bloated output
check-short:
	$(MAKE) check 2>&1  | ruby make-check-filter.rb

if MAINTAINER_MODE

CL = ChangeLog
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif





