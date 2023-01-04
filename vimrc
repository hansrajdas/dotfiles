set number
set relativenumber
set ignorecase
set autoindent
set incsearch
set hlsearch
" set colorcolumn=100
" Tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
" set spell
colorscheme default

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

" Open diff in side by side view over horizontal
set diffopt+=vertical

highlight ColorColumn ctermbg=red
" For GVIM
" highlight ColorColumn guibg=red

" Start plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()  " Initialize plugin system
" End plugins

" Mappings
nnoremap <C-p> :Files<Cr>
nnoremap <Leader>b :Buffers<Cr>
nnoremap <C-n> :n<Cr>
nnoremap <C-s> :wn<Cr>

" Commands
command! Py ! python %
