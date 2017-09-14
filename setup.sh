set -e

git submodule update --init
stow bash --no-folding
cp ./dotfiles.env.default $HOME/.dotfiles.env
stow fish --no-folding
stow user-dirs --no-folding
stow git --no-folding
stow tmux --no-folding
mkdir ~/.yr &> /dev/null || true
stow vim --no-folding
stow nvim --no-folding
vim +PlugInstall +qall
nvim +PlugInstall +qall
