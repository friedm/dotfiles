#!/bin/sh

xsetroot -cursor_name left_ptr

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -f $HOME/.urxvt/config ] && xrdb -merge $HOME/.urxvt/config

xautolock -time 10 -locker 'systemctl suspend' &

$HOME/bin/setup-input

exec xmonad

