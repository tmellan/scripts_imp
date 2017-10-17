#!/bin/bash

#vol="13.784 14.023 14.431 14.698 15.090 15.557 15.799 16.043"
vols="4.658285 4.685 4.730 4.759 4.801 4.850 4.875 4.900"
temps="0.01 0.033 0.066 0.099 0.132 0.198 0.231 0.264 0.297 0.330"
natoms=44
c=0
vol=$(
for i in $(echo 4.*_0.01); do 
  let c=c+1
  aa=$(sed -n '2p' $i/POSCAR)
  bb=$(sed -n '3p' $i/POSCAR | awk '{printf "%.18g", $1}')
  cc=$(sed -n '4p' $i/POSCAR | awk '{printf "%.18g", $2}')
  dd=$(sed -n '5p' $i/POSCAR | awk '{printf "%.18g", $3}')
  volperatom=$(echo "scale=9; $aa*$aa*$aa*$bb*$cc*$dd/$natoms" | bc -l) 
  echo $volperatom
done
)
echo $vol
echo $vol > volumes
volArray=($vol)

for j in $temps; do
  c=-1
  for i in $vols; do
    let c=c+1
    v=$(echo ${volArray[$c]})
    mv  $i'_'$j $v'_'$j
  done
done
