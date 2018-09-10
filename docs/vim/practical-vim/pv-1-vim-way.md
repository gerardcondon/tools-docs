# The Vim Way

## 1. Dot Command

* The `.` command repeats the last change
* Changes can operate on characters, lines and even the whole file.
* For example to delete a comment like `// ` at the start of a line you might enter `3dl`. Moving to the next line and pressing `.` will remove the comment characters from that line also.

## 2. Reduce Extraneous Movement

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

## 3. Use Idiomatic VIM commands for editing

* For complex editing we want a sequence of commands that (optionally delete current text and ) enter insert mode, insert changed text and exit insert mode.
* This can be repeated using the `.` command.
* If we do a search to find occurences of where to perform the operation then we can repeatedly make the change using `;` to repeat the search and `.` to make the change.

## 4. Act, Repeat, Reverse

* When facing a repetitive task try to make the motion and the change repeatable.
* `.` repeats the last change
* `@:` repeats the last Ex command (i.e. `:` commands)
* `;` repeats the last f<char>
* `n` searches againt for a pattern specified using `/`

* `u` undoes the last change or substitution
* `,` undoes the last find command (f<char>)
* `N` undoes the last `/` search

## 5. Find and Replace by Hand

* Idea is to make the first replacement by hand and then use the `.` command to repeat the next changes. Can be useful if you need to manually verify each change e.g. search/replace some instances of a text snippet.
* Can use `*` to seach for the word under the cursor at the moment and `n` to find the next match.
* Combining these we get the following workflow
    - Find the first instance of the text you are searching for
    - Press `*` to find the first instance that we wish to change (if not at it already)
    - make the change e.g. using `cw` to change a word. Drop into insert mode only once so that VIM records all the changes as a single edit.
    - now press `n` until you find the next instance you wish to change and `.` to make the change.

## 6. Dot Formula

* Ideally for repeated edits we would use the formula of one keystroke to move and another keystroke to edit e.g. `n.` as above.


