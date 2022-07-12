"""""
" set improvement feature vIM
"
""""
set nocompatible

"""""
" set line number
"
""""
set number

"""""
" show number line and character count
" for more info Ctrl-g - it has been overwritten
"
""""
set ruler

"""""
" show filename in status bar
" to get full path `set statusline+=%F`
"
"""""
set laststatus=2

"""""
" set relative line number from the cursor
"
""""
set relativenumber

"""""
" set split below as preferred than above
"
""""
set splitbelow

"""""
" set split right as preferred than left
"
""""
set splitright

"""""
" do not resize windows after opening and closing
"
""""
set noea

"""""
" case insensitive search
"
""""
set ignorecase

"""""
" case sensitive only of there is a Capital letter
"
""""
set smartcase

"""""
" set paste nopaste toggle with F3. If in paste mode, autoindetation is off.
" usefull when pasting from clipboard.
"
""""
set pastetoggle=<F3>

"""""
" enabling syntax highlight
"
""""
syntax enable

""""
" syntax highlight breaks on large files.
" This should fix it, however it might slow down Vim
" issue: https://github.com/vim/vim/issues/2790
" https://stackoverflow.com/questions/27235102/vim-randomly-breaks-syntax-highlighting
"
""""
"set re=1
"set redrawtime=10000
"syntax sync fromstart
autocmd BufEnter * syntax sync fromstart

"""""
" set relative number in Normal mode
" set absolute number in Insert mode
"
""""
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"""""
" add to autocomplete spelling
"
""""
set complete+=kspell

"""""
" add spell checking
"
""""
"set spell

"""""
" force indentation of two with one tab only
"
""""
set autoindent
set noexpandtab
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2

"""""
" indent after opening curly braces
"
""""
inoremap {}<Left><CR> {<CR>}<C-o>O

"""""
" to not remove the indentation when pressing Esc
"
""""
inoremap <esc> ~<bs><esc>

"""""
" to not remove the indentation when pressing Enter
"
""""
inoremap <cr> ~<bs><cr>

"""""
" set show command to true
"
""""
set showcmd

"""""
" set visual alert
"
""""
set visualbell

"""""
" set update time
"
""""
set updatetime=200

"""""
" set folding method to indent
" possible: manual, indent, syntax, expr, marker, diff
" I was using syntax, then indent
"
""""
set foldmethod=indent

"""""
" set the level of open fold when opening a buffer
" if set to 0 all the file will be opened with folded code
"
""""
set foldlevelstart=20

"""""
" save every time you leave insert mode
"
""""
"autocmd InsertLeave * write

"""""
" save a backupfile before overwriting one
" Use this if you don't want to use 'set backup' and 'backupdir'
"
""""
"set writebackup

"""""
" set backup
"
""""
set backup

"""""
" set backupdir
"
""""
set backupdir=~/.vim_backups/

"""""
" yes will make a copy of the file as backup
" Set to yes so that webpack can better watch file changing
"
"""""
set backupcopy=yes

"""""
" set patchmode, save a backupfile and append it .orig to its name
"
""""
"set patchmode=.orig


"""""
" Typescript support for importing esmodule with .js extension
" This allow to use `gf` to go to file with extension '.ts' instead of '.js'
"
""""
set includeexpr=substitute(v:fname,'\\.js','.ts','g')


"""""
" Before writing append to its name date and time
" &bex is backup extension
"
""""
autocmd BufWritePre * let &bex = '-' . strftime("%Y-%m-%d-%H-%M")

"""""
" Search down in subfolders of the root
"
""""
set path+=**

"""""
" Display all matching files when tab complete
"
""""
set wildmenu

"""""
" set no terminal gui colors
"
""""
set notermguicolors

"""""
" set colorscheme
" edge must be set with notermguicolors
"
""""
colorscheme edge


"""""
" set colorscheme according to filetype
"
""""
" autocmd BufEnter * colorscheme edge
" autocmd BufEnter *.html colorscheme monokai
" au BufReadPost *.vue set syntax=html

