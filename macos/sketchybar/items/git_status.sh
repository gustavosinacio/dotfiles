#!/bin/bash

sketchybar --add item git_status $1 \
	--set git_status \
	update_freq=30 \
	script="$PLUGIN_DIR/gits.sh && $PLUGIN_DIR/git_status_update.sh" \
	icon= \
	label.font.size=11 \
	icon.font.size=18 \
	icon.padding_left=10 \
	icon.color=0xffF17013 \
	background.padding_left=16 \
	background.padding_right=24 \
	background.corner_radius=4 \
	popup.background.border_width=1 \
	popup.background.corner_radius=3 \
	popup.background.border_color=0xff9dd274 \
	popup.background.color=0xf8000001 \
	popup.drawing=on \
	click_script="sketchybar --set git_status popup.drawing=toggle"

echo "$REPOS" | while read -r REPO; do
	# Skip empty lines
	[ -z "$REPO" ] && continue

	sketchybar --add item "repo_${REPO%% *}" popup.git_status \
		--set "repo_${REPO%% *}" \
		label="$REPO" \
		icon.drawing=off \
		background.padding_left=8 \
		background.padding_right=8 \
		background.color=0x00000000 \
		click_script="sketchybar --set git_status popup.drawing=off"
done
