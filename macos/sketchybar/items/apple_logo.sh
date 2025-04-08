#!/bin/bash

sketchybar --add item apple.logo $1 \
  --set apple.logo icon= \
  label.drawing=off \
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
  popup.background.border_width=1 \
  popup.background.corner_radius=3 \
  icon.font.size=19 \
  icon.color=0xffffffff \
  background.color=0x00000000 \
  popup.background.border_color=0xff9dd274 \
  popup.background.color=0xe1000001 \
  \
  --add item apple.preferences popup.apple.logo \
  --set apple.preferences icon= \
  label="Preferences" \
  background.padding_left=8 \
  background.padding_right=8 \
  background.color=0x00000000 \
  click_script="open -a 'System Preferences'; sketchybar -m --set apple.logo popup.drawing=off" \
  \
  --add item apple.activity popup.apple.logo \
  --set apple.activity icon= \
  label="Activity" \
  background.color=0x00000000 \
  background.padding_left=8 \
  background.padding_right=8 \
  click_script="open -a 'Activity Monitor'; sketchybar -m --set apple.logo popup.drawing=off" \
  \
  --add item apple.lock popup.apple.logo \
  --set apple.lock icon= \
  label="Lock Screen" \
  background.color=0x00000000 \
  background.padding_left=8 \
  background.padding_right=8 \
  click_script="pmset displaysleepnow; sketchybar -m --set apple.logo popup.drawing=off"