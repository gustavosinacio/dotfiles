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
	background.padding_left=8 \
	background.padding_right=8 \
	background.corner_radius=4 \
	popup.background.border_width=1 \
	popup.background.corner_radius=8 \
	popup.background.padding_left=10 \
	popup.background.padding_right=10 \
	popup.background.border_color=0xff9dd274 \
	popup.background.color=0xe1000001 \
	popup.drawing=on \
	click_script="sketchybar --set git_status popup.drawing=toggle"

# Save the output to a temporary variable

# Use echo and pipe to while loop
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
