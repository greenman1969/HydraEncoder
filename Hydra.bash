#!/bin/bash
# Control Scheme ./Hydra.bash [Music Directory: Omit Trailing /] [Output Directory: Omit Trailing /] [Bitrate in kbs] [Number of Workers: 1-8,12]
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
nun="$(find "$1" -type f -regex .+\.m.+ -printf '%p\n')"
echo "$nun" >> "$DIR/toEncode.d"
$(cd $DIR $$ split "$DIR/toEncode.d" -n l/$4)
if [ ! -d "$2" ]; then
	mkdir "$2"
fi

if [ $4 -eq 1 ]; then
	iter[1]=xaa
elif [ $4 -eq 2 ]; then
	iter[1]=xaa
	iter[2]=xab
elif [ $4 -eq 3 ]; then
	iter[1]=xaa
	iter[2]=xab
	iter[3]=xac
elif [ $4 -eq 4 ]; then
	iter[1]=xaa
	iter[2]=xab
	iter[3]=xac
	iter[4]=xad
elif [ $4 -eq 5 ]; then
	iter[1]=xaa
	iter[2]=xab
	iter[3]=xac
	iter[4]=xad
	iter[5]=xae
elif [ $4 -eq 6 ]; then
        iter[1]=xaa
        iter[2]=xab
        iter[3]=xac
        iter[4]=xad
        iter[5]=xae
        iter[6]=xaf
elif [ $4 -eq 7 ]; then
        iter[1]=xaa
        iter[2]=xab
        iter[3]=xac
        iter[4]=xad
        iter[5]=xae
        iter[6]=xaf
        iter[7]=xag
elif [ $4 -eq 8 ]; then
	iter[1]=xaa
	iter[2]=xab
	iter[3]=xac
	iter[4]=xad
	iter[5]=xae
	iter[6]=xaf
	iter[7]=xag
	iter[8]=xah
elif [ $4 -eq 10 ]; then
        iter[1]=xaa
        iter[2]=xab
        iter[3]=xac
        iter[4]=xad
        iter[5]=xae
        iter[6]=xaf
        iter[7]=xag
        iter[8]=xah
        iter[9]=xai
        iter[10]=xaj
elif [ $4 -eq 11 ]; then
        iter[1]=xaa
        iter[2]=xab
        iter[3]=xac
        iter[4]=xad
        iter[5]=xae
        iter[6]=xaf
        iter[7]=xag
        iter[8]=xah
        iter[9]=xai
        iter[10]=xaj
        iter[11]=xak
elif [ $4 -eq 12 ]; then
	iter[1]=xaa
	iter[2]=xab
	iter[3]=xac
	iter[4]=xad
	iter[5]=xae
	iter[6]=xaf
	iter[7]=xag
	iter[8]=xah
	iter[9]=xai
	iter[10]=xaj
	iter[11]=xak
	iter[12]=xal
else
	echo "Please enter a valid number of workers"
	rm $DIR/toEncode.d
	rm $DIR/x*
	exit
fi

for i in $(seq 1 $4); do
#	echo $i
	temp=${iter[i]}
	echo $temp
	$DIR/Head.bash "$1" "$2" "$3" "${temp}" &
done
j=$(jobs -p)
trap 'kill $j' SIGINT
wait
rm $DIR/toEncode.d $DIR/xa*
