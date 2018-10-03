#!/bin/bash

temps="300 760 1900 2500 3200 3805"
dir=`pwd`
mkdir dU_dUav_all

for i in $temps; do 
  cd $i 
  for j in `echo lambda*`; do cd $j ; awk '{print $7, $8}' dUdL | tail -n +2 > $dir/dU_dUav_all/$j"_"$i"_dU_dUav.dat" ; cd ../ ; done
  cd $dir
done
