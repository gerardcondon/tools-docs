# Vimcasts

These notes are based on [VimCasts](http://www.vimcasts.org)

## Whitespace

## 1. Show invisibles

* Add keybinding to toggle between showing visible and non-visible characters
```vim
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
```

* To change to use more standard keybindings
```vim
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
```

* Can update colour schemes to make these more discreet

[Screencast Link](http://vimcasts.org/episodes/show-invisibles/)

## 2. Tabs and Spaces

* **Tabstop** Specifies the width of a tab character
* **Expandtab** When enabled, uses spaces instead of tabs
* **Softtabstop** Fine tunes the amount of whitespace to be inserted
* **Shiftwidth** the amount of whitespace to insert or remove using the indentation commands

* Using spaces ensure that `softtabstop == shiftwidth`

## 3. Whitespace preferences and filetypes

* Can change whitespace settings for a particular filetype using `autocmd FileType <filename>`.
* For example, make requires tabs to indent instead of spaces so can use `autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab`

* `autocmd FileType javascript <command>` will execute the command whenever the filetype changes to javascript
* `setlocal` ensures that whatever changes are only made to the open buffer and not globally.

* To enable filetype detection add `filetype on` to the `.vimrc` file.
* In the `.vimrc` can use `if has("autocmd")` so that on a vim without autocmd support, the FileType commands will be skipped

* To treat a specific filetype as another use the `setfiletype` command. For example, `autocmd BufNewFile,BufRead *.rss setfiletype xml`

## 5. Indentation Commands

* Use the angle bracket keys to indent.
* In normal mode use `>>` to indent the current line. Prepend this with a count to indent a number of lines
* In visual mode use a single '>' to indent the visual selection. This will drop you back out of visual mode. Use the `.` operator to repeat the indentation and `u` to undo the indentation.
* `<<` and `<` unindents
* Use `==` to auto-indent the current line (`=` in visual mode)
* These commands can be used with motions e.g. `=i}` will auto-indent the current inner block. `=G` will auto-indent until the end of the file.

## 6. Working with Buffers

* `:ls` - show the buffer list
* `:bn` - open the next buffer
* `:bp` - open the previous buffer
* `Ctrl-^` - switch to the alternate file (displayed with the # in ls)

### Hidden Buffers

* `+` sign in ls means that the buffer has been modified
* A hidden buffer has unsaved changed and is not loaded in a window
* `:w` saves the buffer
* `:e!` reverts any changes
* `:q!` quits Vim and discards any changes in any buffers.

## 7. Working with Windows

* We can split the current window and open the same file in the new window. This gives us two views into the same file.
  * `Ctrl-w s` split the window horizontally
  * `Ctrl-w v` split the window vertically
* We can also open a different file in the new window
  * `:sp filename` open filename in a new horizontal split
  * `:vsp filename` open filename in a new vertical split

### Closing split windows
* `:q[uit]` closes the current window
* `:on[ly]` closes all the other windows except for the currently active one

### Navigating between windows
* `Ctrl-w w` cycle between the open windows
* `Ctrl-w h` move to the window on the left
* `Ctrl-w j` move to the window below
* `Ctrl-w k` move to the window above
* `Ctrl-w l` move to the window on the right

[VimCast Episode 7](http://vimcasts.org/episodes/working-with-windows/)

## 8. Working with tabs

In Vim tabs are used to have different layouts for viewing buffers. The same buffer can be open in multiple tabs.

* `:tabedit filename` opens the file in a new tab
* `Ctrl-W T` moves the current split window to its own tab
* `:tabclose` closes the current tab page and all its windows
* `:tabonly` closes all other tabs except the current tab

### Navigating between tabs

* `gt` move to the next tab
* `gT` move to the previous tab
* `<number>gt` move to the specific tab number. Note that tabs are numbered from 0.
* `:tabmove` move the tab to the end.
* `:tabmove <number>` move the tab to the specified tab position.

[VimCast Episode 8](http://vimcasts.org/episodes/working-with-tabs/)


