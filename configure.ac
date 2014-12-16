AC_INIT(emacs-loc-changes, 1.1)
AC_CONFIG_SRCDIR(loc-changes.el)
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE

##
## Find out where to install the debugger emacs lisp files
##
AM_PATH_LISPDIR
AM_CONDITIONAL(INSTALL_EMACS_LISP, test "x$lispdir" != "x")

AC_CONFIG_FILES([Makefile test/Makefile])
AC_OUTPUT
