alias ls='ls -G'
alias la='ls -a -G'
alias grep='grep --color=auto'
alias rgrep='grep --color=auto -REn'
alias gdiff='git diffw --no-index'
alias n='nvim'
alias v='vim'

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PS1="\[\e[1;37m\][\u@\h \W\[\e[0;34m\]\$git_branch\[\e[0;34m\]\$git_dirty\[\e[1;37m\]]\$ \[\e[0m\]"

export TERMINAL=urxvt
export TERM=xterm-256color
export EDITOR="/usr/bin/nvim"
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin

set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
