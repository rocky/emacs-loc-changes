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

CR_EXCEPTIONS=copyright_exceptions
#: Check for GNU Copyrights.
check_copyrights:
	@echo "Compute exceptions >$(CR_EXCEPTIONS)~"
	@export LANG=C;							\
	find . -name '.git' -prune -o -name '*.el' -print0 |		\
	    xargs -0 grep -L 'Free Software Foundation, Inc' |		\
	    grep -v '\(\.dir-locals\|.-\(pkg\|autoloads\)\)\.el$$';	\
	find . -name '.git' -prune -o -name '*.el' -print |		\
	    while read f; do						\
	        fquoted="$$(echo $$f|tr '|' '_')";			\
	        sed -n -e '/[Cc]opyright.*, *[1-9][-0-9]*,\?$$/N'	\
	            -e '/Free Software Foundation/d'			\
	            -e "s|^\\(.*[Cc]opyright\\)|$$fquoted:\\1|p" 	\
	           "$$f";						\
	    done | sort >$(CR_EXCEPTIONS)~
	diff -u "$(CR_EXCEPTIONS)" "$(CR_EXCEPTIONS)~"
