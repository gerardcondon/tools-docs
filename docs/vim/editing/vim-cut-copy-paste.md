# Cut, Copy and Paste

Vim has support for these but uses different terms. This has implications for the shortcuts used.

| Operation | Vim    | Shortcut |
| -- | -- | -- |
| Cut       | Delete | `d`      |
| Copy      | Yank   | `y`      |
| Paste     | Paste  | `p`      |

## Text Objects

To perform these operations in VIM we need to specify which text objects to operate on.

| Key | Text Object                                  |
| -- | -- | 
| l   | One character at the current cursor position |
| w   | The rest of the word from the current cursor position |
| ap  | A paragraph |

Lines are a special case. To operate on them, repeat the command e.g. `dd` deletes the current line, `yy` copies the current line.

## Paste

To paste the text after the cursor press `p`. To paste the text before the cursor press `P`.

### Special Examples

* `xp` - swaps two characters
* `dwwp` - swaps two words