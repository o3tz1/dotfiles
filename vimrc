" General "
set nocompatible
filetype indent plugin on

" Colors "
set t_Co=256
set background=dark
syntax enable

" UI "
set number
set numberwidth=2
set cul
set laststatus=2
"set nohlsearch
set incsearch
set ruler

" Format&Layout "
set autoindent
set tabstop=2
set softtabstop=4
set shiftround
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set nowrap

set mouse=a

" Plugins "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimplyFold'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Custom commands "
set pastetoggle=<F11>
