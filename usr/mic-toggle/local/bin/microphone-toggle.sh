amixer set Capture toggle && amixer get Capture | grep -q '\[off\]' && notify-send "MIC switched OFF" || notify-send "MIC switched ON"
amixer get Capture | grep -q '\[off\]' && sudo /usr/local/bin/microphone-led-off.sh || sudo /usr/local/bin/microphone-led-on.sh
