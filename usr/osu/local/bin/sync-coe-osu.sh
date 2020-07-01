#!/bin/bash
nmcli con up COE_VPN
sudo mount -t cifs -o credentials=/home/orville/.credentials/osu-coe-samba.txt,uid=1000,gid=1000 //home2.coeit.osu.edu/w /mnt/osu/eng-user
rsync -avvzuP /home/orville/Documents/school/college/2019-2020/AU19/ /mnt/osu/eng-user/westhaus.3/Documents/sync/
rsync -avvzuP /mnt/osu/eng-user/westhaus.3/Documents/sync/ /home/orville/Documents/school/college/2019-2020/AU19/
