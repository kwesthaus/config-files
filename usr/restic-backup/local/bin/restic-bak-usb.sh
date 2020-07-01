RESTIC_REMOTE_PROTOCOL='sftp'
RESTIC_REMOTE_SERVER='restic-bak@alarm-restic-bak-school'
RESTIC_REMOTE_PATH='/mnt/privdata/backups/restic-backups/USB/'
RESTIC_REMOTE="${RESTIC_REMOTE_PROTOCOL}:${RESTIC_REMOTE_SERVER}:${RESTIC_REMOTE_PATH}"
USB_LIST=(MULTIBOOT PNYPRIVATE SANDISK3 MANJARO)
CREDENTIAL_PATH='/home/orville/.credentials/restic_usb.txt'
EXCLUDE_PATH='/home/orville/Documents/tech/documentation/mine/backup/usb_restic_excludes.txt'

echo "---------- Monthly Flash Drive Backup Utility ----------"
echo "Include following slashes for directories and use full paths"
echo ""
echo "Current remote restic repo is: $RESTIC_REMOTE"
echo "Current USB list: ${USB_LIST[*]}"
echo "Current credential file path: $CREDENTIAL_PATH"
echo "Current exclude file path: $EXCLUDE_PATH"
echo "Modify $BASH_SOURCE to change above values"
echo ""

# Check to make sure remote is accessible
if ! ssh -q $RESTIC_REMOTE_SERVER exit
then
	echo "Remote restic repo cannot be reached over ssh, quitting"
	exit 255
fi

for USB in "${USB_LIST[@]}"
do
	echo "Insert next USB: $USB"
	echo -n "Enter mount location: "
	read mount_loc
	if ! mountpoint -q $mount_loc
	then
		echo "$mount_loc is not a mount point, skipping this USB"
		continue
	fi
	restic -p $CREDENTIAL_PATH -r $RESTIC_REMOTE backup $mount_loc --tag $USB --exclude-file=$EXCLUDE_PATH
	restic -p $CREDENTIAL_PATH -r $RESTIC_REMOTE forget --tag $USB --keep-monthly 12 --keep-yearly 100 --prune
done
sleep 5
echo "Done"
