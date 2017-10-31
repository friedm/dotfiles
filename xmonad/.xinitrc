#!/bin/sh

xsetroot -cursor_name left_ptr

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
[ -f $HOME/.urxvt/config ] && xrdb -merge $HOME/.urxvt/config

setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
xmodmap -e 'keycode 94 = Shift_L'

synclient TouchpadOff=2

xautolock -time 10 -locker 'physlock -sd && sudo /usr/sbin/pm-suspend' &

exec xmonad
