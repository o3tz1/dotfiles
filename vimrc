"""""
"General 
"""""
set nocompatible
filetype indent plugin on
set ignorecase
set smartcase

"""""
"Colors 
"""""
set t_Co=256
set background=dark
syntax enable


"""""
"UI 
"""""
set number
set numberwidth=2
set cul
set laststatus=2
"set nohlsearch
set incsearch
set ruler

"""""
"Format&Layout 
"""""
set autoindent
set tabstop=2
set softtabstop=4
set shiftround
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set wrap
"set nowrap

set mouse=a

"""""
"Plugins 
"""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

color dracula

filetype plugin indent on
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Custom commands "
set pastetoggle=<F11>

" Disabling arrow keys for additional masochistic effect  "
"nnoremap <up>    <nop>
"nnoremap <down>  <nop>
"nnoremap <left>  <nop>
"nnoremap <right> <nop>
"inoremap <up>    <nop>
"inoremap <down>  <nop>
"inoremap <left>  <nop>
"inoremap <right> <nop>

" Bind NerdTree to C-o
map <C-o> :NERDTreeToggle<CR>
