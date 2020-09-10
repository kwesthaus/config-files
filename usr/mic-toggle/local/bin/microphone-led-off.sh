#!/bin/bash
LEDPATHS="/sys/class/leds/*capslock/brightness"
for LED in $LEDPATHS; do
	echo 0 > "$LED"
done
