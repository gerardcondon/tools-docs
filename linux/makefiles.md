# Makefiles

* To see all available tasks execute ``
* `-d` enables debugging
* `-n` prints commands that would be executed but do not run them.
* To print the value of a variable add `print-%  : ; @echo $* = $($*)` to the Makefile and run `make print-VARIABLE` from the command line.
