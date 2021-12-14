" Name: .vimrc 
" Date: 14-DEC-2021
" Author: Lee Fent <lee.fent@gmail.com>
execute pathogen#infect()

set nocompatible

" colors
set background=dark

" appearance
set number
set ruler
set showcmd
" set showmode
" set visualbell
set cursorline

" turn off .viminfo generation
set viminfofile=NONE

" mobility and translations
set backspace=indent,eol,start
set ttyfast

" searching
set incsearch
set ignorecase
set smartcase
set history=50

" spacing, tabs, and formatting
syntax enable
set nowrap
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set showmatch
set textwidth=78

" backups
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups

" Specific FileFormat Handlers
syntax on
filetype plugin indent on

source ~/.vim/filetype.vim

" set the color column
set cc=80,132
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New from vimcasts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow easy use of hidden buffers
set hidden

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Easy edit commands...
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

if has("autocmd")
  filetype plugin indent on
endif

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
nmap <F2> <C-W>>
nmap <F3> <C-W><
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" No hidden files in NERDTree
let NERDTreeShowHidden=1

" Lightline setup
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'powerline', }

" Enable *.md as a markdown file
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
