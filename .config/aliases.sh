#!/bin/sh

# stuff i use all the time
alias v='nvim'
alias g='git'
alias c='cargo'
alias zat='zathura --fork'

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

# dotfiles
alias dots='cd ~/.dots && stow . && cd - &> /dev/null'

# calcurse
alias today='calcurse -a'
alias todo='calcurse -t'
