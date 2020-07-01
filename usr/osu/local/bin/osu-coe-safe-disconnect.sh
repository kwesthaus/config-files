#!/bin/bash
if [[ $(findmnt -M /mnt/osu/eng-user/) || $(findmnt -M /mnt/osu/eng-class/) || $(findmnt -M /mnt/osu/cse-class/) ]]; then
	echo "ERROR! Samba share is mounted, please unmount it first!"
else
	echo "Share is not mounted, continuing to disconnect network..."
	nmcli con down COE_VPN
fi
