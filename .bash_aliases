# export PS1="\u@\h \w$ "
export PS1="\u@\h:\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=YES  # For macOS
export EDITOR=vim

source $HOME/git-completion.bash

alias rm='rm -i'
alias ff='find . -name'
alias cp='cp -i'
alias mv='mv -i'
alias xterm='xterm -bg white -fg black -fa 'Monospace''
alias ctags='ctags -RV --file-tags=yes'
alias s='git status -s'
alias d='git diff'
alias b='git branch'
alias gct='git commit -am $1'
# alias cl='git5 export --copy-detection -i'

# alias placer=/google/data/ro/projects/placer/placer

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

# Set options
shopt -s extglob

function op() {
  gvim -p `find . -name "$1"`
}

function g() {
  grep -nri --color=auto "$1" .
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/ˆ[ˆ*]/d' -e 's/* \(.*\)/ (\1)/'
}
