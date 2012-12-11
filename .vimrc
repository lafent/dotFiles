" A minimal vimrc for new vim users to start with.
" vim:set ts=2 sts=2 sw=2 expandtab:

call pathogen#infect()
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" *************************************************************************** "
" @author: Lee Fent <lee.fent@gmail.com>
" *************************************************************************** "
" Tabs and Spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" Line Numbers and Ruler
set number
set ruler
set cursorline

" Search 
set showmatch
set incsearch
set hlsearch

" Enable consistent backup and swap directories instead of leaving files
" littered about the file system.
set backupdir=~/.tmp/vim/backup/ " backups
set directory=~/.tmp/vim/swap/   " swap files
set backup                       " enable backups

" Colors setups
set background=dark
colorscheme Tomorrow-Night-Bright " vibrantink 
set colorcolumn=81

nnoremap <F5> :GundoToggle<CR>

