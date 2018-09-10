# VIM Usage

These notes are how to use VIM in general use. They are based on [A Byte of VIM][] and [Practical VIM][].

## Modes
* Multiple modes - the aim to make mouse redundant so we switch navigation from the mouse to a VIM mode and use the keyboard
    - insert mode for text entry
    - normal mode for running commands (rewriting, editing)
    - visual mode to visually select text

## Commands

Press `:` to enter commands in VIM. You can use the up arrows to scroll through previous commands. You can also type a portion of the command and then press up to scroll through previous commands with that prefix.

* `:e <name>` - edit a file & create it if it doesn't exist
* `:w` - write (save) a file
* `:q` - quit editor
* `/query` - search for the next occurence of query
* `:help` - open the vim help

## Beginning to edit

Beginning editing starts from the normal mode. Some of these commands return you to normal mode after finishing editing.

* `.` - repeat the last normal mode change command

* `I` - go to the start of the line and enter insert mode
* `i` - switch to insert mode before the current postion

* `A` - go to the end of the line and enter insert mode
* `a` - switch to insert mode after the current position

* `O` - open a new line above the current line and enter insert mode
* `o` - open a new line below the current line and enter insert mode.

* `S` - substitute the entire line for a new one
* `s` - substitute the current character for a new one and stay in insert mode.

* `r` - replace the current character and go back to normal mode
* `R` - replace continuous characters and go back to normal mode

* `C` - change the rest of the line

## Single Character Edits

* `~` - change the case of the character under the cursor
* `x` - delete the character under the cursor
* `r` - replace the character under the cursor

## Navigation

* `h` - move left
* `j` - move down
* `k` - move up
* `l` - move right

* Adding a count before these will repeat the operation that amount of times.

### Line
* `^` - move to the start of the line
* `$` - move to the end of the line

### File

* `Ctrl-b` - move one screen up
* `Ctrl-f` - move one screen down
* `G` - move to the end of the file
* `1G` - move to the top of the file
* `50G` - move to line 50

### Window

* `H` - move to top of the visible window (High)
* `M` - move to middle of the visible window (Middle)
* `L` - move to bottom of the visible window (Low)

### Word

* `w` - move to the start of the next word
* `e` - move to the end of the next word
* `b` - move back to start of the previous word

### Sentence

* `(` - move to the previous sentence
* `)` - move to the next sentence
* `{` - move to the previous paragraph
* `}` - move to the next paragraph

### Mark

* This is a marker in a file identified by a single character (uppercase or lowercase) to which we can jump to
* `ma` - create a mark named a
* `'a` - jump to mark named a

### Location

* `Ctrl-o` - jump to the previous location
* `Ctrl-i` - jump to the next location

### Text selection

* Press `v` to enter visual mode
* Now combine `a` with a text object selector to select the text
    - `aw` - select a word
    - `ap` - select a paragraph
    - `ab` - select a block

## Windows/Buffers

* `:pc` - close any preview window open

## Cursor

* Vim can navigate based on what's under the cursor
* `gF` - go to the file under the cursor
* `g]` - go to the tag under the cursor

## Special/Unicode Characters

* To insert unicode characters type `Ctrl-vu` followed by the 4 digit hex code for that character.

## Misc

* From force of habit I sometimes press Ctrl-s in VIM. This hangs my version of VIM. To recover from this press Ctrl-q.

[Practical VIM]: https://www.amazon.com/Practical-Vim-Edit-Speed-Thought/dp/1680501275/ref=dp_ob_title_bk
[A Byte of VIM]: https://vim.swaroopch.com/
