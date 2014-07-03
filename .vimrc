set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

let NERDTreeDirArrows=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1

syntax enable
colorscheme monokai
set encoding=utf-8

set title
set showcmd
set cursorline
set showmode          " Tell you if you're in insert mode
set ruler             " Show the cursor position all the time
set relativenumber    " turns on relative line numbering
set number            " add line number for current line
set scrolloff=3
set wildmenu
set ttyfast
set splitbelow
set splitright
set tabstop=2         " Set the tabstop to 4 spaces
set shiftwidth=2      " Shiftwidth should match tabstop
set softtabstop=2     " backspace tabs
set expandtab         " Convert tabs to <tabstop> number of spaces
set backspace=2       " makes backspace work like you expect
set autoindent
set smartindent
set smarttab
set laststatus=2
set showmatch         " Show matching [] () {} etc...
set nohlsearch        " Don't highlight strings you're searching for
set ignorecase
set incsearch
set formatoptions+=ro " Insert leading comment characters on newline

set undodir=~/.vim/undo
set undofile

" moving around splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" moving between tabs
nmap <C-l> gt
nmap <C-h> gT

" :T <filename> opens file in new tab
command! -complete=file -nargs=1 T tabedit <args>

" Strip trailing whitespace (\ss) (strip spaces)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab
