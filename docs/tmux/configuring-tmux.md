# Configuring Tmux

## Tmux Config file

* `~/.tmux.conf` is the user's tmux config file. Can also have a global one in the `/etc/` folder
* Can define new shortcuts
* Can set up default environments

### Changing the config of a running session
* Reload config file using `source-file ~/.tmux.conf`

## Suggested Configuration Changes

* `set` command sets a option (short for `set-option`). Use the `-g` flag to make it global for all tmux sessions.
* `set -g prefix C-a`. Remap `PREFIX` to an easier key. `Ctrl-a` is easier to hit especially if you have remapped Caps Lock to Ctrl (and you have done that haven't you?). Unbind the existing prefix using `unbind C-b`.
    - `bind C-a send-prefix` will allow us to send `Ctrl-a` to an application by pressing it twice.
* Tmux adds a small delay when sending commands. To make this more responsive use `set -sg escape-time 1`.
* Having 0 based windows and pages isn't great considering the layout of the number keys on a keyboard. We can make the indexes start from 1 by adding `setw -g base-index 1` and `setw -g pane-base-index 1` to our `~/.tmux.conf` file. Note that these commands use `setw` which is short for `set-window-option`
* Turn the mouse off using `setw -g mode-mouse off`. It is better in the long run as the mouse will only slow you down.

## Suggested Shortcut Changes

* Can create new `PREFIX <char>` shortcuts using the `bind <char> <commands>` format.
* For example to bind `ctrl-r` to reload your `tmux.conf` file you can use `bind r source-file ~/.tmux.conf`
* Can add a display command to show in the status line that something was done e.g. `bind r source-file ~/.tmux.conf \; display "Reloaded!"`
* Can use `bind` with the `-n` prefix to create a binding that does not require the tmux `PREFIX`. However this will disable that binding for any application that's running in a tmux session so be very careful with this.
* `bind C-a send-prefix` - use this to be able to send `ctrl-a` to an application by presssing `ctrl-a` twice.

### Pane and Window Movement Shortcuts

* To spliting panes easier we remap these to use the | and - keys to create the appropriate split `bind | split-window -h` and `bind - split-window -v`

To make navigation between windows more `VIM` like we can remap the keys for moving between panes to `hjkl`.
```
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
```

We can also bind `ctrl-h` and `ctrl-l` to navigate between windows. Add these lines to the `~/.tmux.conf` file.
```
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
```

### Pane Resizing Shortcuts

* To resize a pane we can use the `resize-pane` command passing either `-U`, `-D`, `-L`, `-R` to specify the direction.
* To make this easier use the following rebindings. The `-r` flag makes the command repeatable so we can repeat the command by repeatedly pressing the key within 500 milliseconds.
```
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
```

## Visual Styling

* Make sure the correct color mode is set in Tmux. `set -g default-terminal "screen-256color"`
* This still didn't work for me so I needed to pass the `-2` argument to tmux when starting e.g. `tmux -2 attach`
* From vim to verify that this is working I used the [Xterm Color Table](https://github.com/guns/xterm-color-table.vim) plugin.