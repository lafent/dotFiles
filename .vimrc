" Name: .vimrc 
" Date: 03-MAY-2011
" Author: Lee Fent <lee.fent@gmail.com>
execute pathogen#infect()

set nocompatible

" Colors
set background=dark

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
set textwidth=78

" Backups
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups

if has('gui_running')
  " set guifont=Incosolata\ for\ Powerline:h12
endif

" Specific FileFormat Handlers
syntax on
filetype plugin indent on

source ~/.vim/filetype.vim

" Set the colorcolumn
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
let NERDTreeShowHidden = 1

" Syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
" let g:syntastic_php_phpcs_args='--standard=WordPress -n'

" Illuminate
" Time in millis (default 250)
let g:Illuminate_delay = 250
let g:Illuminate_ftblacklist = ['nerdtree']

" Clojure Support
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Lightline setup
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
" Powerline setup
" set fillchars+=stl:\ ,stlnc:\
" let g:airline_powerline_fonts=1 
" let g:airline_theme='solarized'
" let g:airline_solarized_normal_green=1
" let g:Powerline_symbols='fancy'
" set encoding=utf-8
" set termencoding=utf-8
" set t_Co=256
" Enable *.md as a markdown file
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
