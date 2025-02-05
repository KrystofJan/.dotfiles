#!/bin/sh
killall .waybar-wrapped
if [[ $USER = "zahry" ]]
then
    waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
    waybar &
fi
