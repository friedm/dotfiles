# Dotfiles

Configuration files for development environment, managed with GNU stow.

### Setup
First clone the repo to any directory in $HOME (should be top-level).

#### Base
* (git, stow), bash, tmux, vim, neovim

``` bash
./setup.sh
```

#### Graphical
* xmonad, x11-server-utils, xinit, xcape
* xautolock, physlock, pm-utils, upower
* urxvt, rofi, icecat/firefox, vimperator

``` bash
./setup_graphical.sh
```

#### Other
* zlib1g-dev, libssl-dev, build-essential, cmake
* rustup, exa, rg
