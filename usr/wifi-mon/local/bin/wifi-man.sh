#!/bin/sh
ip link set wlo1 down
iw wlo1 set type managed
ip link set wlo1 up
systemctl start NetworkManager
