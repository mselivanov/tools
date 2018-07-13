" General config
set nocompatible
filetype off
set number
syntax on
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99

" Key bindings
" " General setup
let mapleader = " "

" " Editing
nnoremap <silent> o o<Esc>
nnoremap <silent> O O<Esc>
nnoremap <silent> <C-o> o

" " Copy paste
vnoremap <silent> <C-Ins> "*y
vnoremap <silent> <S-Ins> "*p
nnoremap <silent> <S-Ins> "*p
vnoremap <silent> <C-/> :s/^/#/<cr>:noh<cr>
vnoremap <silent> <C-\> :s/^#//<cr>:noh<cr>

" " Config management
nnoremap <silent> <leader>ec :e ~/AppData/Local/nvim/init.vim<CR>
nnoremap <silent> <leader>sc :source ~/AppData/Local/nvim/init.vim<CR>

" " Buffer management
nnoremap <leader>bd :bdel<CR>
nnoremap <C-f4> :bdel<CR>
nnoremap <silent> <A-left> :bprev!<CR>
nnoremap <silent> <A-right> :bnext!<CR>

" " Plugin management
nnoremap <leader>pi :PlugInstall<CR>

" " Search management
nnoremap <silent> <f3> :set hlsearch!<CR>

" Language providers
" " Python
let g:python3_host_prog='C:/venvs/python37/Scripts/python.exe'
let python_highlight_all = 1

" Plugin installation 
call plug#begin('~/AppData/Local/nvim-data/plugins')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Shougo/unite.vim', { 'as': 'unite' }
Plug 'Shougo/vimfiler', { 'as': 'vimfiler' }
Plug 'equalsraf/neovim-gui-shim', { 'as': 'neovim-gui' }
Plug 'ap/vim-buftabline', {'as': 'buftabline'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', {'as': 'deoplete-jedi'}
Plug 'nvie/vim-flake8', {'as': 'vim-flake8'}
Plug 'vim-scripts/indentpython.vim', {'as': 'indentpython'}
Plug 'vim-scripts/scratch.vim', {'as': 'scratch'}
call plug#end()

" Window appearance
color dracula

" Plugin configuration
"" VimFiler
let g:vimfiler_as_default_explorer = 1

"" deoplete-jedi
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length = 0
