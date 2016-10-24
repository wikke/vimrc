set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle 'scrooloose/nerdtree'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
"Bundle 'gregsexton/gitv'
Bundle 'flazz/vim-colorschemes'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'rstacruz/sparkup'
Bundle 'majutsushi/tagbar'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/matchit.zip'
"Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/EasyMotion'
Bundle 'Yggdroot/indentLine'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

syntax on
set fencs=utf-8,gb2312,gbk
filetype plugin indent on
set autochdir

set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set nospell
set virtualedit=onemore
set history=1000
set noswapfile
set nowb

autocmd! BufWritePost ~/.vimrc source ~/.vimrc

set t_Co=256
colorscheme jellybeans
set background=dark
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15

set tabpagemax=15              " only show 15 tabs
set showmode                   " display the current mode
set showcmd                    " show partial commands in status line and selected characters/lines in visual mode
set ruler                      " show the ruler
set cursorline                 " highlight current line
hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi Visual ctermbg=lightblue ctermfg=white guibg=NONE guifg=NONE

set scrolljump=3               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor
set laststatus=2               " always show statusline
set backspace=indent,eol,start " Backspace for dummys
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
set wildmenu                   " Show a navigable menu for tab completion
set wildmode=longest,list,full
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set nofoldenable               " Disable fold code
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change
set list                                         " Show trailing whitespace
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace
set wrap          " wrap long lines
set lbr           " set linebreak
set tw=0          " sets the text width
set ai            " Auto indent
set si            " Smart indent
set expandtab     " tabs are spaces, not tabs
set shiftwidth=2  " use indents of 2 spaces
set tabstop=2     " an indentation every four columns
set softtabstop=2 " let backspace delete indent

vnoremap < <gv
vnoremap > >gv
nnoremap ; :
let mapleader = ','
map <leader>ee :e ~/.vimrc<cr>
map <leader>rr :source ~/.vimrc<cr>
nmap <silent> <leader>c :nohlsearch<CR>
:noremap <Left> :bp<CR>
:noremap <Right> :bn<CR>
nmap 0 ^
nmap <Up> 5k
nmap <Down> 5j
nmap D dd
nmap F d$
nnoremap j gj
nnoremap k gk
nnoremap Y y$

"terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"scrooloose/syntastic
let g:syntastic_check_on_open=1

"Yggdroot/indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

"tagbar
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_type_php  = { 'ctagstype' : 'php', 'kinds'     : [ 'i:interfaces', 'c:classes', 'd:constant definitions', 'f:functions', 'j:javascript functions:1' ] }

"tmux
let g:tmux_navigator_no_mappings = 1
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te"

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"NerdTree
let b:match_ignorecase = 1
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:nerdtree_tabs_open_on_console_startup=1

"ctrlp
"let g:ctrlp_working_path_mode = 'rc'
nnoremap <C-b> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$\|/home/wikke/59store/node_modules\|/home/wikke/59store/Public',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS_Store$\|\.pyc$\|\.png\|\.jpg' }

"Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" <CR>: close popup
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"let g:Powerline_symbols = 'Source Code Pro for Powerline'
let g:airline_theme = 'molokai'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

