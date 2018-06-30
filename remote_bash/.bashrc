#!/bin/bash

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

set -o vi

alias ls='ls --color=auto -C'
alias la='ls -a -G'
alias ll='ls -l'
alias grep='grep --color=auto'
alias rgrep='grep --color=auto -REn'
alias gdiff='git diffw --no-index'
alias n='nvim'
alias v='vim'

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

export EDITOR="/usr/bin/vim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
