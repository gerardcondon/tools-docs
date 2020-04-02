# GDB

## Terminology
* **inferiors:** Something that you are using `gdb` to debug

## Features

### TUI Mode
* Text User Interface.
* Name makes no sense as this is the more graphical interface.
* You can start `gdb` in this mode from the command line **OPEN HOW?**

### Python
* `GDB` has built in a built in python interpreter
* **TODO** Google this to see what useful functionality is enabled by this**
  * Can execute python using `gdb.parse_and_eval(text)`
  * Can access breakpoint objects using `gdb.Breakpoint`
  * `help` command returns help docs
  * Sample usage
    - can add pretty printers for specific types
    - can make your own commands and use them to extend gdb

### Shell
* `shell` to run external commands

## Usage

### Stepping Commands
* `until` to step over a loop

### Breakpoints
* `tbreak` - temporary breakpoint that is removed as soon as it is hit
* `rbreak` - regex breakpoint
* `command` - used to specify a list of commands to run when a breakpoint is hit. Use `end` to terminate

* `save breakpoints $filename` - saves the breakpoints to the filename. Use `source $filename` to read them back in.

### Multithreaded Debugging
* `set follow-fork-mode child|parent`
* `set detach-on-fork off` - debug all inferiors

* `info threads` shows the number and details of threads
  * `continue -a` to continue all threads
    * this is unreliable though

### Printing
* `print $name_of_variable`
* built in variables e.g. $sp
* `info args` - print the values of the function arguments

### Dynamic Printf
**INVESTIGATE**
* `dprintf`
* add printfs to your code without recompiling
* sensitive to spaces
* different styles
  * gdb|call|agent
* can set functions e.g. fprintf

### Catch
* gdb can catch exceptions and syscalls
* use the `catch event` keyword
  * `catch throw`
  * `catch catch`

### Call functions
* `call $function_name`
* print may do this also
  * `print foo()`
* issues if signal or exception happens in the called function.

### Recording
* allows for reversing
* set a breakpoint before error and record & run
* Can also set a break point after and stop recording - useful for intermittent issues

### watchpoints
* watch address
* continue will go until address is modified
* can also do this in reverse if you have been recording the history
* rwatch stops when the memory is read from
* **INVESTIGATE** How to specify the address for the watch. Can I use variable or struct names?

## Config

### Core Files
* `gdb -c $core_file_name`

### GDBInit
* save as `~/.gdbinit`
* can use custom files for projects and source that
  * **TODO** Add `set print pretty on` to mine

## Things I would like to do with gcc
* **INVESTIGATE** List my files

## Resources
* Examples http://www.brendangregg.com/blog/2016-08-09/gdb-example-ncurses.html

## Other Front ends
* **INVESTIGATE** Voltron
* **INVESTIGATE** [Gdb Dashboard](https://github.com/cyrus-and/gdb-dashboard)
