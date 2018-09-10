# Searching

* To search for a piece of text type `/text<cr>` in normal mode.
* Press `n` to go to the next occurence
* Press `N` to go to the previous occurence

## Recommended Options

* `set incsearch` to start searching as soon as you start typing the search phrase.

## Regex Searches

* `\<` and `\>` match the start and end positions of a word so `/\<text\>` will find only exactly text and not when it's part of a longer word.
* `/\d` will seach for a digit. `/\d\+` will search for multiple digits.



