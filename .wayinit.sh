#!/bin/bash

# to launch a different desktop then the default: desktop=desktopname startx
desktop=${desktop:-Hyprland} # Hyprland sway
dbus-run-session $desktop
