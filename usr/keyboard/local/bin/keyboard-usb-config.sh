#!/bin/bash
# Timing is important here!
# If the sleep command is not included, we might set the configuration too fast before the system has a chance to set the default keyboard configuration to the device and our changes will get overwritten
# According to some random guy on the internet, you have no way to determine when the system is done, so just waiting 1 second seems to work fine on my system
# Additionally, running the command in the background is crucial because without it, the udev system cannot go ahead of us and set the default configuration while we wait so that we can overwrite it (instead of the udev system overwriting our configuration)
/usr/bin/su orville -c "sleep 1; setxkbmap `cat /home/orville/.Xkbmap`" &
