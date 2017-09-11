#!/bin/bash
# Control Scheme ./Hydra.bash [Music Directory] [Output Directory] [Bitrate in kbs] [Number of Workers 1-35]
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
nun=""
if [ ! -d "$2" ]; then
	mkdir "$2"
fi

if [ $4 -eq 1 ]; then
	iter1=[A-Za-z0-9]
elif [ $4 -eq 2 ]; then
	iter1=[0-9A-Ia-i]
	iter2=[J-Zj-z]
elif [ $4 -eq 3 ]; then
	iter1=[0-9A-Ca-c]
	iter2=[D-Od-o]
	iter3=[P-Zp-z]
elif [ $4 -eq 4 ]; then
	iter1=[0-9]
	iter2=[A-Ia-i]
	iter3=[J-Rj-r]
	iter4=[S-Zs-z]
elif [ $4 -eq 5 ]; then
	iter1=[0-7]
	iter2=[8-9A-Ea-e]
	iter3=[F-Lf-l]
	iter4=[M-Sm-s]
	iter5=[T-Zt-z]
elif [ $4 -eq 8 ]; then
	iter1=[A-Da-d]
	iter2=[E-He-h]
	iter3=[I-Li-l]
	iter4=[M-Om-o]
	iter5=[P-Rp-r]
	iter6=[S-Us-u]
	iter7=[W-Xw-x]
	iter8=[Z0-9]
elif [ $4 -eq 12 ]; then
	iter1=[A-Ba-b]
	iter2=[C-Dc-d]
	iter3=[E-Fe-f]
	iter4=[G-Hg-h]
	iter5=[I-Ji-j]
	iter6=[K-Lk-l]
	iter7=[M-Nm-n]
	iter8=[L-Pl-p]
	iter9=[Q-Rq-r]
	iter10=[S-Ts-t]
	iter11=[U-Vu-v]
	iter12=[Z0-9]
fi

for i in $(seq 1 $4); do
	temp=iter$i
	#echo ${!temp}
	"${DIR}/Head.bash" "$1" "$2" "$3" "${!temp}" &
done
j=$(jobs -p)
trap 'kill $j' SIGINT
wait
