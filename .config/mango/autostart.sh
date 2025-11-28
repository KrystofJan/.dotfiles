#!/usr/bin/env bash

hyprlock

swww-daemon &
swww img ~/Wallpapers/planet.gif --transition-type=center &
nm-applet --indicator &
waybar &
waybar -c ~/.config/waybar/config-mango.jsonc -s ~/.config/waybar/style.css &
dunst
