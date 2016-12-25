#!/bin/bash

name=$(basename `pwd` | tail -c 6 | cut -c1-5)
disp=`echo disp-*`
vaspruns=`echo disp-*/vasprun*`
#list="4.575 4.600 4.625 4.65837 4.685 4.730 4.759 4.801 4.850"
list="4.759 4.801 4.850"
#list="4.575"

dir=`pwd`

c=0

#get forces - see https://atztogo.github.io/phonopy/procedure.html
#for i in $list; do 
#  cd $i'a' 
#  let c=c+1
#  echo $disp
#  phonopy -f $vaspruns
#  cd $dir
#done
#echo done force creation

#plot and save thermal properties
for i in $list; do 
  cd $i'a' 
  let c=c+1
  cp /workspace/tamellan/Tessa_ZrC/POSTPROC_stuff/* .
  phonopy -p -s mesh.conf
  phonopy -t thermal.conf > thermal.out
#  phonopy -t -s thermal.conf
  rm mesh.yaml
  cd $dir
done
echo done thermal properties

