# Vim Multiple Views

## Different Parts of the same file

### Folding

* There are a number of ways to specify to vim where to select the code fold points. Indent or syntax is probably the best beginner method to start with `:set foldmethod=indent`
* `za` toggles the current fold. Create a shortcut like so `nnoremap <Leader>z za`
* By default when you open a file all the folds will be closed. To have all files open on opening a file add the following to your `.vimrc`
    `au BufRead * normal zR`
* `zc` closes the current fold and `zo` opens the current fold.
* For Python folding I found the default indent to allow too many folds. Also the default Python Vim syntax file has no support for folding. To get around this I used the [SimpylFold][] plugin.

* The default fold text doesn't look that great so I use this function from [dhruvasagar](http://dhruvasagar.com/2013/03/28/vim-better-foldtext) instead

```vim
    function! NeatFoldText() "{{{2
      let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
      let lines_count = v:foldend - v:foldstart + 1
      let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
      let foldchar = matchstr(&fillchars, 'fold:\zs.')
      let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
      let foldtextend = lines_count_text . repeat(foldchar, 8)
      let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
      return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    endfunction
    set foldtext=NeatFoldText()
    " }}}2
```

[SimpylFold]: https://github.com/tmhedberg/SimpylFold