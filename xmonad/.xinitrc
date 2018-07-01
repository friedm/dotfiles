#!/bin/sh

xsetroot -cursor_name left_ptr

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -f $HOME/.urxvt/config ] && xrdb -merge $HOME/.urxvt/config

# rebind caps lock to escape (tap) and control (hold)
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

xautolock -time 10 -locker 'systemctl suspend' &

$HOME/bin/setup-input

exec xmonad
