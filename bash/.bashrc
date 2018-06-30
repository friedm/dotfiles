#!/bin/bash

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  find $HOME/.ssh -type f -exec grep -l "PRIVATE" {} \; | xargs ssh-add
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add


set -o vi


alias ls='exa'
alias la='exa -a'
alias ll='exa -l --git'
alias lls='ls -C'
alias lla='ls -a -G'
alias lll='ls -l'
alias grep='grep --color=auto'
alias rgrep='grep --color=auto -REn'
alias gdiff='git diffw --no-index'
alias n='nvim'
alias v='vim'


export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

source $HOME/.dotfiles.env
PS1="\[\e[1;37m\][\u@$DOTFILES_PS1_HOSTNAME \W\[\e[0;34m\]\$git_branch\[\e[0;34m\]\$git_dirty\[\e[1;37m\]]\$ \[\e[0m\]"

export TERMINAL=urxvt
export TERM=xterm-256color
export EDITOR="/usr/bin/nvim"
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/.go

alias c="xclip -selection c"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
