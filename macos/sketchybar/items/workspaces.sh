#!/bin/bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item current $1 \
	--subscribe current aerospace_workspace_change mouse.clicked \
	--set current \
	drawing=on \
	script="$PLUGIN_DIR/aerospace_current.sh" \
	click_script="sketchybar --set current popup.drawing=toggle" \
	icon.drawing=on \
	icon.font.size=20 \
	label.padding_left=8 \
	label.padding_right=10 \
	label.padding_left=8 \
	label.padding_right=10 \
	popup.background.border_width=1 \
	popup.background.corner_radius=8 \
	popup.background.padding_left=10 \
	popup.background.padding_right=10 \
	popup.horizontal=true \
	popup.background.border_color=0xff9dd274 \
	popup.background.color=0xe1000001

# Get all workspace names to populate the popup
WORKSPACES=$(aerospace list-workspaces --all)
# Add each workspace as an item in the popup
for WORKSPACE in $WORKSPACES; do
	sketchybar --add item "space_$WORKSPACE" popup.current \
		--set "space_$WORKSPACE" \
		label="$WORKSPACE" \
		icon.drawing=off \
		background.padding_left=8 \
		background.padding_right=8 \
		background.color=0x00000000 \
		click_script="aerospace workspace $WORKSPACE; sketchybar --set current popup.drawing=off"
done

# # Add workspaces for all monitors
# for monitor in $(aerospace list-monitors --format "%{monitor-appkit-nsscreen-screens-id}"); do
# 	for sid in $(aerospace list-workspaces --monitor "$monitor"); do
# 		# Determine which display this workspace should be shown on
# 		display_id="1"
# 		# if [ "$sid" -ge 6 ] && [ "$sid" -le 7 ]; then
# 		# 	display_id="2"
# 		# fi
#
# 		sketchybar --add item space.$sid left \
# 			--set space.$sid display="$display_id" \
# 			--subscribe space.$sid aerospace_workspace_change \
# 			--set space.$sid \
# 			drawing=on \
# 			background.color=0x44ffffff \
# 			background.corner_radius=5 \
# 			background.drawing=on \
# 			background.border_color=0xAAFFFFFF \
# 			background.border_width=0 \
# 			background.height=25 \
# 			icon="$sid" \
# 			icon.padding_left=10 \
# 			label.padding_left=0 \
# 			label.y_offset=-1 \
# 			click_script="aerospace workspace $sid" \
# 			script="$CONFIG_DIR/plugins/aerospace.sh $sid"
# 	done
# done