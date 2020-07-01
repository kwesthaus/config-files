#!/bin/bash
IPV6_DISABLED="$(sysctl net.ipv6.conf.all.disable_ipv6 -n)"
if [ "$IPV6_DISABLED" == "0" ]; then
    sysctl net.ipv6.conf.all.disable_ipv6=1
    sysctl net.ipv6.conf.default.disable_ipv6=1
    sysctl net.ipv6.conf.wlo1.disable_ipv6=1
    sysctl net.ipv6.conf.enp0s20f0u2.disable_ipv6=1
    echo "ipv6 ==DISABLED== on all, default, wlo1, and enp0s20f0u2 interfaces"
    echo "Waiting 5s before exiting so you can see this output..."
    sleep 5s
else
    sysctl net.ipv6.conf.all.disable_ipv6=0
    sysctl net.ipv6.conf.default.disable_ipv6=0
    sysctl net.ipv6.conf.wlo1.disable_ipv6=0
    sysctl net.ipv6.conf.enp0s20f0u2.disable_ipv6=0
    echo "ipv6 ==RE-ENABLED=="
    echo "Waiting 5s before exiting so you can see this output..."
    sleep 5s
fi

