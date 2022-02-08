#!/bin/sh
xrandr --newmode 2400x1350  272.50  2400 2568 2824 3248  1350 1353 1358 1400 -hsync +vsync
xrandr --addmode HDMI-1 "2400x1350"
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 2400x0 --rotate normal --output HDMI-1 --mode 2400x1350 --pos 0x0 --rotate normal
