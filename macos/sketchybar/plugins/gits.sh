#!/bin/sh

sketchybar --set "$NAME" \
  label="\
$($HOME/i3life/scripts/git-file-report.sh $HOME/dotfiles)\
$($HOME/i3life/scripts/git-file-report.sh $HOME/i3life)\
."
