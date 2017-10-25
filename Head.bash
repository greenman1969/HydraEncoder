#!/bin/bash
# Worker Script Call Layout: ./Head.bash [Music Directory] [Output Directory] [Bitrate in kbs] [Iteration Area eg. [A..G]]
#echo $1 $2 $3 $4
l="$1/$4*/*/*"
echo $l
for i in $1/$4*/*/*; do
	if [ ! -e "$i" ] ; then
		exit 0
	fi
	i1=${i#$1/}
	i2=${i%/*.*}
	i3=${i1%/*.*}
	i4=${i1%.*}.mp3
	echo $i
	echo $i1
	echo $i2
	echo $i3
	echo $i4
	if [ ! -d "$2/$i3" ]; then
		mkdir -p "$2/$i3"
	fi
#	echo "../$1/${i%.*}.mp3"
	ffmpeg -i "$i" -ab $3k "$2/$i4"
	replaygain -r 95 "$2/$i4"
done

