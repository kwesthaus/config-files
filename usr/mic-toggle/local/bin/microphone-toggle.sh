amixer set Capture toggle
amixer get Capture | grep -q '\[off\]' && notify-send -i "microphone-sensitivity-muted-symbolic.symbolic" "MIC switched OFF" || notify-send -i "microphone-sensitivity-high-symbolic.symbolic" "MIC switched ON"
amixer get Capture | grep -q '\[off\]' && sudo /usr/local/bin/microphone-led-off.sh || sudo /usr/local/bin/microphone-led-on.sh
