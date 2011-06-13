" Name: .vimrc 
" Date: 11-FEB-2011
" Author: Lee Fent <lee.fent@gmail.com>
set nocompatible

" Colors
set background=dark
colors koehler

" Appearance
set number
set ruler
set showcmd
set showmode
set visualbell
set cursorline

" Mobility and Translations
set backspace=indent,eol,start
set ttyfast

" Searching
set incsearch
set ignorecase
set smartcase
set history=50
set gdefault

" Spacing, Tabs and Formatting
syntax enable
set nowrap
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set showmatch

" Backup and Swap
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups

" Basic options
if has('gui_running')
    set guifont=Consolas:h12
    colorscheme koehler
    set background=dark
endif

