#!bin/sh
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

# to launch a different desktop then the default: desktop=desktopname startx
desktop=${desktop:-awesome}
exec dbus-run-session -- $desktop
