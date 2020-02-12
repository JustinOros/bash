#!/bin/bash

# rotate all screens clockwise once
# by Justin Oros
# revised FEB 12 2020

myScreenTypes="VGA HDMI DP eDP"
myScreenRotations="normal right inverted left normal"
myScreenNum=1
mySleepTime=3
myDisplay=:0

rotate() {
export DISPLAY=$myDisplay
for myScreenRotation in $myScreenRotations
do
	for myScreenType in $myScreenTypes
	do
		xrandr --output $myScreenType-$myScreenNum --rotate $myScreenRotation > /dev/null 2>&1
		sleep $mySleepTime
	done
done
}
rotate
