set -e

git submodule update --init
mv $HOME/.bashrc $HOME/.bashrc.old || true
stow bash --no-folding
stow common --no-folding
cp ./dotfiles.env.default $HOME/.dotfiles.env
stow git --no-folding
stow tmux --no-folding
mkdir ~/.yr &> /dev/null || true
stow vim --no-folding
stow nvim --no-folding
vim +PlugInstall +qall
stow bin --no-folding
