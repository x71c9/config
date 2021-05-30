"""""
" set improvement feature viM
"
""""
set nocompatible

"""""
" set line number
"
""""
set number

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
" enabling syntax highlight
"
""""
syntax enable

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
" force indentation of two with one tab only
"
""""
set tabstop=2
set shiftwidth=2

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
" Before writing append to its name date and time
" I believe &bex is backup extension
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
	\ highlight jsObjectKey ctermfg=147 guifg=#afafff |
	\ highlight jsFunction ctermfg=141 guifg=#af87ff |
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
""""
command! MakeTags !ctags -R .


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" PLUGINS """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"""""
" For autocomplete while typeing
"
"""""
Plug 'Valloric/YouCompleteMe'

"""""
" Javascript syntax
"
"""""
Plug 'pangloss/vim-javascript'

"""""
" A collection of language packs for Vim.
"
"""""
Plug 'sheerun/vim-polyglot'

"""""
" A Vim plugin which shows a git diff in the sign column.
"
"""""
Plug 'airblade/vim-gitgutter'

"""""
" Syntax file and other settings for TypeScript
"
"""""
Plug 'leafgarland/typescript-vim'

"""""
" Plugin for comment shortcut
"
"""""
Plug 'preservim/nerdcommenter'

"""""
" Plugin for linting
"
"""""
Plug 'dense-analysis/ale'

"""""
" Plugin for linting
"
"""""
"Plug 'vim-syntastic/syntastic'

"""""
" Highlight HTML matching tags
"
"""""
Plug 'Valloric/MatchTagAlways'

call plug#end()


"""""
" The plugin manager https://github.com/junegunn/vim-plug was forcing to use 
" Sass indentation with spaces instead of tabs. The following command will fix
" it. Setting globally to not expand tabs
"
"""""
set noexpandtab
autocmd FileType sass setlocal noexpandtab

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
" Remap _search next_ to _search next and center_ in the window
"
"""""
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"""""
" Press Space to turn on/off searched term highlighting and clear
" any message already displayed.
"
""""
nnoremap <silent> <Space> :set hlsearch!<Bar>:echo<CR>

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
"	autocmd!
"	au BufNewFile,BufRead *.vue set filetype=vue
"augroup END

"""""
" Set aliases and linters for VUE files
"
"""""
let g:ale_linters = {'sass': ['stylelint']}

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




"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" VIM Polyglot """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:polyglot_disabled = ['vue']

" Polyglot uses posva/vim-vue for Vue files. 

"let g:vue_pre_processors = 'detect_on_enter'
"let g:vue_pre_processors = ['pug', 'sass']
let g:vue_pre_processors = ['pug','sass']




"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" YouCompleteMe """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" set completeopt-=preview
" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_semantic_triggers = {
"  \ 'css': [ 're!^', 're!^\s+', ': ' ], 
"  \ 'scss': [ 're!^', 're!^\s+', ': ' ],
"  \ 'sass': [ 're!^', 're!^\s+', ': ' ]
\ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" NERDCommenter """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDCustomDelimiters = {
	\ 'c': {'left': '/**', 'right': '*/'}, 
	\ 'json': {'left': '// '},
	\ 'typescript': {'left': '// '},
	\ 'javascript': {'left': '// '}
\}

let g:NERDDefaultAlign = 'left'

"""""
" Mapping comment for Ctrl+/ - In vim Ctrl+/ is C-_
"
"""""
nnoremap <C-_> :call NERDComment(0, "toggle")<C-m>



"""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" MatchTagAlways """"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mta_filetypes = {'html' : 1, 'xhtml' : 1, 'xml' : 1, 'vue' : 1}
"let g:mta_use_matchparen_group = 0
"let g:mta_set_default_matchtag_color = 0



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


