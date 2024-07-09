#!/bin/sh

sketchybar --set "$NAME" \
  icon=" " \
  icon.padding_left=10 \
  background.padding_left=8 \
  background.padding_right=8 \
  background.corner_radius=4 \
  label="\
$(
    $HOME/i3life/scripts/git-file-report.sh \
      $HOME/dotfiles \
      $HOME/i3life \
      $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents
  ) \
"
