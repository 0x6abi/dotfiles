#!/bin/sh

# stuff i use all the time
# alias v='nvim'
alias hx='helix'
alias g='git'
alias c='cargo'

# interactive file modification
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# use readable sizes
alias df='df -h'
alias free='free -m'

# colors
alias ls='ls --color=always'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'
alias rg='rg --color=always'

# maven should always load the config file
alias mvn='mvn -gs "$XDG_CONFIG_HOME/maven/settings.xml"'

#dotfiles
alias dots='cd ~/dotfiles && stow . && cd - &> /dev/null'
