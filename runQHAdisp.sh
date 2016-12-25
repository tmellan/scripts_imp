#!/bin/bash

name=$(basename `pwd` | tail -c 6 | cut -c1-5)
list="4.575 4.600 4.625 4.65837 4.685 4.730 4.759 4.801 4.850"
dir=`pwd`

c=0

for i in $list; do
  cd $i'a'
  let c=c+1
  for j in {001..208}; do
    mkdir disp-$j
    cd disp-$j;
    cp ../POSCAR-$j POSCAR
    cp ../../../../SP_SUBSTUFF/KPOINTS ../../../../SP_SUBSTUFF/POTCAR ../../../../SP_SUBSTUFF/INCAR .
    sed -e 's/#PBS -N XXNAMEXX/#PBS -N '$c'.'$name'.'$i'/g' ../../../../SP_SUBSTUFF/cx1run.pbs.20 > cx1run.pbs.20
    qsub cx1run.pbs.20
    cd ../
  done
  cd $dir
done
