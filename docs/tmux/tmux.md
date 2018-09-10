# TMUX

## What is tmux

* tmux is a terminal multiplexer.
* It can launch multiple terminals from a single environment - effectively new terminal tabs
* It can divide the window into panes
* It can detach from a session and keep it running in the background

## Installation
* You can install tmux using a package manager e.g. `sudo yum install tmux`
* However the version that this uses may be quite old so another approach is to build it yourself from source
    * This script here details the steps needed https://gist.github.com/xkniu/0b752143a5990cdb3379
    * To get libevent 2.x installed I ran `sudo yum install libevent2-devel`

## Basic usage

* `PREFIX` - this is the tmux prefix. By default this is `ctrl-b` but you can remap this to an easier key. The most common one I've seen is to remap it to `ctrl-a`. This works especially well if you also remap the `Caps Lock` key to `Ctrl`.

## Tmux Sessions

Typically these commands would be run outside the tmux session

* `tmux new -s session_name` - create a new session with the given session name
    - pass the `-d` flag to create this session in the background
* `tmux ls` - list the running sessions
    - if there are no running sessions then you will see this error `failed to connect to server: Connection refused`
* `tmux attach` - if there is only one session running then attach to it
* `tmux attach -t session_name` - attach to a specified session
* `tmux kill-session -t session_name` - kill the session specifed by the session name

Typically these commands would be run from inside tmux session

* `PREFIX d` - detach from a session. This keeps the session alive and allows you to reconnect to it later.
* `exit` - exits tmux and kills session

## Windows

* Windows in Tmux are a collection of panes.
* They are similar to tabs in a browser.
* Killing all open windows will kill the tmux session.


* `PREFIX c` - Create a new window with a shell
* `PREFIX ,` - We can name windows so that we can more easily identify them later. This command renames the current window.
* `PREFIX &` - Kill the current window

* Closing windows by default will not renumber the existing windows.
    - Use `movem` to renumber the current window
    - Use `movew -r` to renumber all the windows
    - TODO Add `set-option -g renumber-windows on` to the `tmux.conf` to enable automatic renumbering.

### Windows Navigation

* `PREFIX p` - move to the previous window
* `PREFIX n` - move to the next window
* `PREFIX w` - display a visual menu of the windows. Select window and press enter
* `PREFIX &` - kill the current window

Each window has an index and we can jump to a window directly if we know its index

* `PREFIX x` - x is any digit between 0 and 9. Jump to the window with the given index.
* Having 0 based windows isn't great considering the layout of the number keys on a keyboard. We can make the indexes start from 1 by adding `setw -g base-index 1` to our `~/.tmux.conf` file

* We can find a window by name by typing `PREFIX f`

## Panes

* We can split the current window into panes both horizontally and vertically
* `PREFIX %` - splits the window vertically
* `PREFIX *` - splits the window horizontally
* To make this easier we remap this to use the | and - keys to create the appropriate split `bind | split-window -h` and `bind - split-window -v`

* `PREFIX o` - cycle to the next pane
* can use `PREFIX` followed by the arrow keys to move around the panes.

* `PREFIX x` - kill the current pane. If this was the only pane then this closes the window also.

### Resizing

* Tmux has a number of predefined layouts for panes
* Cycle through these using `PREFIX SPACEBAR`
    - `even-horizontal`
    - `even-vertical`
    - `main-horizontal`
    - `main-vertical`
    - `tiled`

## Command Mode

* These prefix combinations are actually shortcuts to tmux commands with preset options.
* You can invoke these directly from the command mode or scripts
* Press `:` to enter command mode
* `PREFIX ?` - list all the tmux bindings

## Resources
* [tmux - Productive Mouse-Free Development](https://pragprog.com/book/bhtmux/tmux) by Brian P. Hogan
