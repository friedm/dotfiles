git submodule update --init
stow bash --no-folding
stow fish --no-folding
stow fzf --no-folding
yes | ~/.fzf/install
stow tmux --no-folding
stow vim --no-folding
vim +PlugInstall +qall
