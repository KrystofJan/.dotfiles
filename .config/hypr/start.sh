#!/usr/bin/env bash
#init wallpaper daemon
swww init &

swww img ~/Wallpapers/gruv-wallpaper.png &

nm-applet --indicator &

waybar &

dunst
