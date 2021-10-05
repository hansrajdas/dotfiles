set -o vi

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

# export PS1="\u@\h \w$ "
export PS1="\[\033[32m\]\w\[\033[33m\] \$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=YES  # For macOS
export EDITOR=vim

source $HOME/git-completion.bash

alias rm='rm -iv'
alias ff='find . -name'
alias cp='cp -iv'
alias mv='mv -iv'
alias xterm='xterm -bg white -fg black -fa 'Monospace''
alias ctags='ctags -RV --file-tags=yes'
alias gotags='gotags -R .'
alias cscope='cscope -RC'
alias s='git status -s'
alias d='git diff'
alias b='git branch'
alias gl='git log --all --graph'
alias python='python3'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias notes='vim ~/code/2775/hansrajd_notes.md'

# Set options
shopt -s extglob

function op() {
  vim -p `find . -name "$1"`
}

function g() {
  grep -nri --color=auto "$1" .
}

parse_git_branch() {
  git branch 2> /dev/null | grep "\*" | cut -d " " -f2
}

# K8s
source <(kubectl completion bash)  # setup autocomplete in bash into the current shell, bash-completion package should be installed first.

alias k=kubectl
complete -F __start_kubectl k

alias kk='echo "${RED}`basename $KUBECONFIG`${RESET}"'

alias dlv=/Users/hansrajd/go/bin/dlv
