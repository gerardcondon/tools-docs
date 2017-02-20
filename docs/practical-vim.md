## Practical VIM

These are notes from [Practical VIM](https://pragprog.com/book/dnvim2/practical-vim-second-edition) from [Pragmatic programmers](https://pragprog.com/) by Drew Neil.

### Dot Command

* The `.` command repeats the last change
* Changes can operate on characters, lines and even the whole file.
* For example to delete a comment like `// ` at the start of a line you might enter `3dl`. Moving to the next line and pressing `.` will remove the comment characters from that line also.