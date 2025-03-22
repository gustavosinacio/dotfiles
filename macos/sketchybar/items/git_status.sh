#!/bin/bash

sketchybar --add item git_status $1 \
	--set git_status \
	update_freq=30 \
	icon= \
	label.font.size=11 \
	icon.font.size=18 \
	icon.padding_left=10 \
	icon.color=0xffF17013 \
	background.padding_left=8 \
	background.padding_right=8 \
	background.corner_radius=4 \
	script="$PLUGIN_DIR/gits.sh"