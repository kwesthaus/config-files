#!/bin/bash
restic -p /home/orville/.credentials/restic_home_NAS.txt -r sftp:NAS-restic-bak:/mnt/privdata/backups/restic-backups/home/ mount --allow-other /mnt/restic

source /home/orville/.credentials/env/backblaze

restic -p /home/orville/.credentials/restic_home_offsite.txt -r b2:restic-backup-home mount --allow-other /mnt/temp

source /home/orville/.credentials/env/backblaze-reset
