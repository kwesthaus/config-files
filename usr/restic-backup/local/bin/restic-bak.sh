#!/bin/bash
restic -p /home/orville/.credentials/restic_home_NAS.txt -r sftp:NAS-restic-bak:/mnt/privdata/backups/restic-backups/home/ backup /home/orville/Configuration/ /home/orville/Desktop/ /home/orville/Documents/ --exclude-file=/home/orville/Documents/tech/documentation/mine/backup/restic-excludes.txt
restic -p /home/orville/.credentials/restic_home_NAS.txt -r sftp:NAS-restic-bak:/mnt/privdata/backups/restic-backups/home/ forget --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 100 --prune
restic -p /home/orville/.credentials/restic_home_NAS.txt -r sftp:NAS-restic-bak:/mnt/privdata/backups/restic-backups/home/ check

source /home/orville/.credentials/env/backblaze

restic -p /home/orville/.credentials/restic_home_offsite.txt -r b2:restic-backup-home backup /home/orville/Configuration/ /home/orville/Desktop/ /home/orville/Documents/ --exclude-file=/home/orville/Documents/tech/documentation/mine/backup/restic-excludes.txt
restic -p /home/orville/.credentials/restic_home_offsite.txt -r b2:restic-backup-home forget --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 100 --prune
restic -p /home/orville/.credentials/restic_home_offsite.txt -r b2:restic-backup-home check

source /home/orville/.credentials/env/backblaze-reset
