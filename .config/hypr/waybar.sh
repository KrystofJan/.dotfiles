#!/bin/sh
pkill waybar
waybar -c ~/.config/waybar/config-hyprland.jsonc -s ~/.config/waybar/style.css &
