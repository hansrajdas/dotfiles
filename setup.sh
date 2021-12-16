#!/usr/local/bin/bash

BASE=$(pwd)

# 1. Setup VIM
mkdir -p ~/.vim/autoload

curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

vim +PlugInstall +qall

# 2. bashrc
curl --insecure -fLo ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl --insecure -fLo ~/completion.bash https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
curl --insecure -fLo ~/key-bindings.bash https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

mv -v ~/.bashrc ~/.bashrc.old 2> /dev/null
ln -sf $BASE/bashrc ~/.bashrc
