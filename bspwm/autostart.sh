#!/bin/bash

# Usage: run application &
function run{
	if ! pgrep $1 ;
	then
		$@&
	fi
}

xrandr --output Virtual-1 --mode 1920x1080 --primary &
setxkbmap -model pc105 -layout us -variant altgr-intl &
polybr -r modern &
nitrogen --restore &
picom -b --experimantal-backends