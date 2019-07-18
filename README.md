# my-emacs-config
My EMACS configuration


## Key bindings:

__in progress__

### General

1. `

### Accessories

1. `C-c d` - insert current datetime in format: `%F %T` eq `%Y-%M-%d %h:%m:%s`
2. `C-c C-c d` - insert current datetime with format propmting

### Org-Mode

[More keybindings](https://orgmode.org/worg/orgcard.html)

#### Genereal

1. `<s`+Ent - insert code block

#### Structure editing

1. `M-RET` - insert new heading/item at current level
2. `C-RET` - insert new heading after subtree
3. `M-S-RET` - insert new TODO entry/checkbox item
4. `C-S-RET` - insert TODO entry/ckbx after subtree
5. `C-c -` - turn (head)line into item, cycle item type
6. `C-c *` - turn item/line into headline
7. `M-LEFT/RIGHT` - promote/demote heading
8. `M-S-LEFT/RIGHT` - promote/demote current subtree
9. `M-S-UP/DOWN` - move subtree/list item up/down

#### Tables

##### Creating a table

1. `C-c |` - convert region to table
2. `C-3 C-c |` - separator at least 3 spaces

##### Managing tables

1. `C-c C-c` - re-align the table without moving the cursor
2. `TAB` - re-align the table, move to next field
3. `S-TAB` - move to previous field
4. `RET` - re-align the table, move to next row
5. `M-a/e` - move to beginning/end of field
6. `M-LEFT/RIGHT` - move the current column left/right
7. `M-S-LEFT` - kill the current column
8. `M-S-RIGHT` - insert new column to left of cursor position
9. `M-UP/DOWN` - move the current row up/down
10. `M-S-UP` - kill the current row or horizontal line
11. `M-S-DOWN` - insert new row above the current row

## Features

### OS Shell

1. `M-x shell` opens OS shell in separate buffer to run system commands interactivelly
2. `M-x term` opens OS shell in separate buffer to run system commands interactivelly with full terminal emulation
