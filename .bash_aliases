set -o vi

RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`

# export PS1="\u@\h \w$ "
export PS1="${GREEN}\w${RESET} ${YELLOW}\$(parse_git_branch)${RESET}$ "
export CLICOLOR=YES  # For macOS
export EDITOR=vim
export CSCOPE_EDITOR=vim

source $HOME/git-completion.bash

alias rm='rm -iv'
alias ff='find . -name'
alias cp='cp -iv'
alias mv='mv -iv'
alias xterm='xterm -bg white -fg black -fa 'Monospace''
alias ctags='ctags -RV --file-tags=yes'
alias gotags='gotags -R . >> tags'
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

get_cluster_name() {
    kubectl config view | grep "cluster: " | cut -d ":" -f2 | xargs
}

get_namespace() {
    kubectl config view | grep "namespace: " | cut -d ":" -f2 | xargs
}

alias kk='echo cluster: "${RED}$(get_cluster_name)${RESET}    namespace: ${RED}$(get_namespace)${RESET}"'

# Golang
alias dlv=/Users/hansrajd/go/bin/dlv

cover () {
    local t=$(mktemp -t cover)
    go test ./... $COVERFLAGS -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}
