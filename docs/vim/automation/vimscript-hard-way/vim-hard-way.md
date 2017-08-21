# Learn vimscript the hard way

These notes are based on [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/) by Steve Losh

## 1. Echoing messages

* `:echo "Hello, world!` echos to the bottom of the window
* `:echom` does the same but also saves the output in a message list. This can be viewed by executing `:messages`.

## 2. Options

* Pring the current value of an option by appending `?` e.g. `:set number?`
* Boolean Options e.g. `number` for line numbers
    - set by executing `:set number`
    - clear by appending `no` e.g. `:set nonumber`
    - toggle using `!` e.g. `:set number!`
* Some options take a value e.g. `:set numberwidth=10`
* Multiple options can be set at once e.g. `:set number numberwidth=10`

## 3. Basic Mapping

* `:map old new` whenever you type old then vim will replace it with new
* use `<>` to use special characters e.g. `<space>` or `<ctrl>`
* comments don't work here as map will replay the comment characters
