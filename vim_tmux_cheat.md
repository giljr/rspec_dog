## Vim and tmux commands - reference

### Vim Commands

Esc → exit insert/visual mode, return to normal mode

i → enter insert mode

o → open a new line below and enter insert mode

O → open a new line above and enter insert mode

:w → save file

:w! → force save (override readonly)

:q → quit

:q! → quit without saving

dd → delete current line

2dd → delete 2 lines

dG → delete from current line to end of file

yy → yank (copy) current line

2yy → yank 2 lines

p → paste below cursor

P → paste above cursor

v → start visual mode (select characters)

V → start visual line mode (select whole line)

viw → select inner word

vaw → select a word including spaces

vi" → select text inside quotes

vi( → select text inside parentheses

u → undo last change

Ctrl+r → redo

Ctrl+Z → suspend Vim (return to shell)

:set noro → remove readonly mode



### tmux Commands

tmux new -s session_name → create new session

tmux ls → list sessions

tmux attach -t session_name → attach to session

tmux kill-session -t session_name → destroy session

Ctrl+b % → split pane vertically

Ctrl+b " → split pane horizontally

Ctrl+b o → switch between panes

Ctrl+b x → close current pane

Ctrl+b :source-file ~/.tmux.conf → reload tmux config

clear → clear terminal

### ✅ Optional workflow hints

Vim inside tmux → can edit multiple files in different panes

Undo/redo → u / Ctrl+r

Copy/paste text objects → v, V, viw, vaw, y, d, p

tmux splits → organize multiple shells or Rails servers