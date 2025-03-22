#!/bin/bash

sketchybar --add item clock $1 \
	--set clock \
	update_freq=1 \
	script="$PLUGIN_DIR/clock.sh" \
	label.font.style=Bold \
	\
	--add item volume $1 \
	--set volume \
	script="$PLUGIN_DIR/volume.sh" \
	--subscribe volume volume_change \
	\
	--add item battery $1 \
	--set battery \
	--subscribe battery system_woke power_source_change \
	update_freq=120 \
	script="$PLUGIN_DIR/battery.sh" \
