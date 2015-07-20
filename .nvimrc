set nocompatible | filetype indent plugin on | syn on
call plug#begin('~/.vim/plugged')

" Using Plug:
" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/maser/plug.vim
" :PlugInstall

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'gmarik/Vundle.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'pangloss/vim-javascript'
Plug 'ryanss/vim-hackernews'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tommcdo/vim-lion'
Plug 'adimit/prolog.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kongo2002/fsharp-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/inline_edit.vim'

call plug#end()
filetype plugin indent on

" Configuration variables
let g:spellcheck_region= "en_gb"
let g:tw_val=80
let mapleader="\\"

" Vim-Lion config to avoid conflict
let g:lion_map_right='zl'
let g:lion_map_left='zL'

" For showing off .vimrc
autocmd! bufwritepost .vimrc source %

let NERDTreeDirArrows=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
set laststatus=2

syntax enable
colorscheme monokai
set encoding=utf-8

set cursorline         " Highlight current line
set number             " add line number for current line
set relativenumber     " turns on relative line numbering
set title              " Show filename in titlebar
set showcmd            " Show what command I'm typing
set scrolloff=3        " Show me where I'm going
set wildmenu           " Autocomplete commands
set tabstop=2          " Set the tabstop to 2 spaces
set shiftwidth=2       " Shiftwidth should match tabstop
set softtabstop=2      " backspace tabs
set expandtab          " Convert tabs to <tabstop> number of spaces
set backspace=2        " makes backspace work like you expect
set autoindent
set smartindent
set smarttab
set formatoptions+=ro  " Insert leading comment characters on newline
set showmatch          " Show matching [] () {} etc...
set ignorecase
set smartcase
set incsearch
set noeb               " No error bells
set splitbelow
set splitright
set ttyfast
set lazyredraw
set clipboard=unnamed  " Copy/paste like normal

set undodir=~/.vim/undo//
set undofile

set backup                    " keep a backup file
set backupdir=~/.vim/backup// " put it here
set dir=~/.vim/swap//         " put swap files here

" behave yourself
nnoremap Y y$

" because of wordwrap
noremap j gj
noremap k gk

" moving around splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" moving between tabs
nmap <C-l> gt
nmap <C-h> gT

" move between tabs in insert mode
imap <silent> <C-l> <ESC>gt
imap <silent> <C-h> <ESC>gT

" easier than esc
imap <silent> <C-k> <ESC>

" save session
command! Ses mksession! .session.vim
nmap <C-s> :Ses<cr>

" :T <filename> opens file in new tab
command! -complete=file -nargs=1 T tabedit <args>

" Format file as JSON
command! Json %!python -m json.tool

" Tab completion!
function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" Strip trailing whitespace (\ss) (strip spaces)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab

" Nerdtree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Fugitive
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>

" Keep selection highlighted when changing indentation
vnoremap < <gv
vnoremap > >gv

" More logical indent/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Toggle relative line numbering
nnoremap <leader>r :setlocal relativenumber!<cr>

" Toggle spell checking
"   <leader>w to toggle spellchecking
"   n moves to next bad word, ignoring unusual words
"   N moves to prev bad word, ignoring unusual words
"   z goes to suggested corrections for word under cursor
let g:spellcheck_is_on = 0
function! SpellCheckToggle()
 if g:spellcheck_is_on
   set nospell
   unmap n
   unmap N
   unmap z
   let g:spellcheck_is_on = 0
 else
   exec 'set spell spelllang='.g:spellcheck_region
   nmap n ]S
   nmap N [S
   nmap z z=
   let g:spellcheck_is_on = 1
  endif
endfunction

nnoremap <leader>w :call SpellCheckToggle()<cr>

" Toggle text width
nnoremap <leader>t :call TextWidthToggle()<cr>

function! TextWidthToggle()
  if &textwidth
    setlocal tw=0
    echo "notw"
  else
    exec 'setlocal tw='.g:tw_val
    echo "tw=".g:tw_val
  endif
endfunction

" Lest system clipboard work with nvim
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

let g:EclimCompletionMethod = 'omnifunc'
