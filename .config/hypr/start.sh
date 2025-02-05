#!/usr/bin/env bash
#init wallpaper daemon

hyprlock

swww init &

# swww img ~/Wallpapers/gruv-wallpaper.png &
# swww img ~/Wallpapers/wizard.jpg &
swww img ~/Downloads/fantasy-portal-moewalls-com.gif &
swww img ~/Wallpapers/bg.gif --transition-type=center &


nm-applet --indicator &

waybar &

dunst
