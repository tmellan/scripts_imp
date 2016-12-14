#!/bin/bash

listtest="300"
listfull="300 760 1900 2500 3200 3805"
list="760 1900 2500 3200 3805"

dir=`pwd`
c=1

for i in $list; do 
  let c=c+1
  cp -r TILD_SUB_stuff $c'_'$i/.
  cd $c'_'$i
  sed -e 's/T=3805/T='$i'/g' TILD_SUB_stuff/tild.sh > tild.sh
  chmod 777 tild.sh
  ./tild.sh  
  echo done $c'_'$i
  cd $dir
done
