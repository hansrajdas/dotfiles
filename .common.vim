set ignorecase
set number
set autoindent
set incsearch
set tabstop=4
set hlsearch
set expandtab
set colorcolumn=120
set relativenumber
set shiftwidth=4
colorscheme default
set cursorline

" Enter the current millenium
set nocompatible

" Enable syntax and plugins
syntax enable
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file related tasks
" Used by :find ...
set path+=**

" Skip *.pyc files while searching for file using find command
set wildignore+=**/*.pyc

" Display all matching files when we tab complete
set wildmenu

" Start plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()  " Initialize plugin system
" End plugins

" Mappings
cnoremap ff find
cnoremap tt tabedit
nnoremap <C-p> :Files<Cr>
