" File: .gvimrc
" Date: 01-MAY-2011
" Author: Lee Fent <lee.fent@gmail.com>

set guifont=Consolas\ 12
set lines=43
set columns=88

syntax enable
set background=light
colorscheme solarized

function ToggleGUICruft()
  if &go==''
    exec('se go=mTrL')
  else
    exec('se go=')
  endif
endfunction
map <F11> <Esc>:call ToggleGUICruft()<cr>

