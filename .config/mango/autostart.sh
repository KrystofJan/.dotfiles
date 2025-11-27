#!/usr/bin/env bash

hyprlock

swww-daemon &
swww img ~/Wallpapers/planet.gif --transition-type=center &
nm-applet --indicator &
waybar &
dunst
