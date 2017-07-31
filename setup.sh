git submodule update --init
stow bash --no-folding
stow fish --no-folding
stow user-dirs --no-folding
stow git --no-folding
ln -s $(pwd)/git/.gitignore ../.gitignore
stow tmux --no-folding
stow vim --no-folding
stow nvim --no-folding
vim +PlugInstall +qall
nvim +PlugInstall +qall

