#!/bin/bash

name=$(basename `pwd`)
list="4.575 4.600 4.625 4.65837 4.685 4.730 4.759 4.801 4.850"
dir=`pwd`
c=0

rm -r *.*a
#mkdir QHA_$name
for i in $list; do 
  mkdir $i'a' 
  cd $i'a'
  cp ../POSCAR_$i POSCAR
  phonopy -d --dim="1 1 1" --pm
  echo "done phonopy" $i
  cd $dir 
done
