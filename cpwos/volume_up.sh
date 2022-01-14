#!/bin/bash

if [[ ! -f /usr/bin/amixer ]]; then
	notify-send -u low -t 1500  "amixer not found. Please, install it."
	exit 1
fi

cantity=5
volume_level=$(amixer get Master | tail -n 1 | awk -F ' ' '{print $5}' | tr -d '[]%')
volume_final=$((volume_level+cantity))

if (( $volume_final > 100 )); then
	volume_final=100
fi

volume_percent="$volume_final%"

amixer -Mq set Master,0 $cantity%+ unmute && notify-send -u low -t 1500  "Volume Up to $volume_percent"
