Keeps track of important buffer positions after buffer changes.

Sometimes it is useful to certain locations. For example these might
be error locations reported in a compilation. Or you could be inside a
debugger and when to change the source code but continue
debugger. Without this the positions that a compilation error report
or that a debugger refers to may be off from the modified source.

This package tries to ameliorate that by allowing a program to set
marks to track the original locations.
