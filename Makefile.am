lispdir = @lispdir@

lisp_files := $(wildcard *.el)
lisp_LISP = $(lisp_files)

include common.mk

EXTRA_DIST = $(lisp_files) $(test_files) README.md THANKS

test_files := $(wildcard test/test-*.el)

if MAINTAINER_MODE

CL = ChangeLog
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif

#: Run all tests
test: check

#: Run all tests without bloated output
check-short:
	$(MAKE) check 2>&1  | ruby test/make-check-filter.rb

check:
	$(MAKE) -C test $@
