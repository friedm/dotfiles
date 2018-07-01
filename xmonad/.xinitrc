#!/bin/sh

xsetroot -cursor_name left_ptr

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -f $HOME/.urxvt/config ] && xrdb -merge $HOME/.urxvt/config

# rebind caps lock to escape (tap) and control (hold)
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'
# disable left control
xmodmap -e 'keycode 37='

xautolock -time 10 -locker 'systemctl suspend' &

$HOME/bin/setup-input

exec xmonad
