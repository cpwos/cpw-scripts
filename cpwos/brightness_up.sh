#!/bin/bash

if [[ ! -f /usr/bin/blight ]]; then
	notify-send -u low -t 1500  "blight not found. Please, install it."
	exit 1
fi

device=$(ls /sys/class/backlight | head -n 1)
brightness_level="$(blight -d $device get brightness)"
percent="$(($brightness_level * 100 / 255))"

blight -d $device set +10% && notify-send -u low -t 1500  "Brightness Up to $percent%"
