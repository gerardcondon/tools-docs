# Marks

Vim allows us to mark our place in a file and jump back to it later. There are a number of different marks that can be created. For example we can create marks that just apply within a file, or can create marks that apply across all files.

* `m<a-zA-Z>` creates a mark.
* `'<a-zA-Z>` jumps to the particular mark.

## Local Marks

Lowercase marks i.e. those created using `a-z` are unique to a file only. We can have marks with the same name in different files and they will not clash with each other. For example, we could add a mark `t` to indicate the top of each file. In this case each file will have a separate `t` mark and pressing `'t` will jump to the top of the file.

## Global Marks

Uppercase marks i.e. those created using `A-Z` are global across all files. If we create a mark `A` in a file then no matter what other file we are in, pressing `'A` will jump us to that mark in that file.
