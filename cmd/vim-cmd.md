##### INSTALLING/UPDATING VIM with PYTHON
```
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --enable-python3interp --with-python3-command=python3
cd src
make
sudo make install

mkdir ~/.vim_backups/
```

##### Replace all import folder with /index in ts files.

```
:grep -R "/';" .

:cdo %s/\/';/\/index';/ | update
```

##### Install Vim Plug
https://github.com/junegunn/vim-plug
```
mkdir ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### Installing COC Autocomplte
```
ln -s ~/repo/config/coc-settings.json ~/.vim/coc-settings.json
:CocInstall coc-tsserver coc-json coc-css
```

##### Installing YouCompleteMe

```
cd ~/.vim/plugged/YouCompleteMe
python3 ./install.py --ts-completer
```

```
cd ~/.vim/plugged/YouCompleteMe
python3 ./install.py --all
```

```
cd ~/.vim/plugged/YouCompleteMe
./install.py
```

#### SEARCH FOR A PATTER OR A STRING IN DIFFERENT FILES OF THE PROJECT AND REPLACE
```
:grep -R 'string_or_pattern_to_search' .
:grep -R 'string_or_pattern_to_search' *
:grep -R string_or_pattern_to_search .
```

- OPEN THE QUICKLIST FOR CHANGINF FILES TO EDIT
```
:copen
```
or
```
:cw
```

- Navigate Quicklist
```
:cn
:cp
```

In .vimrc it has been remap `:cn` to `ctrl-n` and `:cp` to `ctrl-m`

#### SEARCH AND REPLACE IN ALL PROJECT

Populate a quicklist
```
:grep -R 'patter' .
```
```
:cdo %s/[pattern]/[replace]/ | update
```

` | update` will avoid asking for save the file each time.



#### RECORDING

qq -> start a recording named q
q -> quit recording
7@q -> play recorded q 7 times


#### MAKE IT UPPERCASE

gU[command]

gU$ -> make uppercase until the end of the line
gUiw -> make uppercase the word I am on it


#### AUTOCOMPLETE

- Normal Mode

Ctrl-space -> autocomplete CSS
Ctrl-n -> autocomplete CSS with classes and IDs

- Insert Mode

Ctrl-x Ctrl-l -> autocomplete text line
Ctrl-x Ctrl-p -> autocomplete word
Ctrl-x Ctrl-f -> autocomplete file names


#### MOVING SCROLLING

zz -> move form where it is the cursor to the middle of the screen
z. -> same as zz
z Enter -> move from where it is the cursor to the top of the screen

H -> move the cursor to the top of the screen
M -> move the cursor to the middle of the screen
L -> move the cursor to the bottom of the screen

gd -> will take you to the local declaration.
gD -> will take you to the global declaration.
g* -> search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
g# -> same as g* but in backward direction.
gg -> goes to the first line in the buffer (or provide a count before the command for a specific line).
G -> goes to the last line (or provide a count before the command for a specific line).
gf -> will go to the file under the cursor
g] -> and other commands will jump to a tag definition (a tag can be a function or variable name, or more).

Ctrl-o -> will go back to the last jump

Ctrl-w gf -> open path under cursor in a new tab


##### FOLDING

za -> fold current block
zm -> fold one level
zM -> fold all functions
zr -> unfold one level
zR -> unfold all level


##### SHOW HIGHLIGHTED GROUP NAME

Press F10 with the cursor over the word.

# Check the .vimrc for the custom command

##### CLOSE TAB

:tabc[lose]

// User defined command:
:Tc 

##### REPLACE A WORD WITH ONE IN REGISTER

Yank inner word
```
yiw
```

Change inner word -> Register -> 0
```
ciw Ctrl-R 0
```

##### PRINT CURRENT FILE IN TERMINAL

// % is holding the current file path

:!cat %


##### FZF Update

https://github.com/junegunn/fzf#as-vim-plugin

with git
```
cd ~/.fzf && git pull && ./install
```

##### Toggle Check Spelling

```
set spell
set nospell

set spell spelllang=it
set spell spelllang=en
```
In order to use suggestions for misspelled word use:

```
z=
```

To change the word with the first suggestion
```
1z=
```

To add misspelled word to dictionary
```
zg
```
To removed the added work to dictionary
```
zug
```

##### Open link under cursor
```
gx
```

##### Count occurrences of a pattern
```
:%s/pattern//gn
```
The final n will return the number and the lines.
