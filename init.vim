" === Defalut Setting 
:set number
:set relativenumber
" tab space 2
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
" === Defalut Setting End 

" === keyboard change

" === keyboard change End



" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()



" === coc.nvim

let g:coc_global_extensions = [
  \ 'coc-marketplace']

" === coc.nvim End
