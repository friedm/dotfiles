set -e

stow user-dirs --no-folding
stow xmonad --no-folding
stow urxvt --no-folding
stow rofi --no-folding
stow vimperator --no-folding
stow tridactyl --no-folding

cat lock.service | envsubst | sudo tee /etc/systemd/system/lock.service > /dev/null
sudo systemctl enable lock.service

