#!/bin/bash

# to launch a different desktop then the default: desktop=desktopname startx
desktop=${desktop:-Hyprland}
dbus-run-session $desktop
