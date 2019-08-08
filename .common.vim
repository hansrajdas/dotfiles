set ignorecase
set number
set autoindent
set incsearch
set tabstop=2
set hlsearch
set expandtab
set colorcolumn=80,100
set relativenumber
set shiftwidth=2
colorscheme desert
set cursorline

" Open close maps
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" Enter the current millenium
set nocompatible

" Enable syntax and plugins
syntax enable
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file related tasks
" Used by :find ...
set path+=**

" Display all matching files when we tab complete
set wildmenu
