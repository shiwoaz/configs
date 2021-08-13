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
set novisualbell
set cursorline
set guicursor=
set mouse=a
set showmode
set scrolloff=4
" tab space 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

set termguicolors
set encoding=UTF-8

filetype plugin indent on
" coc recommend
set shortmess+=c
set updatetime=100
set hidden

" status line


"
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

" ================================= Plug Start =================================================
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" THEME
Plug 'ajmwagar/vim-deus' 
"Plug 'morhetz/gruvbox'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" complete quto.
Plug 'tpope/vim-surround'

" auto selected 
Plug 'gcmt/wildfire.vim'

" Git
Plug 'airblade/vim-gitgutter'

" Tabline
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-xtabline'
"Plug 'pacha/vem-tabline'
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'
"Plug 'bagrat/vim-buffet'

" Taglist
Plug 'liuchengxu/vista.vim'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" code plug
Plug 'sheerun/vim-polyglot'

" undotree
Plug 'mbbill/undotree'

" JavaScript && TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" ================================= Plug End =================================================

" enable these when get in JS/TS file
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" THEME  
"autocmd vimenter * ++nested colorscheme gruvbox
colorscheme deus

" Hidden Highlighter
noremap <silent>  C :noh<CR>

" Normal change key
noremap Q :q<CR>
noremap < <<
noremap > >>

noremap J 10j
noremap K 10k

vnoremap Y "+y

" markdown


" === vim-illuminate
let g:Illuminate_delay = 550
hi illuminatedWord cterm=undercurl gui=undercurl

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w



" GitGutter
set updatetime=100
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'


noremap tt :CocCommand explorer<CR>
noremap ts :CocCommand translator.popup<CR>


" Switch tabs
nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>
" === xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1

" FZF
nmap <C-p> :Files<CR>

" undotree
noremap D :UndotreeToggle<CR>

" === Formatting
"  Elixir
autocmd FileType elixir setlocal  formatprg = mix\ format\ -

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
	\ 'coc-snippets',
	\ 'coc-elixir']
" === coc.nvim End
