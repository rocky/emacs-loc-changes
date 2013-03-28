<<<<<<< HEAD
lispdir = @lispdir@
=======
SUBDIRS = test

>>>>>>> 9425cc240e407505192b883ddc3bb7ac9fb6477c
lisp_files := $(wildcard *.el)
lisp_LISP = $(lisp_files)

<<<<<<< HEAD
include common.mk

EXTRA_DIST = $(lisp_files) $(test_files) README.textile

test_files := $(wildcard test/test-*.el)
=======
check: test
>>>>>>> 9425cc240e407505192b883ddc3bb7ac9fb6477c

if MAINTAINER_MODE

CL = ChangeLog
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif

<<<<<<< HEAD
#: Run all tests
test: check
=======
>>>>>>> 9425cc240e407505192b883ddc3bb7ac9fb6477c

#: Run all tests without bloated output
check-short:
	$(MAKE) check 2>&1  | ruby make-check-filter.rb

check:
	$(MAKE) -C test $@
