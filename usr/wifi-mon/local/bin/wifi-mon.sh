#!/bin/sh
airmon-ng check kill
ip link set wlo1 down
iw wlo1 set monitor control
ip link set wlo1 up
iw dev wlo1 set channel 108 HT40+
