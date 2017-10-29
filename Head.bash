#!/bin/bash
# Worker Script Call Layout: ./Head.bash [Music Directory: Omit trailing /] [Output Directory: omit trailing /] [Bitrate in kbs] [File listing files]
#echo $1 $2 $3 $4
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
nun="$(cat $DIR/$4)"
IFS=$'\n'
#echo "$nun"
for i in $nun; do
	i1=${i#$1/}
	i2=${i%/*.*}
	i3=${i1%/*.*}
	i4=${i1%.*}.mp3
#	echo "$i"
#	echo "$i1"
#	echo "$i2"
#	echo "$i3"
#	echo "$i4"
#	echo " "
	if [ ! -d "$2/$i3" ]; then
		mkdir -p "$2/$i3"
	fi
#	echo "../$1/${i%.*}.mp3"
	ffmpeg -i "$i" -ab $3k "$2/$i4"
	replaygain -r 95 "$2/$i4"
done
