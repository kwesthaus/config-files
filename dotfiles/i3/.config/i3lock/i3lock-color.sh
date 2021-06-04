#!/bin/sh

SOLIDWHITE='#ffffffff'
CLEAR='#00000000'
TRANSLUCENTWHITE='#ffffff7f'
SOLIDRED='#ff0000ff'

killall -SIGUSR1 dunst

i3lock \
    --nofork \
    --image $HOME/.wallpapers/greatbend-b29-16x9.jpg \
    \
    --force-clock \
    --time-color $SOLIDWHITE \
    --date-color $SOLIDWHITE \
    --date-str '%a %B %d' \
    --time-size 120 \
    --date-size 60 \
    --time-align 1 \
    --date-align 1 \
    --time-pos="135:210" \
    --date-pos "150:315" \
    \
    --bar-indicator \
    --bar-color $CLEAR \
    --keyhl-color $SOLIDWHITE \
    --bar-total-width 315 \
    --bar-base-width 50 \
    --bar-max-height 50 \
    --bar-direction 1 \
    --bar-pos "160:425" \
    \
    --verif-color $TRANSLUCENTWHITE \
    --wrong-color $SOLIDRED \
    --ringver-color $TRANSLUCENTWHITE \
    --ringwrong-color $SOLIDRED \
    --verif-align 1 \
    --wrong-align 1 \
    --ind-pos "160:475" \

killall -SIGUSR2 dunst
