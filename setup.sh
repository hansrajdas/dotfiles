#!/usr/local/bin/bash

BASE=$PWD
BACKUP_EXT=$(date +%s)

# 1. Setup VIM
mkdir -p ~/.vim/autoload

curl --insecure --create-dirs -fLo ~/.vim/autoload/plug.vim \
    https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.${BACKUP_EXT} 2> /dev/null
ln -sf ${BASE}/vimrc ~/.vimrc

vim +PlugInstall +qall

# 2. bashrc
curl --insecure -fLo ~/git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl --insecure -fLo ~/completion.bash \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
curl --insecure -fLo ~/key-bindings.bash \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

mv -v ~/.bashrc ~/.bashrc.${BACKUP_EXT} 2> /dev/null
ln -sf ${BASE}/bashrc ~/.bashrc

# 3. tmux.conf
mv -v ~/.tmux.conf ~/.tmux.conf.${BACKUP_EXT} 2> /dev/null
ln -sf ${BASE}/tmux.conf ~/.tmux.conf
