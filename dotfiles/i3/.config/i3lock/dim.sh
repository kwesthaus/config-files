#!/bin/bash

# meant to be used with xss-lock. see the xss-lock(1) manpage
# based on example script /usr/share/doc/xss-lock/dim-screen2.sh

# When receiving SIGHUP from xss-lock (inactivity timer reset):
#       - stop fading and reset backlight to original brightness
# When receiving SIGTERM from xss-lock (first screensaver cycle -> dimming complete, time to run locker):
#       - wait 2 seconds (for screen to turn off) then reset backlight to original brightness

echo "starting dim.sh"

if [ -z $1 ]; then
    echo "no dim time passed, exiting"
    exit 1
fi

TIME=$1
STEP_COUNT=$(( $TIME * 5 ))

ORIGINAL=$(brightnessctl get)
# MINIMUM=0
# 5%
MINIMUM=$(($ORIGINAL / 20))
STEP_SIZE=$(( ($ORIGINAL - $MINIMUM) / $STEP_COUNT ))

echo "time: $TIME"
echo "original: $ORIGINAL"
echo "minimum: $MINIMUM"
echo "step_count: $STEP_COUNT"
echo "step_size: $STEP_SIZE"
# don't have xbacklight working, so doing my own thing below

trap 'brightnessctl --restore' EXIT
trap 'echo "SIGHUP"; exit 0' HUP
# DPMS is set to 1 second after so i3lock has a chance to get started, so we need to start after that (2 seconds)
trap 'echo "SIGTERM"; sleep 2s; exit 0' TERM

brightnessctl --save

# brightnessctl set 20%

for (( i=0; i<$STEP_COUNT; i+=1 ))
do
    brightnessctl set "$STEP_SIZE"-
    echo $i
    sleep 0.2s
done

echo "sleeping"
sleep infinity & # in background so we can still handle signals
wait
echo "that wasn't infinity"

