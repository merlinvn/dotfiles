#!/bin/sh

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap
# 
# # merge in defaults and keymaps
# 
# if [ -f $sysresources ]; then
#   xrdb -merge $sysresources
# fi
# 
# if [ -f ~/.Xresources ]; then
#   # xrdb -merge ~/.Xresources
# fi
# 
# 
# if [ -f $sysmodmap ]; then
#   xmodmap $sysmodmap
# fi
# 
# if [ -f "$userresources" ]; then
#  xrdb -merge "$userresources"
# fi
# 
# if [ -f "$usermodmap" ]; then
#   xmodmap "$usermodmap"
# fi
# 
# # start some nice programs
# 
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#   for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#     [ -x "$f" ] && . "$f"
#   done
#   unset f
# fi
# 
# # nitrogen --restore &
# # picom &
# # setxkbmap -option caps:swapescape
# xsetroot -cursor_name Left_ptr
# 
# # ibus-daemon -drx &
# 
# # picom --experimental-backends &
# # flameshot &
# # stalonetray &
# # pnmixer &
# # betterlockscreen -u ~/wallpapers/ &
# 
# # exec xmonad
# # exec dbus-launch leftwm
# # exec i4
