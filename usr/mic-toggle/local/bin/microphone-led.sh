#!/bin/bash
LEDPATHS="/sys/class/leds/*capslock/brightness"
for LED in $LEDPATHS; do
	amixer get Capture | grep -q '\[off\]' && echo 0 > "$LED" || echo 1 > "$LED"
done