"""""
" set Vim-specific sequences for RGB colors
"
""""
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"""""
" set custom characters
"
""""
set listchars=tab:\|\ ,trail:•,eol:¶,precedes:«,extends:»

"""""
" in combination with 'set listchars' will make all other character invisible
" like a space
"
""""
set list

"""""
" overwrite colorscheme highlight colors
"
"" Non-textual charcater color
"" Special character color
"" Matching character color
"" htmlTag and htmlEndTag
"
""""
autocmd ColorScheme *
	\ highlight NonText ctermfg=236 guifg=#343434 ctermbg=NONE |
	\ highlight SpecialKey ctermfg=241 guifg=#626262 |
	\ highlight cssTagName ctermfg=111 guifg=#87afff |
	\ highlight sassClass ctermfg=117 guifg=#87d7ff |
	\ highlight cssClassName ctermfg=75 guifg=#5fafff |
	\ highlight cssClassNameDot ctermfg=75 guifg=#5fafff |
	\ highlight storageClass ctermfg=141 guifg=#af87ff |
	\ highlight jsObjectKey ctermfg=147 guifg=#afafff |
	\ highlight jsFunction ctermfg=141 guifg=#af87ff |
	"\ highlight Keyword ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptObjectLabel ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptFuncKeyword ctermfg=141 guifg=#af87ff |
	\ highlight typescriptExport ctermfg=203 guifg=#ff5f5f |
	"\ highlight typescriptInterfaceKeyword ctermfg=203 guifg=#ff5f5f |
	\ highlight typescriptInterfaceExtends ctermfg=203 guifg=#ff5f5f |
	\ highlight typescriptObjectStaticMethod ctermfg=147 guifg=#afafff |
	\ highlight typescriptDOMFormProp ctermfg=147 guifg=#afafff |
	\ highlight typescriptConstructSignature ctermfg=202 guifg=#ff5f5f |
	\ highlight typescriptVariableDeclaration ctermfg=250 guifg=#bcbcbc |
	\ highlight typescriptVariable ctermfg=176 guifg=#d787d7 |
	\ highlight typescriptKeywordOp ctermfg=176 guifg=#d787d7 |
	\ highlight typescriptHeadersMethod ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptResponseProp ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptReflectMethod ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptPromiseMethod ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptClassKeyword ctermfg=202 guifg=#ff5f5f |
	\ highlight typescriptClassExtends ctermfg=202 guifg=#ff5f5f |
	\ highlight typescriptAliasKeyword ctermfg=141 guifg=#af87ff |
	\ highlight typescriptFileReaderProp ctermfg=250 guifg=#bcbcbc |
	\ highlight typescriptProp ctermfg=110 guifg=#87afd7 |
	\ highlight typescriptConstructorType ctermfg=202 guifg=#ff5f5f |
	\ highlight link sassClassChar sassClass |
	\ highlight link htmlTag htmlTagName |
	\ highlight link htmlEndTag htmlTagName |
	"\ highlight MatchParen ctermfg=195 |
	"" Chracter color after 80th char
	"\ highlight Terminal ctermbg=240 ctermfg=230 guibg=#232323 guifg=#DDDDDD |
	"\ highlight OverLength ctermbg=red ctermfg=white guibg=#592929 |
	"\ match OverLength /\%81v.\+/

"""""
" column colored with hl-ColorColumn command
" Only 80 to sign where it is
"
""""
set colorcolumn=80

