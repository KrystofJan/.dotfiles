#!/usr/bin/env bash
#init wallpaper daemon
swww init &

swww img ~/Wallpapers/gruv-wallpaper.png -o "*" &

nm-applet --indicator &

waybar &

dunst
