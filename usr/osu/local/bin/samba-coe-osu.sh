#!/bin/bash
nmcli con up COE_VPN
sudo mount -t cifs -o credentials=/home/orville/.credentials/osu-coe-samba.txt,uid=1000,gid=1000 //home2.coeit.osu.edu/w /mnt/osu/eng-user
sudo mount -t cifs -o credentials=/home/orville/.credentials/osu-coe-samba.txt,uid=1000,gid=1000 //share1.coeit.osu.edu/eed /mnt/osu/eng-class
sudo mount -t cifs -o credentials=/home/orville/.credentials/osu-coe-samba.txt,uid=1000,gid=1000 //share1.coeit.osu.edu/cse /mnt/osu/cse-class
