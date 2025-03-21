#!/bin/bash

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

if [[ $FOCUSED_WORKSPACE =~ ^[1-9]$ ]]; then
  case $FOCUSED_WORKSPACE in
    1) ICON="" ;;
    2) ICON="" ;;
    3) ICON="" ;;
    4) ICON="" ;;
    5) ICON="󰎱" ;;
    6) ICON="󰎳" ;;
    7) ICON="󰎶" ;;
    8) ICON="󰎹" ;;
    9) ICON="" ;;
    "10") ICON="" ;;
    E) ICON="" ;;
  esac
else
  ICON="" 
fi

# Update the sketchybar item
sketchybar --set current label="$FOCUSED_WORKSPACE" icon="$ICON"
