# Stow

Typically Linux applications stored user config/customisations in dot files in the users's home directory. To properly configure a new system it is not enough to just install the applications, we also need to bring over our dotfiles so that our apps will behave in the manner we expect.

The stow application will create symlinks from the home folder to scripts in another folder. It allows us to create a dotfiles repository with folder like vim, tmux etc and will correctly link the dotfiles in each to the home directory. This will also work for more complex folder structures such as vim plugins.

* https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
* http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html