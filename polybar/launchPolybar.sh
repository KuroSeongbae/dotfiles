#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log
polybar main 2>&1 | tee -a /tmp/polybarMain.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar2.log & disown
polybar tertiary 2>&1 | tee -a /tmp/polybar3.log & disown

echo "Bars launched..."