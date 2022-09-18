#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

primary=$(xrandr --query | grep " connected primary" | cut -d" " -f1)

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m
    if [[ "$m" = "$primary" ]]; then
      MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybarMain.log & disown
      continue
    else
      MONITOR=$m polybar --reload secondary 2>&1 | tee -a /tmp/polybarSecondary.log & disown
      continue
    fi
  done
fi