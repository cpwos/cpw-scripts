#!/bin/bash

if [[ ! -f /usr/bin/amixer ]]; then
	notify-send -u low -t 1500  "amixer not found. Please, install it."
	exit 1
fi

mute_state=$(amixer get Master | tail -n 1 | awk -F ' ' '{print $6}' | tr -d '[]%')
volume_level="$(amixer get Master | tail -n 1 | awk -F ' ' '{print $5}' | tr -d '[]%')%"

if [[ $mute_state == *"on"*  ]]; then
	amixer -q set Master toggle && notify-send -u low -t 1500  "Volume state: muted"
else
	amixer -q set Master unmute && notify-send -u low -t 1500  "Volume state: $volume_level"
fi
