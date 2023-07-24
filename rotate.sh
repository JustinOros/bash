#!/bin/bash
# Description: Rotate screen clockwise in a complete circle
# Usage: rotate.sh
# Author: Justin Oros
# Source: https://github.com/JustinOros

screen_types="VGA HDMI DP eDP"
screen_rotations="right inverted left normal"
screens=4
sleep_time=3
display=:0

rotate() {
	export DISPLAY=$display
	for screen_rotation in $screen_rotations
	do
		printf "Attempting to rotate screens $screen_rotation...\n"
		for screen_type in $screen_types
		do
			for screen in 0 .. $screens
			do
				xrandr -o $screen_rotation > /dev/null 2>&1
			done
		done
		sleep $sleep_time
	done
}
rotate
