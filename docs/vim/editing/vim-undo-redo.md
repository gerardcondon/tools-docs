# Undo/Redo

* `u` in normal mode undoes the last change
* `Ctrl-r` in normal mode redoes an undo change

* You can view the undo list using `:undolist`
* You can go back a number of changes by using `:undo <num>` where num is how many changes to undo

* You can also use time based commands to go back and forth
    - `:earlier 4m` will take you back to the state of the buffer by 4 minutes
    - `:later 45s` will take you later by 45 seconds
