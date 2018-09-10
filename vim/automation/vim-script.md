# Vim Scripting

## Variables

* Vim built in variables use the following prefixes
    - `$` for environment variables
    - `&` for options
    - `@` for registers

## Functions

* See the predefined functions by invoking `:help function-list`
* User-defined functions have to start with an upper case character.

## Feature Checking

* To check if the currently installed Vim has a particular feature enabled/compiled in then we can use the `has(<feature-name>)` function.
* Use `:help feature-list` to see the list of available features.

## If-Else

```vim
if has("gui_running")
  colorscheme desert
else
  colorscheme darkblue
endif
```

* `if` must be matched with a closing `endif`
* `else` can be added as can `elseif`

## Looping