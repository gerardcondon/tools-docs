
#### NeoComplete & Neosnippets

* Tried YCM but the version of the kernel we use is too old - hard to compile the required bits and pieces
* [NeoComplete][]
* [NeoSnippet][]
* [default snippets](https://github.com/Shougo/neosnippet-snippets)
    - TODO - How to add my own snippets


    let g:neocomplete#enable_at_startup = 1


    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif

#### Visual Mode Selection
vmap v <Plug>(expand_region_expand)
 63 vmap <C-v> <Plug>(expand_region_shrink)

#### Degrade VIMRC
In case of errors in the vimrc you may want to ignore these so that VIM will start up without needing an enter key to be pressed. This can be useful when trying to switch to an optional color scheme. Without this vim acan't be started in command mode so tasks like updating plugins from the command line become a lot harder.
* https://sanctum.geek.nz/arabesque/gracefully-degrading-vimrc/

### Syntastic
 set statusline+=%#warningmsg#
 83 set statusline+=%{SyntasticStatuslineFlag()}
 84 set statusline+=%*
 85
 86 let g:syntastic_always_populate_loc_list = 1
 87 let g:syntastic_auto_loc_list = 1
 88 let g:syntastic_check_on_open = 0
 89 let g:syntastic_check_on_wq = 0

https://github.com/vim-syntastic/syntastic/issues/1203

## Tasks

* Install Ctrl-p
* Find out a way to remove trailing whitespace

## Indentation
http://stackoverflow.com/a/5212123/1131820

## INVS

* https://github.com/tpope/vim-sensible
* https://github.com/ludovicchabant/vim-gutentags
* http://learnvimscriptthehardway.stevelosh.com/
* https://github.com/vim-syntastic/syntastic
* https://github.com/vim-airline/vim-airline
* https://github.com/ctrlpvim/ctrlp.vim
    - http://www.bestofvim.com/plugin/ctrl-p/
- https://github.com/vim-airline/vim-airline
* https://github.com/tpope/vim-surround
* http://www.vim.org/scripts/script.php?script_id=2425
* http://learnvimscriptthehardway.stevelosh.com/chapters/18.html

## Resources

* https://codeyarns.com/tag/vim
* http://www.glump.net/files/2012/08/vi-vim-cheat-sheet-and-tutorial.pdf
* https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
* https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
* http://stevelosh.com/blog/2010/09/coming-home-to-vim/
* http://www.bestofvim.com/
*
## C++

* http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
* http://stackoverflow.com/questions/4237817/help-with-configuring-vim-for-c


## Videos

* https://vimeo.com/album/2838732
* https://www.youtube.com/watch?v=rfl9KQb_HVk




## INVS

### Tmux & VIM
* https://teamgaslight.com/blog/vim-plus-tmux-a-perfect-match
* http://tilvim.com/2014/07/30/tmux-and-vim.html
* http://meirkriheli.com/talks/tmux-vim/#/
* https://github.com/tmuxinator/tmuxinator
* https://blog.bugsnag.com/tmux-and-vim/

# Misc
https://medium.com/usevim/vim-101-registers-f6ad105dfd89#.cmuqxbbq0

* leader - https://medium.com/usevim/vim-101-what-is-the-leader-key-f2f5c1fa610f#.bd2c7vv3t

* Pretty Print JSON https://pascalprecht.github.io/2014/07/10/pretty-print-json-in-vim/

* http://derekwyatt.org/vim/tutorials/index.html

* Current directory - changing, printing current

## Windows

* https://www.alexwhittemore.com/gvim-with-powerline-on-windows-8-64bit/
* https://github.com/powerline/fonts/pull/18
* http://stackoverflow.com/questions/19105279/how-can-i-setup-my-vim-airline-or-vim-powerline