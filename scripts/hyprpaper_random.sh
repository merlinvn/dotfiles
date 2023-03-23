#!/bin/bash

wallpaper=$(fd "" ~/wallpapers/ | shuf --random-source=/dev/urandom -n 1)
echo $wallpaper
echo -ne "preload = $wallpaper\nwallpaper = ,$wallpaper" > ~/.config/hypr/hyprpaper.conf
hyprpaper
