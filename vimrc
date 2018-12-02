"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/EasyMotion'
"Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

" General
syntax on
set fencs=utf-8,gb2312,gbk
filetype plugin indent on
set autochdir
"set clipboard=unnamed

set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set nospell
set virtualedit=onemore
set history=1000

set noswapfile
set nowb
set paste

autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" UI
set t_Co=256
colorscheme jellybeans
"colorscheme molokai
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
"set wildmode=list:longest,full

set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set nofoldenable               " Disable fold code
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change

set list                                         " Show trailing whitespace
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace

" Format
set wrap          " wrap long lines
set lbr           " set linebreak
set tw=0          " sets the text width
set ai            " Auto indent
set si            " Smart indent
set expandtab     " tabs are spaces, not tabs
set shiftwidth=2  " use indents of 2 spaces
set tabstop=2     " an indentation every four columns
set softtabstop=2 " let backspace delete indent

"visual block move
vnoremap < <gv
vnoremap > >gv

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

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"Yggdroot/indentLine
"let g:indentLine_color_term = 239
"let g:indentLine_char = '|'

"tmux
"let g:tmux_navigator_no_mappings = 1
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"nnoremap <silent> {c-h} :TmuxNavigateLeft<cr>
"nnoremap <silent> {c-j} :TmuxNavigateDown<cr>
"nnoremap <silent> {c-k} :TmuxNavigateUp<cr>
"nnoremap <silent> {c-l} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" NerdTree
let b:match_ignorecase = 1
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:nerdtree_tabs_open_on_console_startup=1

" fzf
map ; :Files<CR>
map <C-b> :Buffers<CR>
map <C-s> :Ag<CR>
