#!/bin/sh

sketchybar --set "$NAME" \
	icon=" " \
	icon.padding_left=10 \
	icon.color=0xffF17013 \
	background.padding_left=8 \
	background.padding_right=8 \
	background.corner_radius=4 \
   label="$($HOME/unixverse/scripts/git-file-report.sh)"
