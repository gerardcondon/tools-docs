# Insert Mode

Most VIM commands are triggered from other modes but some can be invoked from insert mode.

## 13. Make corrections instantly from Insert Mode.

* Can use the backspace key to delete from insert mode.
* Probably better to delete the entire word and try again.
* Can use the following from insert mode. Unlike backspace you won't need to move your hands far from the home row.
    - `Ctrl-h` delete one character
    - `Ctrl-w` delete one word
    - `Ctrl-u` delete back to the start of the line

## 14. Get back to Normal Mode

* Can use either `Esc` or `Ctrl-[` to get back to normal mode from insert mode
* Insert Normal mode switches back to normal mode for one operation and then returns to insert mode. Press `Ctrl-o` from insert mode to enter it.

## 15. Paste from a Register without leaving Insert Mode

* Use `Ctrl-R <register-number>` to paste the contents of the specified register while in insert mode.
* However this replays the characters one at a time. Instead `Ctrl-r Ctrl-p <register-number>` inserts the text and fixes any indentation.



[here]