"""""
" Custom cursor color
"
" :set is for setting options
" :let is for assigning value to variables
"
" This are equivalent tho, since &tw refer to the option tw
" :set  tw=40
" :let &tw=40
"
" Cursor colors in different terminals
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
"
" The if will check if the terminal supper the escape command to change color
"
""""
"if &term =~ "xterm\\|rxvt"
"  " use an red cursor in insert mode
"  let &t_SI = "\<Esc>]12;#882222\x7"
"  " use a blue cursor otherwise
"  let &t_EI = "\<Esc>]12;#2266FF\x7"
"  silent !echo -ne "\033]12;grey\007"
"  " reset cursor when vim exits
"  autocmd VimLeave * silent !echo -ne "\033]112\007"
"  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
"endif

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
"if exists('$TMUX')
"  " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
"  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
"  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
"  autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
"else
"  let &t_SI .= "\<Esc>[4 q"
"  let &t_EI .= "\<Esc>[2 q"
"  autocmd VimLeave * silent !echo -ne "\033[0 q"
"endi

"""""
" Cursor color for Tmux
" Blue on normal mode
" Red on insert mode
"
""""""
if exists('$TMUX')
	let &t_EI = "\<Esc>Ptmux;\<Esc>\033]12;#2266FF\007\<Esc>\\"
	let &t_SI = "\<Esc>Ptmux;\<Esc>\033]12;#882222\007\<Esc>\\"
	"silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
	"silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
	"autocmd VimLeave * silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Pl3971ED\033\\"
	autocmd VimLeave * silent !echo -ne "\033]12;grey27\007"
else
	let &t_EI = "\033]12;#2266FF\033\\"
	let &t_SI = "\033]12;#882222\033\\"
	silent !echo -ne "\033]12;grey27\033\\"
	autocmd VimLeave * silent !echo -ne "\033]12;grey27\033\\"
endif

"""""
" Highlight CSS VendorPrefix
"
""""
autocmd BufWritePre,BufRead *.css 
	\ highlight VendorPrefix ctermfg=red term=italic |
	\ match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

autocmd BufWritePre,BufRead *.scss 
	\ highlight VendorPrefix ctermfg=red term=italic |
	\ match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

autocmd BufWritePre,BufRead *.sass 
	\ highlight VendorPrefix ctermfg=red term=italic | 
	\ match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"""""
" Not sure what is does
" It seems \G remove highlight
"
""""
"nnoremap <Leader>G G?\S<CR>:noh<CR>


"""""
" Set command for custom function loaded from a file 
"
""""
"source ~/vcomments.vim
"map <C-a> :call Comment()<CR>
"map <C-b> :call Uncomment()<CR>

"""""
" Function and command for toggoling AutoRead
" Autoread will update the buffer if the file is changed outside Vim
"
""""
function! ToggleAutoRead()
	set ar!
	au CursorHold * checktime
endfunction

command! AutoRead :call ToggleAutoRead()

"""""
" Define command MakeTags for generating ctags
"
" For typescript support https://github.com/jb55/typescript-ctags
"
""""
"command! MakeTags !ctags -R .
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules .
set tags=tags;/

"""""
" Enable plugins
"
""""
filetype plugin on

"""""
" Set background dark for Tmux
"
"""""
set background=dark

"""""
" After upgrading VIM to 8.2 this will fix strange character
" that were randomly appearing >4;2m
" It is something related with the terminal command
"
"""""
let &t_TI = ""
let &t_TE = ""


"""""
" This will make the delete key deleting characters
"
"""""
set backspace=indent,eol,start


"""""
" enable swapfile
"
""""
set swapfile


"""""
" Polyglot variable that must be set before plugin.
"
"""""
let g:polyglot_disabled = ['sensible']


"""""
" Enable syntax highlight in markdown code blocks
"
"""""
let g:markdown_fenced_languages = [
  \ 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript',
  \ 'ts=typescript', 'php', 'html', 'css', 'rust', 'sql']


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" COMMANDS """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

command Vt vertical terminal

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" PLUGINS """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"""""
" Autocomplete
"
"""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""
" For autocomplete while typeing
"
"""""
" Plug 'Valloric/YouCompleteMe'

"""""
" Javascript syntax
"
"""""
" Plug 'pangloss/vim-javascript'

"""""
" A collection of language packs for Vim.
"
" With this plugin Vue files are superslow.
"
" -- Needed to be disable.
" -- It is forcing PHP file to tab with 4 spaces.
"
"""""
"Plug 'sheerun/vim-polyglot'

"""""
" A Vim plugin which shows a git diff in the sign column.
"
"""""
Plug 'airblade/vim-gitgutter'

"""""
" Syntax file and other settings for TypeScript
"
"""""
" "Plug 'leafgarland/typescript-vim'

"""""
" TSServer
"
"""""
" "Plug 'Quramy/tsuquyomi'

"""""
" Typescript for Vue
"
"""""
" "Plug 'Quramy/tsuquyomi-vue'

"""""
" Syntax Highlighting for Vue
"
"""""
Plug 'posva/vim-vue'

"""""
" JS and TS indent
"
"""""
" "Plug 'jason0x43/vim-js-indent'

"""""
" Plugin for comment shortcut
"
"""""
" "Plug 'preservim/nerdcommenter'

"""""
" Another plugin for comment
"
"""""
Plug 'tpope/vim-commentary'

"""""
" Another plugin for comment
"
"""""
" "Plug 'tomtom/tcomment_vim'

"""""
" Plugin for linting
"
"""""
Plug 'dense-analysis/ale'

"""""
" Plugin for linting
"
"""""
" "Plug 'vim-syntastic/syntastic'

"""""
" Highlight HTML matching tags
"
"""""
" Plug 'Valloric/MatchTagAlways'

"""""
" Install FZF in VIM - FuzzyFinder
" After installing you need to
" set rtp+=~/.fzf See below plugin section
"
"""""
" "Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

""""
" A Fuzzy Finder plugin
" https://github.com/ctrlpvim/ctrlp.vim
"
""""
Plug 'ctrlpvim/ctrlp.vim'

""""
" a plugin which disables the arrow keys, the hjkl keys,
" the page up/down keys, and a handful of other keys
"
""""
" "Plug 'wikitopian/hardmode'

""""
" surroundings: parentheses, brackets, quotes, XML tags, and more.
"
""""
Plug 'tpope/vim-surround'

""""
" NERDTree
"
""""
" "Plug 'preservim/nerdtree'

""""
" Vim-prettier
"
""""
Plug 'prettier/vim-prettier'

""""
" Vim-pug
"
""""
Plug 'digitaltoad/vim-pug'

""""
" Vim-toml
"
""""
Plug 'cespare/vim-toml'

""""
" Vim-plist
"
""""
Plug 'darfink/vim-plist'

""""
" Vim-coffe-script syntax
"
""""
Plug 'kchmck/vim-coffee-script'

call plug#end()


"""""
" The plugin manager https://github.com/junegunn/vim-plug was forcing to use 
" Sass indentation with spaces instead of tabs. The following command will fix
" it. Setting globally to not expand tabs
"
"""""
"set noexpandtab
"autocmd FileType sass setlocal noexpandtab
"autocmd FileType php setlocal noexpandtab

"""""
" add indentation with tabs also to empty lines for PHP files
" For some reason on PHP it wasn't working.
"
""""
autocmd FileType php setlocal autoindent
autocmd FileType php inoremap <esc> ~<bs><esc>
autocmd FileType php inoremap <cr> <space><bs><cr>

"""""
" This will close the info windows when autocomplete has been selected
"
"""""
autocmd CompleteDone * pclose


"""""
" Custom remappings after plugins
"
"""""

"""""
" Remap scrolling
"
"""""
nnoremap J <C-e>
nnoremap K <C-y>
nnoremap <S-C-j> <C-d>
nnoremap <S-C-k> <C-u>

"""""
" Remap hjkl in Insert mode
"
"""""
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"""""
" Remap _search next_ to _search next and center_ in the window
"
"""""
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

"""""
" Mapping for search and replace word under cursor
" Ctrl-s
"
"""""
nnoremap <C-S> :%s/\<<C-r><C-w>\>/

"""""
" Mapping for :grep
" Ctrl-g
"
"""""
nnoremap <C-G> :grep -R 

"""""
" Mapping for :tabclose
"
"""""
command! Tc :tabclose

"""""
" Mapping missspelled
"
"""""
command WQ wq
command Wq wq
command W w
command Q q

"""""
" Remap ctrl-n to :cn for going next entry to quicklist after :grep
" Remap ctrl-m to :cp for going previous entry to quicklist after :grep
"
"""""
nmap <silent> <C-N> :cn<CR>zz
nmap <silent> <C-M> :cp<CR>zz

"""""
" Press Space to turn on/off searched term highlighting and clear
" any message already displayed.
"
""""
nnoremap <silent> <Space> :set hlsearch!<Bar>:echo<CR>

"""""
" Remap CTAGS command "go to defintion"
" Lowercase 'gd' go to defintion by skipping prompt of selecting defintion
" Uppercase 'gD' go to defintion in a splitted window
" Both uppercase 'GD' show prompt
"
""""
nnoremap gd g]1<CR><CR>zz
nnoremap gD :<c-u>rightbelow vertical stjump <c-r><c-w><cr>zz
"nnoremap GD g]

"""""
" Autoclose (X)HTML tags
"
"""""
"inoremap > ></<C-x><C-o><C-y><C-o>%<CR><C-o>
"inoremap input> input>
"inoremap br> br>
"inoremap /> />
inoremap ><Tab> ><Esc>F<lyt>A</<C-r>"><Esc>F<i

"""""
" Press F10 to
" show highlight group name under the cursor
"
"""""
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"""""
" Press F9 to
" show highlight group color under the cursor
"
"""""
map <F9> :echo "fg<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg") . '> bg<'
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg") . ">"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" COC Autocomplete """"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" NERDTree """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
" Shortcut command for NERDTree
"
"""""
"nnoremap <leader>n :NERDTreeFocus<CR>
""nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

"" Start NERDTree and put the cursor back in the other window.
""autocmd VimEnter * NERDTree | wincmd p

"" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

"" Highlight currently open buffer in NERDTree
"autocmd BufRead * call SyncTree()

"let NERDTreeMapActivateNode='l'
""let NERDTreeMapCloseDir='h'
""let NERDTreeMapCustomOpen='l'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" VIM VUE """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vue_disable_pre_processors = 1
"let g:vue_pre_processors = 'detect_on_enter'
"let g:vue_pre_processors = ['pug', 'scss']


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" FZF """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
" Add FZF command
"
"""""
set rtp+=~/.fzf

"""""
" ZFZ layout
"
"""""
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1, 'border': 'sharp' } }


"""""
" ZFZ shortcuts
" After selecting the file use this shortcut
"
"""""
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-e': 'e',
  \ 'ctrl-l': 'vsplit' }

"""""
" Remap Ctrl-k to launch FZF
"
"""""
"nnoremap <C-k> :Files<CR>
"nnoremap <C-k> :FZF ../


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" CtrlP """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
" Window result
"
"""""
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'

"""""
" Ignore .gitignore files
"
"""""
 let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

"""""
" Ignore .gitignore files
"
"""""
 "let g:ctrlp_user_command = [
 "      \'.git',
 "      \'cd %s && git ls-files --recurse-submodules |& egrep -v "\.(png|jpg|jpeg|gif)$|dist"',
 "      \'find %s -type f'
 "      \]

 "let g:ctrlp_user_command = [
 "      \'.git',
 "      \'git -C $(git rev-parse --show-toplevel) ls-files -c --others --exclude-standard --exclude=dist/* |& egrep -v "\.(png|jpg|jpeg|gif)$|dist"',
 "      \'find %s -type f'
 "      \]

 " let g:ctrlp_user_command = [
 "       \'.git',
 "       \'cd %s && git ls-files -c --others --exclude-standard --exclude=dist/* |& egrep -v "\.(png|jpg|jpeg|gif)$|dist"',
 "       \'find %s -type f'
 "       \]

 let g:ctrlp_user_command = [
       \'.git',
       \'cd %s && git ls-files -c --others --exclude-standard --exclude=dist/. |& egrep -v "\.(png|jpg|jpeg|gif)$|dist"',
       \'find %s -type f'
       \]

"""""
" Remap how to vertical split with Ctrlp
"
" In order to use ctrl l for a vertical split I need to remap also
" PrtCurRight() that was mapped to <c-l>
"
"""""
let g:ctrlp_prompt_mappings = {
	\ 'PrtCurRight()': ['<right>'],
	\ 'AcceptSelection("v")': ['<c-l>']
	\ }

"""""
" Remap Ctrl-h to launch CtrlP from repo root
"
"""""
"nnoremap <C-h> :CtrlP ~/repos/<CR>

"""""
" Clear cache on exit
"
"""""
"let g:ctrlp_clear_cache_on_exit = 0




"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" ALE """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
" To show ALE configuration of the current fle type :ALEInfo
"
" Global libriaries installed:
" npm i -g htmllint
" npm i -g jsonlint
" npm i -g stylelint
" npm i -g stylelint-config-standard
" npm i -g pug-lint
"
" added config file for stylellint in user root folder
"
"""""

"""""
" Set filetype for VUE
"
"""""
"augroup FiletypeGroup
"  autocmd!
"  au BufNewFile,BufRead *.vue set filetype=vue
"augroup END

autocmd BufNewFile,BufRead *.vue set filetype=vue


"""""
" Set aliases and linters for VUE files
"
"""""
"let g:ale_linter_aliases = {'vue': 'typescript'}
"let g:ale_linters = {'sass': ['stylelint'], 'html': ['webpack'], 'vue': ['webpack']}
"let g:ale_fixers = {'vue': ['eslint']}

"""""
"" Need to install `vls` yarn add vls for Vue
""
"""""
let g:ale_linters = {'sass': ['stylelint'], 'html': ['webpack'], 'vue': ['vls']}

"""""
" If you install VLS package as global dep with `npm i -g vls`
" You will need to set the following vairable to 1
"
"""""
"let g:ale_vue_eslint_use_global = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

"""""
" Format ALE messages
"
"""""
let g:ale_echo_msg_error_str = 'error'
let g:ale_echo_msg_warning_str = 'warning'
let g:ale_echo_msg_format = '[%linter%] %s [%code%][%severity%]'

""""
" Disable ALE linter on change and input.
" Leave only when saving files.
"
""""
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" VIM Polyglot """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:polyglot_disabled = ['vue']

"Polyglot uses posva/vim-vue for Vue files. 
"let g:vue_pre_processors = 'detect_on_enter'
"let g:vue_pre_processors = ['pug', 'sass']

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" YouCompleteMe """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""
" Remove auto display Doc popup when hovering with cursor
"
""""""
let g:ycm_auto_hover = ''

"""""
" Open Doc popup with Ctrl-b
"
"""""
nmap <C-b> <plug>(YCMHover)

"""""
" Do not show YCM preview window
"
"""""
set completeopt-=preview

" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_add_preview_to_completeopt = 0

let g:ycm_autoclose_preview_window_after_insertion = 0

let g:ycm_semantic_triggers = {
  \ 'css': [ 're!^', 're!^\s+', ': ' ], 
  \ 'scss': [ 're!^', 're!^\s+', ': ' ],
  \ 'sass': [ 're!^', 're!^\s+', ': ' ]
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" GitGutter """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_max_signs=999

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" vim-commentary """"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vifm setlocal commentstring=\"\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" NERDCommenter """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDCustomDelimiters = {
	\ 'c': {'left': '/** ', 'right': ' */'}, 
	\ 'json': {'left': '// '},
	\ 'typescript': {'left': '// '},
	\ 'javascript': {'left': '// '},
	\ 'vue': {'left': '<!-- ', 'right': ' -->'},
	\ 'html': {'left': '<!-- ', 'right': ' -->'},
	\ 'php': {'left': '<!-- ', 'right': ' -->'},
	\ 'css': {'left': '/* ', 'right': ' */'},
	\ 'scss': {'left': '/* ', 'right': ' */'},
	\ 'sass': {'left': '/* ', 'right': ' */'},
	\ 'coffee': {'left': '// ', 'right': ''},
	\ 'vifm': {'left': '" ', 'right': ''},
\}

let g:NERDDefaultAlign = 'left'

"""""
" Mapping comment for Ctrl+/ - In vim Ctrl+/ is C-_
"
"""""
"nnoremap <C-_> :call NERDComment(0, "toggle")<C-m>
nnoremap <C-_> :call nerdcommenter#Comment(0, "toggle")<C-m>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" MatchTagAlways """"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:mta_filetypes = {'html' : 1, 'xhtml' : 1, 'xml' : 1, 'vue' : 1}
let g:mta_filetypes = {'html' : 1, 'xhtml' : 1, 'xml' : 1, 'php': 1}
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0

"highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
highlight MatchTag ctermfg=white guifg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""" Typescript Tsuquyomi """"""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tsuquyomi_disable_quickfix = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" SYNTASTIC  """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""
" use :SyntasticInfo and :SyntasticCheck inside a file

"let g:syntastic_check_on_open = 1

"""""
" set error synmbols
"
"""""
"let g:syntastic_error_symbol = '>!'
"let g:syntastic_warning_symbol = '__'
"let g:syntastic_style_error_symbol = '>!'
"let g:syntastic_style_warning_symbol = '__'

"""""
" HTML checker already installed in Syntastic
"
"""""
"let g:syntastic_html_checkers = ['validator']

"""""
" Before using stylelint you need to install it
" npm i -g stylelint 
" It will need a configuration file you have to put in the root folder of the
" user. .stylelintrc.json
"
" { \"extends\": \"stylelint-config-standard\", \"rules\": {} }
" 
" In order to extend _stylelint-config-standard_ you need to install it
" npm i -g stylelint-config-standard
"
""""""
"let g:syntastic_css_checkers = ['stylelint']
"let g:syntastic_scss_checkers = ['stylelint']

"""""
" Before using stylelint you need to install it
" npm i -g sass-lint 
" Syntastic name is sass_lint
"
""""""
"let g:syntastic_sass_checkers = ['sass_lint']

"""""
" Before using jsonlint you need to install it
" npm i -g jsonlint
"
""""""
"let g:syntastic_json_checkers = ['jsonlint']

"""""
" Before using pug-lint you need to install it
" npm i -g pug-lint
" The name in Syntastic is pug_lint
"
"""""
"let g:syntastic_pug_checkers = ['pug_lint']

"""""
" Before using pug-lint you need to install it
" npm i -g eslint
" The name in Syntastic is pug_lint
"
""""""
"let g:syntastic_vue_checkers = ['eslint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" HARD MODE """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"let g:HardMode_level = 'wannabe'



"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" Autotoggle :set paste"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" Increase version file on save """"""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" pass git root to uv.sh script
" autocmd BufWritePost * !git rev-parse --show-toplevel

autocmd BufWritePost * silent !ROOT=$(git rev-parse --show-toplevel 2> /dev/null)
			\ && if [ "$ROOT" = "" ]; then ROOT='.'; fi
			\ && VFILE="$ROOT/version.txt"
			\ && IFILE="$ROOT/uv.sh"
			\ && if [ -f "$VFILE" ] && [ -f "$IFILE" ]; then
			\ VERSION=$(eval "sh $IFILE $ROOT");
			\ fi

" autocmd BufWritePost * silent !VFILE="./version.txt" && IFILE="./uv.sh"
" 			\ && if [ -f "$VFILE" ] && [ -f "$IFILE" ]; then
" 			\ VERSION=$(eval "sh $IFILE .");
" 			\ fi


"""""
" Fix Kitty background bug
" https://sw.kovidgoyal.net/kitty/faq/#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
"
""""
let &t_ut=''
