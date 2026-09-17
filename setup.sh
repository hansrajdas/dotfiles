#!/opt/homebrew/bin/bash

BASE=$PWD
BACKUP_EXT=$(date +%s)

# 0. Install required CLI tools (idempotent; brew skips already-installed formulae).
## go: required to build/run anything in the repo, and for vim-go's GoInstallBinaries below.
## bazelisk/buildozer/lcov: required by the automation repo's build tooling.
## fzf/gh: relied on by vimrc and day-to-day workflow.
## sshpass/sshuttle: relied on by bash_profile testbed-access helpers.
brew install go bazelisk buildozer lcov fzf gh sshpass sshuttle

# 1. Setup VIM
## Install plugin manager vim-plug which manages other vim plugins installed
mkdir -p ~/.vim/autoload

curl --create-dirs -fLo ~/.vim/autoload/plug.vim \
    https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.${BACKUP_EXT} 2> /dev/null
ln -sf ${BASE}/vimrc ~/.vimrc

vim +PlugInstall +GoInstallBinaries +qall

# 2. bashrc
curl -fLo ~/git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -fLo ~/completion.bash \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
curl -fLo ~/key-bindings.bash \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

mv -v ~/.bashrc ~/.bashrc.${BACKUP_EXT} 2> /dev/null
ln -sf ${BASE}/bashrc ~/.bashrc

# 3. tmux.conf (only if tmux is installed; not auto-installed by this script)
if command -v tmux >/dev/null 2>&1; then
    mv -v ~/.tmux.conf ~/.tmux.conf.${BACKUP_EXT} 2> /dev/null
    ln -sf ${BASE}/tmux.conf ~/.tmux.conf
fi

# 4. Neovim (~/.config/nvim → dotfiles/nvim; supports lua/, after/, lockfile, etc.)
## Only if nvim is installed; not auto-installed by this script.
if command -v nvim >/dev/null 2>&1; then
    mkdir -p ~/.config
    mv -v ~/.config/nvim ~/.config/nvim.${BACKUP_EXT} 2> /dev/null
    ln -sf ${BASE}/nvim ~/.config/nvim
fi
