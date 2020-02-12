#!/bin/bash

# rotate screen clockwise once
# by Justin Oros

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
