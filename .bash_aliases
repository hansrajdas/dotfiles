export PS1="\u@\h \w$ "

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

# alias roster_dev='mysql -u root -h 173.194.104.117 -pabc123 roster_dev_db'
# alias roster_prod='mysql -u root -h 173.194.226.160 roster'
# alias nickfury_dev='mysql -u root -h 35.185.247.248 -pabc123 nickfury_dev'
# alias nickfury_prod='mysql -u root -h 35.202.254.46 -pdABIbh8OxLG13n63 nickfury'
# alias announce_dev='mysql -u hansrajd -h 173.194.246.226 announce'
# alias announce_prod='mysql -u hansrajd -h 173.194.230.126 announce'

# alias p='cd ~/Desktop/Interviews/programs/'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function op() {
  gvim -p `find . -name "$1"`
}

function g() {
  grep -nri --color=auto "$1" .
}

# Add this to .bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

