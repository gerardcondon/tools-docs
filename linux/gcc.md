# GCC

* If you get the `hidden symbol ... DSO` error
  * Order of arguments to linker do matter. Put the static libraries after the .o files and before any `-shared` option.
  * Can use `nm -gC` to list the symbols that are exported by an so.
