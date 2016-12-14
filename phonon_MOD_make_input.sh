#!/bin/bash

QP="0.5 0.5 0.5"

oldlist="1 7 21 31 41 52 55 63 76 80 85 93 98 105 113 120 139 147 150 162 167 172 183 192"
list="1 7 21 31 41 52 55 63 76 80 85 93 98 105 113 120 139 147 150 162 167 172 183 192"
dir=`pwd`

for i in $list; do 
  mkdir band$i &&
  sed -e 's/ BAND / '$i' /g' general_mod.conf > band$i/mod$i.conf &&
  sed -i 's/ QQQPOINT / '$QP' /g' band$i/mod$i.conf &&
  cp FORCE* POSCAR band$i/ &&
  cd band$i &&
  phonopy mod$i.conf &&
  cd $dir
  echo band $i done
done
echo done
