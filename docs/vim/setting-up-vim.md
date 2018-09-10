# Setting Up VIM

This document details the steps I take to set up my personal VIM environment.

### Installation

* First step is to install VIM.
    * On Linux this is usually pre-installed but you can use a package manager like [yum][] or [apt-get][] to update it.
    * On Windows you can install [gVim][].
* If the version of VIM on the package manager is very old then you can build it yourself. Or if you need extra features to be built in then you need to do this. The process is relatively straightforward
    * Check out the repository from [Github](https://github.com/vim/vim)
    * Run `./configure` in src if you need to add extra features
    * Run `make` to build vim
    * Run `sudo make install` to install VIM to the system directories
    * After this step I needed to run `hash -r` in the bash shell to force bash to pick up the new VIM.

### Vimrc Customisation

* Create a `.vimrc` file in your home directory. Any customisations will be put in here. I recommend putting this under source-control. A common practice I've seen is for people to have a [dotfiles][] repository on [Github][].
* Use four spaces for tabs
```vim
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
```
* When I updated my VIM I lost syntax highlighting, so to get it back permanently I added `syntax enable` to my `.vimrc`
* Add a shortcut to mimic the escape key - http://learnvimscriptthehardway.stevelosh.com/chapters/10.html. I chose `jk` for this. This advantage here is that your fingers don't need to leave the home keys to enter normal mode.
* If you're editing the .vimrc file then an easy command to reload it is `:so %`

### Vundle

* [Vundle][] is a package manager for VIM. This should make managing VIM plugins a lot easier.
    - Clone the repository from git
    - Add the required lines from the website to the .vimrc
    - Start VIM and run `:PluginInstall`. This will install the plugins specified in the `.vimrc` file.

### NerdTree

* [Nerdtree][] is a useful package to view the directory structure as a tree from inside VIM - [guide](https://medium.com/usevim/nerd-tree-guide-bb22c803dcd2#.5lijrocgr).
* You can install it using Vundle by adding `Plugin 'scrooloose/nerdtree'` to your `.vimrc` file
* Now you should bind a key to toggle this on and off. To bind Ctrl-n to this add `map <C-n> :NERDTreeToggle<CR>` to the `.vimrc`.
* If the file that you're currently looking at is modified then NerdTree will open additional files in a new split buffer. Otherwise it will just use the existing buffer.
* Press `r` to refresh the current directory listing in Nerdtree.

### CTags
* Install [ctags][] on your system
* There are a number of [ways](http://ctags.sourceforge.net/faq.html#15) to manage tags files. For example, you can have a global file or have a tags file at each level of the directory structure. I've chosen to have a single file at the root of each project. This is due to dealing with multiple branches - each branch will have mostly the same tags and having them all in one global file would clash with each other.
* You can manually manage the tags files and rebuilding these. However this can get complicated. I've chosen to use a plugin [EasyTags][] to help with this. This [page](https://codeyarns.com/2015/03/21/easytags-plugin-for-vim/) has more information on using EasyTags.
* EasyTags will rebuild the tags for the current file when the cursor is inactive for a while.
* To set it up add these lines to the `.vimrc`
        Plugin 'xolox/vim-easytags'
        Plugin 'xolox/vim-misc'
* To force a rebuild of the tags for the current file run `UpdateTags`
* For the initial setup you will need to generate tags for the entire codebase so run `ctags -R .` from the command line at the folder where you want to create the tags file.
* You want to change where EasyTags searches for tag files using this system. You want it to start in the current folder and then go up until you hit the project tag file.
```vim
    set tags=./tags;
    let g:easytags_dynamic_files = 1
```
* EasyTags is fairly slow for large projects to to fix this I enabled async mode by adding these lines to my `.vimrc`
```vim
let g:easytags_async=1
let g:easytags_auto_highlight = 0
```

### TagBar

* [TagBar][] is a plugin to display the tags for that file in a sidebar organsed by scope. It requires [ctags][]
* Add `nmap <F8> :TagbarToggle<CR>` to toggle the tagbar by pressing F8

### Autocomplete
* Vim has autocomplete for the commands and also the tags pressing `U`, `p`, and then tab will fill out the `UpdateTags` command
* Similarly if I type `:tag R` this will start autocompleting the tags beginning with `R`.

### Whitespace
* Remap F5 to remove trailing whitespace at the end of a file
`:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>`
* There are various options for [highlighting](http://vim.wikia.com/wiki/VimTip396) and [removing](http://vim.wikia.com/wiki/Remove_unwanted_spaces) whitespace on Vim Wikia.

### Line Numbering

* Hybrid line numbering mode - useful for relative line jumps
```vim
set relativenumber
set number
```

[yum]: https://fedoraproject.org/wiki/Yum
[EasyTags]: https://github.com/xolox/vim-easytags
[gVim]: http://www.vim.org/download.php
[Vundle]: https://github.com/VundleVim/Vundle.vim
[Nerdtree]: https://github.com/scrooloose/nerdtree
[apt-get]: https://en.wikipedia.org/wiki/Advanced_Packaging_Tool
[ctags]: http://ctags.sourceforge.net/
[dotfiles]: https://dotfiles.github.io/
[Github]: https://github.com/
[TagBar]: https://github.com/majutsushi/tagbar