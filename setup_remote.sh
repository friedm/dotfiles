set -e

git submodule update --init
mv $HOME/.bashrc $HOME/.bashrc.old || true
stow remote_bash --no-folding
stow git --no-folding
stow remote_tmux --no-folding
mkdir ~/.yr &> /dev/null || true
stow vim --no-folding
stow nvim --no-folding
yes | nvim +PlugInstall +qall
