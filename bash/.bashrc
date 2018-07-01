#!/bin/bash

source $HOME/.sshagent_setup

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

set -o vi

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

source $HOME/.dotfiles.env
PS1="\[\e[1;37m\][\u@$DOTFILES_PS1_HOSTNAME \W\[\e[0;34m\]\$git_branch\[\e[0;34m\]\$git_dirty\[\e[1;37m\]]\$ \[\e[0m\]"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source $HOME/.aliases
source $HOME/.vars
