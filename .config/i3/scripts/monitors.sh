#!/bin/bash

# Define monitor names
LAPTOP="eDP-1"
BIG_MONITOR="DP-1"
SMALL_MONITOR="HDMI-1"

# Helper to get width of a connected monitor
get_width() {
    local MON=$1
    xrandr | grep -A1 "^$MON connected" | tail -n1 | grep -oP '\d+x\d+' | cut -d'x' -f1
}

# Get connected monitors
CONNECTED=$(xrandr | grep " connected" | cut -d" " -f1)
MONITORS=($CONNECTED)

# Initialize positions
POS_X=0

# Logging
log() {
    echo "[INFO] $1"
}

# Start by turning off all known monitors
xrandr --output $LAPTOP --off --output $BIG_MONITOR --off --output $SMALL_MONITOR --off

# Place monitors left to right in desired order if connected
if [[ "${MONITORS[*]}" =~ $LAPTOP ]]; then
    WIDTH=$(get_width $LAPTOP)
    log "Setting $LAPTOP at position ${POS_X}x0"
    xrandr --output $LAPTOP --auto --primary --pos ${POS_X}x0
    POS_X=$((POS_X + WIDTH))
fi

if [[ "${MONITORS[*]}" =~ $BIG_MONITOR ]]; then
    WIDTH=$(get_width $BIG_MONITOR)
    log "Setting $BIG_MONITOR at position ${POS_X}x0"
    xrandr --output $BIG_MONITOR --auto --primary --pos ${POS_X}x0
    POS_X=$((POS_X + WIDTH))
fi

if [[ "${MONITORS[*]}" =~ $SMALL_MONITOR ]]; then
    WIDTH=$(get_width $SMALL_MONITOR)
    log "Setting $SMALL_MONITOR at position ${POS_X}x0"
    xrandr --output $SMALL_MONITOR --auto --primary --pos ${POS_X}x0
fi


feh --bg-scale ~/wallpapers/pixel.jpg
