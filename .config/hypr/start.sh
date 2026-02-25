#!/usr/bin/env bash
#init wallpaper daemon

awww-daemon &

# swww img ~/Wallpapers/gruv-wallpaper.png &
# swww img ~/Wallpapers/wizard.jpg &
# swww img ~/Downloads/fantasy-portal-moewalls-com.gif &
# swww img ~/Wallpapers/planet.gif --transition-type=center &
awww img ~/wallpapers/pixel_dark.jpg --transition-type=center &

nm-applet --indicator &

waybar -c ~/.config/waybar/config-hyprland.jsonc -s ~/.config/waybar/style.css &

dunst
