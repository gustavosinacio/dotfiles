#!/bin/bash

# Get the latest repo status
REPOS=$(~/unixverse/scripts/git-file-report-by-line.sh)

# Remove existing items from popup
sketchybar --remove '/repo_.*/' 2>/dev/null

# Add new items
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