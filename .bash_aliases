alias rm='rm -i'
alias ff='find . -name'
alias cp='cp -i'
alias mv='mv -i'
alias xterm='xterm -bg white -fg black -fa 'Monospace''
alias ctags='ctags -RV --file-tags=yes'
alias gst='git status -s'
alias gdf='git status -s | grep -v "??" | cut -d " " -f3 | xargs git diff '
alias gct='git status -s | grep -v "??" | cut -d " " -f3 | xargs git commit -m $1 '
alias cl='git5 export --copy-detection -i'
alias br='git branch'

alias placer=/google/data/ro/projects/placer/placer

alias roster_dev='mysql -u root -h 173.194.104.117 -pabc123 roster_dev_db'
alias roster_prod='mysql -u root -h 173.194.226.160 roster'
alias nickfury_dev='mysql -u root -h 35.185.247.248 -pabc123 nickfury_dev'
alias nickfury_prod='mysql -u root -h 35.202.254.46 -pdABIbh8OxLG13n63 nickfury'
alias announce_dev='mysql -u hansrajd -h 173.194.246.226 announce'
alias announce_prod='mysql -u hansrajd -h 173.194.230.126 announce'

alias p='cd ~/Desktop/Interviews/programs/'

function op() {
  gvim -p `find . -name "$1"`
}
