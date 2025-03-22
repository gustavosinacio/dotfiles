#!/bin/bash

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

if [[ $FOCUSED_WORKSPACE =~ ^[1-9]$ || $FOCUSED_WORKSPACE =~ ^[0-9]{2}$ || $FOCUSED_WORKSPACE =~ ^[A-Z]$ ]]; then
  case $FOCUSED_WORKSPACE in
    1) ICON="" ;;
    2) ICON="" ;;
    3) ICON="" ;;
    4) ICON="" ;;
    9) ICON="" ;;
    10) ICON="" ;;
    C) ICON="" ;;
    E) ICON="" ;;
    S) ICON="" ;;
    I) ICON="" ;;
    *) ICON="" ;;
  esac
fi

# Update the sketchybar item
sketchybar --set current label="$FOCUSED_WORKSPACE" icon="$ICON"
