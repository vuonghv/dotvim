"site: http://dougblack.io/words/a-good-vimrc.html
" To disable a plugin, add it's bundle name to the following list
filetype off
let g:pathogen_disabled = ['vim-airline']
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on  " Load filetype-specific indent files

syntax enable
set exrc  " source .vimrc from any directory you run vim from
set secure

" Leader Shortcuts {{{
let mapleader = ","

" Some ways to avoid pressing ESC key
inoremap jk <Esc>
inoremap ;; <Esc>
"inoremap ii <Esc>

" Open ag.vim
nnoremap <Leader>a :Ag

" Quit Vim
nnoremap <Leader>q :quit<CR>

" Quickly edit/reload the .vimrc file
nmap <Leader>ev :edit $MYVIMRC<CR>
nmap <Leader>sv :source $MYVIMRC<CR>

" Some shortcut mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close current buffer without closing the window
map <Leader>bd :Bdelete<CR>
" }}}

" Moving lines maps {{{
" support moving: NORMAL, INSERT and VISUAL modes.
" Fixing for Meta key like: <A-..> <M-..>
set <M-j>=j
imap j <M-j>
set <M-k>=k
imap k <M-k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

" Spaces and Tabs {{{
set tabstop=4 " Number of visual SPACES per TAB
set softtabstop=4 " Number of SPACES in TAB when editing
set shiftwidth=4
set expandtab " TABS are SPACES

set cindent " Indetication for C language
" }}}

" UI Config {{{
set number
set relativenumber " Show line numbers
set showcmd " Show command in bottom bar
set cursorline  " Highlight current line
set wildmenu  " Visual autocomplete for command menu
set lazyredraw " Redraw only when we need to
set showmatch " Highlight matching [{()}]
set title " Set Terminal title to the name of the buffer we are editing.
set laststatus=2
set statusline=%<%f\ %h%m%r%w%y%=%-14.([%L]\ \ \ %l,%c%V%)\ %P
set textwidth=79
set colorcolumn=+1
set formatoptions-=t
" }}}

" Searching {{{
set incsearch  " Search as characters are entered
set hlsearch  " Highlight matches
" Turn off highlight search
nnoremap <Leader><Space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldlevelstart=0  " Open most folds by default
set foldnestmax=10  " 10 nested fold max
" Space open/closes folds
nnoremap <space> za
set foldmethod=indent " Fold based on indent level 
set nofoldenable  " Disable folding when opening files
" }}}

" CtrlP Vim Settings {{{
let g:ctrlp_cmd = 'CtrlP' " default find in buffer
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/*  " Exclude files or directories
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_switch_buffer = 'ET' " Jump to already opened windows anywhere
let g:ctrlp_use_caching = 1 " Enable per-session caching
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp' " Set the directory to store the cache files
let g:ctrlp_clear_cache_on_exit = 0 " Do Not Delete the cache files when exiting Vim
let g:ctrlp_show_hidden = 0   " Do not scan for dotfiles and dotdirs
let g:ctrlp_open_new_file = 'v' " Open a newly created file in a new vertical split.
" Specify an external tool to use for listing file instead of using Vim's globpath()
let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ -g ""'
let g:ctrlp_working_path_mode = 0
" }}}

" Path for going to file gf {{{
set path+=/usr/local/include,/usr/src/linux/include
" }}}

" YouCompleteMe config {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '?'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_start_csharp_server = 0
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_use_ultisnips_completer = 0
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }}}

" Color Scheme Configurations {{{
set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_bold=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_degraded=0
"colorscheme solarized
colorscheme delek
highlight Folded ctermbg=NONE " Turn off highlight folded
" }}}

" Ag.vim The Silver Searcher Config {{{
"let g:ag_prg = "ag --vimgrep --smart-case"  "The location of the Ag program
let g:ag_prg = "ag --column --nocolor --nogroup "
let g:ag_highlight = 1  " Highlight the search terms
" }}}

" Vim-Airline Config {{{

" Loaded extensions
let g:airline_extensions = ['ctrlp']

" Standard statusline
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'

" Smarter tab line
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep=' '

" airline-ctrlp
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" }}}

" python-mode configurations {{{
" https://github.com/klen/python-mode
" set pymode = 0 to disable Python-mode, enable Jedi-vim
let g:pymode = 0
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 1
let g:pymode_indent = 1
" }}}

set modeline
set modelines=1
" modeline vim:foldmethod=marker:foldlevel=0
