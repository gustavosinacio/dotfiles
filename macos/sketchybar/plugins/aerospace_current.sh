#!/bin/bash

# Get the focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Update the sketchybar item
sketchybar --set current label="$FOCUSED_WORKSPACE"
