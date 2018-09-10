# Normal Mode

* Vim's natural resting state. This is different to most other editors which spend their default time in something like insert mode.

* Many normal mode commands can be execute with a count to run them multiple times.

* Normal mode commands can be combined with movement operators to define the extent of their effect.

## 7. Pause with your Brush off the Page

* Most of the time spent writing is not actually spent entering text. A lot is taken up by thinking, reading, navigating.
* Also a lot of editing does not get done in insert mode e.g. copy and pasting, deleting, reformatting.

## 8. Chunk your undos

* In VIM we can control the granularity of the undo command. The undo command `u` will undo the last portion of text entered in insert mode.
* So by regularly dropping back out to normal mode we can make uno operate on the size of text of our choosing.
* For example escaping to normal mode after eaach sentence means that undo will operate on the sentence leve.
    - In practice escape back to normal mode and press A to append text.
    - Or to enter a newline use `<Esc>o` instead of `<CR>`
* If you've paused long enough to leave insert mode then do it!

## 9. Compose repeatable changes

* There's often more than one way to do things in vim. If there is a choice then choose the one than can be repeated using the dot operator.
* This will often be a single command that has the selection embedded into it e.g. `daw`, as opposed to one or two commands where the dot would only repeat the last part e.g. `bdw`.

## 10. Use Counts to Do Simple Arithmetic

* Many of the commands available in normal mode can be prefixes with a count to indicate how many times vim should execute the command.
* `Ctrl-a` and `Ctrl-x` perform addition and subtraction on numbers. These can be prefixed with a count to add or subtract a specific number.
* Cursor doesn't have to be on the number. These operate on the next number after the cursor.
* Vim treats numbers beginning with a leading 0 as octal. To force all numbers to be treated as decimal add `set nrformat=` to the `.vimrc` file.

## 11. Don't count if you can repeat

* When you use count then the undo command operates on the full counted operation e.g. d6w will delete six words and `u` will undo all of those changes
* If you use repeat then `u` is more granular. `dw.....` will also delete six words but each `u` will undelete a single word.
* It depends on the use case which is better for you - a more coherent undo history or a more granular one.

## 12. Combine and Conquer

* **Operator + Motion = Action**
* Operators can operate on a wide range of text objects e.g. single character, complete word or entire paragraph.
* This is defined by the motion entired after the operator e.g. `aw` for a word or `ap` for a paragraph.
* Some operators are two characters e.g. `g~` to change case.
* When an operator is invoked in duplicate then it operates on the entire line.
* We can make custom operators which operate on the existing motions and also custom motions e.g. entire file which can handle the existing operators.