#!/bin/bash
# Common commands
alias q='exit'
alias c='clear'
alias lsl='ls -l'
alias lsa='ls -a'
alias sc='source ~/.bashrc'
alias ec='vim ~/.bashrc'
alias p='cat'
alias pd='pwd'
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'

# Navigation commands
alias nh='cd ~'
alias nr='cd /'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


alias dc='docker container'
alias dcs='docker container start'
alias dcl='docker container logs'
alias dcls='docker container ls --all'

# Git Commands
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gnb='git checkout -b'
alias gck='git checkout'
alias gckm='git checkout master'
alias gckmp='git checkout master && git pull'
alias gac='ga && gc'
alias gacp='ga && gc && gp'
alias gbls='git branch -vv'

# Python Commands
alias pws='python -m http.server 8000'
alias pactd='source /c/venvs/digitalkpi/Scripts/activate'

# Google Cloud COmmands
alias bq='bq.cmd'

# Project DKPI aliases
export PRJ_DKPI_ROOT='/c/repo/bayc-alec'
alias cddk='cd ${PRJ_DKPI_ROOT}'
alias dktest='${PRJ_DKPI_ROOT}/build/build.sh unittests'
alias dkcov='${PRJ_DKPI_ROOT}/build/build.sh coverage'
alias dkbuild='${PRJ_DKPI_ROOT}/build/build.sh build'
