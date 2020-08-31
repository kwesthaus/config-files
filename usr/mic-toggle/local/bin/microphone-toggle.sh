amixer set Capture toggle && amixer get Capture | grep '\[off\]' && notify-send "MIC switched OFF" || notify-send "MIC switched ON"
sudo /usr/local/bin/microphone-led.sh
