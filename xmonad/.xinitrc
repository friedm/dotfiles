#!/bin/sh

xsetroot -cursor_name left_ptr

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -f $HOME/.urxvt/config ] && xrdb -merge $HOME/.urxvt/config

# disable left control
xmodmap -e 'keycode 37='

xautolock -detectsleep -notify 120 -notifier "xset dpms force off" \
  -time 20 -locker 'bat|grep discharging -q && systemctl hybrid-sleep' &

$HOME/bin/setup-input

exec xmonad

