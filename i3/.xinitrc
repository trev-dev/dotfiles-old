#!/bin/bash
dbus-update-activation-environment --systemd DISPLAY
/etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
setxkbmap -option caps:escape
export TERMINAL=konsole
exec i3
