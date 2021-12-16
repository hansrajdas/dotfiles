#!/usr/local/bin/bash

BASE=$(pwd)

# 1. Setup VIM
mkdir -p ~/.vim/autoload

curl --insecure --silent -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

vim +PlugInstall +qall
