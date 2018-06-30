set -e

git submodule update --init
stow remote_bash --no-folding
stow git --no-folding
stow remote_tmux --no-folding
mkdir ~/.yr &> /dev/null || true
stow vim --no-folding
vim +PlugInstall +qall
stow nvim --no-folding
nvim +PlugInstall +qall
