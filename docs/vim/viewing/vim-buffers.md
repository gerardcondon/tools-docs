# Vim Buffers

A buffer in VIM is equivalent to a tab in an editor like Sublime Text. It stores the contents of an open file.

## Navigating Buffers
* `:ls` brings up the list of open buffers
* `:bn` where `n` is a number of a buffer shown with `:ls`. Switch to the numbered buffer
* There is a plugin which improves this called [BufExplorer][]
    - Use `<Leader>be`, `<Leader>bt`, `<Leader>bv`, or `<Leader>bs` to bring up the buffer window where you can select which buffer to open using the `hjkl` keys

## Saving Buffers
* `:w` - saves the buffer
* Additional custom mappings that I've made
    - `<Leader>w` - save file from normal mode
    - `jk` - escapes from insert mode
    - `lkj` - save file from insert mode (and exit to normal mode)
    ```vim
    nnoremap <Leader>w :w<CR>
    inoremap jk <esc>
    inoremap lkj <Esc>`^:w<CR>
    ```

## Opening a file in a buffer
* `:e <filename>` - VIM will autocomplete the filename using the tab key. This will expand folder and file names.
* Vim has a current directory that you can see using `:pwd`. Use `:cd <directory>` to cd to a directory. To map `<Leader>cd` to change to the current file's directory use `nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>`

## Searching in a buffer

* Improve searching with these settings
```vim
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
```
* To clear the seach highlight use the :nohlsearch command. I've bound it to `<Leader>n`
```vim
" turn off search highlight
nnoremap <Leader>n :nohlsearch<CR>
```

[BufExplorer]: https://github.com/jlanzarotta/bufexplorer