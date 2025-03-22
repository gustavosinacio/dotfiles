#!/bin/bash

sketchybar --add item front_app $1 \
	--set front_app \
	icon.drawing=off \
	label.padding_left=16 \
	label.font.size=15 \
	background.color=0x00000000 \
	script="$PLUGIN_DIR/front_app.sh" \
	"${front_app_configs[@]}" \
	--subscribe front_app front_app_switched \
	--add item chevron left \
	--set chevron icon= \
	label.drawing=off \
	label.font.size=15 \
	icon.padding_left=4 \
	icon.padding_right=0 \
	background.padding_right=$LEFT_BAR_APP_SPACING \
	background.padding_left=0 \
	background.color=0x00000000