## Practical VIM

These are notes from [Practical VIM](https://pragprog.com/book/dnvim2/practical-vim-second-edition) from [Pragmatic programmers](https://pragprog.com/) by Drew Neil.

### 1. Dot Command

* The `.` command repeats the last change
* Changes can operate on characters, lines and even the whole file.
* For example to delete a comment like `// ` at the start of a line you might enter `3dl`. Moving to the next line and pressing `.` will remove the comment characters from that line also.

### 2. Reduce Extraneous Movement

* Vim has operations which are effectively compounds operations e.g. move the cursor to somewhere and start editing, e.g. `A` can be thought of as `$a`.
* Should favour these as it helps with the dot command - we don't need to position the cursor ourselves.
* Other examples
    - `C` - `c$`
    - `s` - `cl`
    - `S` - `^C`
    - `I` - `^i`
    - `A` - `$a`
    - `o` - `A<CR>`
    - `O` - `ko`

### 3. Use Idiomatic VIM commands for editing

* For complex editing we want a sequence of commands that (optionally delete current text and ) enter insert mode, insert changed text and exit insert mode.
* This can be repeated using the `.` command.
* If we do a search to find occurences of where to perform the operation then we can repeatedly make the change using `;` to repeat the search and `.` to make the change.
