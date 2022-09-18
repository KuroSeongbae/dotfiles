#!/bin/bash

# check if application is running
# if app is running => don't execute again
# takes two arguments (1: process, 2: application to launch) because for some applications the process is named different from the application itself
run() {
  if [ -z "$(pgrep $1)" ]
  then
    echo "$2"
    $2
  fi
}

# General
/usr/lib/polkit-kde-authentication-agent-1 &
#/usr/lib/xfce-polkit/xfce-polkit &
setxkbmap -model pc105 -layout us -variant altgr-intl &
sudo mount /dev/sdb1 ~/Drives/Second_Drive/ & # sudo possible bc added sudoers rule
run picom picom --experimental-backends -b &
#nitrogen --restore &
~/.fehbg &
~/.config/polybar/launchPolybar.sh &
run dunst dunst &
#gammy & games lagg recently :(
redshift -x
redshift -O 5920K & # reset redshift value and so it doesn't sum up
run flameshot flameshot &
noisetorch -i &
run volumeicon volumeicon &
nm-applet &
run vivaldi vivaldi-stable &
run Discord discord &
run conky conky &
wmname LG3D & # to fix java's reparenting issue (Jetbrains programs); program: wmname (AUR) needed. Also: export _JAVA_AWT_WM_NONREPARENTING=1 in .profile: https://www.reddit.com/r/bspwm/comments/267srd/problem_with_intellij_bspwm/
numlockx on & # activate numlock
