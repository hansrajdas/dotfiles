set ignorecase
set number
set autoindent
set incsearch
set tabstop=4
set hlsearch
set expandtab
set colorcolumn=80,100
set relativenumber
set shiftwidth=4
colorscheme desert
set cursorline

" Mappings
cnoremap ff find 

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
