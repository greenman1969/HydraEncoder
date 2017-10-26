#!/bin/bash
# Control Scheme ./Hydra.bash [Music Directory] [Output Directory] [Bitrate in kbs] [Number of Workers 1-35]
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
nun="$(find "$1" -type f -regex .+\.m.+ -printf '%p\n')"
count=$(echo "$nun" | wc -l)
echo "$nun"
echo $count
exit
if [ ! -d "$2" ]; then
	mkdir "$2"
fi

if [ $4 -eq 1 ]; then
	iter[1]=[A-Za-z0-9']
elif [ $4 -eq 2 ]; then
	iter[1]=[0-9A-Ia-i]
	iter[2]=[J-Zj-z']
elif [ $4 -eq 3 ]; then
	iter[1]=[0-9A-Ca-c]
	iter[2]=[D-Od-o]
	iter[3]=[P-Zp-z']
elif [ $4 -eq 4 ]; then
	iter[1]=[0-9]
	iter[2]=[A-Ia-i]
	iter[3]=[J-Rj-r]
	iter[4]=[S-Zs-z']
elif [ $4 -eq 5 ]; then
	iter[1]=[0-7]
	iter[2]=[8-9A-Ea-e]
	iter[3]=[F-Lf-l]
	iter[4]=[M-Sm-s]
	iter[5]=[T-Zt-z']
elif [ $4 -eq 8 ]; then
	iter[1]=[A-Da-d]
	iter[2]=[E-He-h]
	iter[3]=[I-Li-l]
	iter[4]=[M-Om-o]
	iter[5]=[P-Rp-r]
	iter[6]=[S-Us-u]
	iter[7]=[W-Xw-x]
	iter[8]=[Z0-9']
elif [ $4 -eq 12 ]; then
	iter[1]=[A-Ba-b]
	iter[2]=[C-Dc-d]
	iter[3]=[E-Fe-f]
	iter[4]=[G-Hg-h]
	iter[5]=[I-Ji-j]
	iter[6]=[K-Lk-l]
	iter[7]=[M-Nm-n]
	iter[8]=[L-Pl-p]
	iter[9]=[Q-Rq-r]
	iter[10]=[S-Ts-t]
	iter[11]=[U-Vu-v]
	iter[12]=[Z0-9']
fi

for i in $(seq 1 $4); do
#	echo $i
#	temp=${iter[i]}
#	echo $temp
	bash "${DIR}/Head.bash" "$1" "$2" "$3" "${temp}" &
done
wait
j=$(jobs -p)
trap 'kill $j' SIGINT
wait
