#!/bin/bash
hdir=`pwd`

rm e-v.dat
for i in `echo 4.*a`; do 
  cd $i 
  a=$(echo $(head -n 2 CONTCAR | tail -n 1)*$(head -n 3 CONTCAR | tail -n 1 | awk '{print $1}') | bc -l)
  e=$(tail -n 1 OSZICAR | awk '{print $5}')
  v=$(echo $a*$a*$a | bc -l)
  echo $v $e >> ../e-v.dat
  cd $hdir
done
