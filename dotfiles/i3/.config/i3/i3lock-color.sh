#!/bin/sh

I='#982f5988' # purple mars
R='#982f59ff'
IV='#eeb03788' # yellow mars
RV='#eeb037ff'
IW='#e63b2f88' # red mars
RW='#e63b2fff'
B='#e63b2fff'
K='#0fb037ff' # green (yellow mars but with inverted red channel)

i3lock \
	-i /home/kw/.wallpapers/lock-mars.png \
	-t \
	\
	--insidecolor=$I \
	--ringcolor=$R \
	--insidevercolor=$IV \
	--ringvercolor=$RV \
	--insidewrongcolor=$IW \
	--ringwrongcolor=$RW \
	--keyhlcolor=$K \
	--bshlcolor=$B \
	\
	-k \
	--timesize=26 \
	--datesize=13 \
	--datestr="%a %B %d"
