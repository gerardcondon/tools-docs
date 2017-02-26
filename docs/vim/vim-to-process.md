
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

## Tasks

* Install Ctrl-p
* Find out a way to remove trailing whitespace



## INVS

* https://github.com/tpope/vim-sensible
* https://github.com/ludovicchabant/vim-gutentags
* http://learnvimscriptthehardway.stevelosh.com/
* https://github.com/vim-syntastic/syntastic
* https://github.com/vim-airline/vim-airline
* https://github.com/ctrlpvim/ctrlp.vim
* https://github.com/majutsushi/tagbar

## Resources

* https://codeyarns.com/tag/vim
* http://www.glump.net/files/2012/08/vi-vim-cheat-sheet-and-tutorial.pdf
* https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
* https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
* http://stevelosh.com/blog/2010/09/coming-home-to-vim/

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