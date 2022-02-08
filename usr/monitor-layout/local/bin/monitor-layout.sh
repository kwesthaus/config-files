#!/bin/sh

xrandr | rg "eDP-1 connected"
builtin_c=$?
xrandr | rg "HDMI-1 connected"
hdmi_c=$?
xrandr | rg "HDMI-1 disconnected"
hdmi_d=$?

# only run i3 commands if i3 is already started (NOT when running this script from ~/.xprofile)
i3pid=$(pidof i3)

if [ $builtin_c -eq 0 ] && [ $hdmi_c -eq 0 ]; then
    echo "both monitors attached"
    xrandr \
        --output eDP-1 --primary --mode 1920x1080 --pos 2400x0 --rotate normal \
        --output HDMI-1 --mode 2400x1350 --pos 0x0 --rotate normal
    sleep 1
    [[ ! -z "$i3pid" ]] && i3-msg "restart"
elif [ $builtin_c -eq 0 ] && [ $hdmi_d -eq 0 ]; then
    echo "only laptop monitor attached"
    # avoid moving to workspace that was focused on the other monitor
    [[ ! -z "$i3pid" ]] && focused=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).num')
    xrandr \
        --output eDP-1 --primary --mode 1920x1080 --pos 1600x0 --rotate normal \
        --output HDMI-1 --off
    sleep 1
    [[ ! -z "$i3pid" ]] && i3-msg "restart"
    sleep 1
    [[ ! -z "$i3pid" ]] && i3-msg "workspace --no-auto-back-and-forth number $focused"
else
    echo "unexpected monitor state"
    return 255
fi
