" __  ____   __    _   ___     _____ __  __ 
"|  \/  \ \ / /   | \ | \ \   / /_ _|  \/  |
"| |\/| |\ V /____|  \| |\ \ / / | || |\/| |
"| |  | | | |_____| |\  | \ V /  | || |  | |
"|_|  |_| |_|     |_| \_|  \_/  |___|_|  |_|
"                                          


" === keyboard change
let g:mapleader=" "
" === keyboard change End

" === Defalut Setting 
syntax on
set number
set relativenumber
" tab space 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" coc recommend
set shortmess+=c
set updatetime=100
set hidden

" === Defalut Setting End 

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Code suggest
inoremap <silent><expr> <c-s> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> <LEADER>d <Plug>(coc-definition)
nmap <silent> <LEADER>t <Plug>(coc-type-definition)
nmap <silent> <LEADER>i <Plug>(coc-implementation)
nmap <silent> <LEADER>r <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Symbol renaming.
nmap <LEADER>frn <Plug>(coc-rename)


" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" === vim-illuminate
let g:Illuminate_delay = 550
hi illuminatedWord cterm=undercurl gui=undercurl

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w


noremap tt :CocCommand explorer<CR>
noremap ts :CocCommand translator.popup<CR>

" === coc.nvim

let g:coc_global_extensions = [
  \ 'coc-marketplace',
	\ 'coc-tsserver',
	\ 'coc-tslint-plugin',
	\ 'coc-json',
	\ 'coc-vimlsp',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-go',
	\ 'coc-yaml',
	\ 'coc-tailwindcss',
  \ 'coc-explorer',
  \ 'coc-translator',
	\ 'coc-vetur',
	\ 'coc-snippets']
" === coc.nvim End
