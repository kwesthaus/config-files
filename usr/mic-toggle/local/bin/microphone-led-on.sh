#!/bin/bash
LEDPATHS="/sys/class/leds/*capslock/brightness"
for LED in $LEDPATHS; do
	echo 1 > "$LED"
done
