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

if ! xrandr | grep 'eDP connected'; then # home
    xrandr --output HDMI-0 --mode 1920x1080 --pos 3610x300 --rotate normal --output DP-2 --primary --mode 2560x1080 --rate 144.0 --pos 1050x300 --rotate normal --output DP-5 --mode 1680x1050 --pos 0x0 --rotate right --output USB-C-0 --off &
elif xrandr | grep 'eDP-1 connected'; then # Laptop
    echo "meow"
else # working station
    if xrandr --listactivemonitors | grep 'DisplayPort-2' &&
    xrandr --listactivemonitors | grep 'DisplayPort-4'; then
        echo "usual work setup"
        xrandr --output eDP --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output DisplayPort-3 --off --output DisplayPort-4 --mode 1920x1080 --pos 2560x0 --rotate normal --output DisplayPort-5 --off --output DisplayPort-6 --off &
    elif xrandr --listactivemonitors | grep 'eDP' &&
    xrandr --listactivemonitors | grep 'DisplayPort-2' &&
    xrandr --listactivemonitors | grep 'DisplayPort-4'; then
        echo "extended work setup"
    elif xrandr --listactivemonitors | grep 'DisplayPort-0' &&
    xrandr --listactivemonitors | grep 'DisplayPort-1'; then
        echo "office setup"
        xrandr --output eDP --off --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-1 --mode 2560x1440 --pos 2560x0 --rotate normal --output DisplayPort-2 --off --output DisplayPort-3 --off
    else xrandr --listactivemonitors | grep 'eDP'
        echo "simple work setup"
    fi
fi

# General
/usr/lib/polkit-kde-authentication-agent-1 &
#/usr/lib/xfce-polkit/xfce-polkit &
setxkbmap -model pc105 -layout us -variant altgr-intl &
sudo mount /dev/sdb1 ~/Drives/Second_Drive/ & # sudo possible bc added sudoers rule
run picom picom --experimental-backends -b &
#nitrogen --restore &
~/.fehbg &
# ~/.config/polybar/launchPolybar.sh &
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
oneko -tofocus
