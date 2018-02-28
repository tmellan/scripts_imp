#!/bin/bash

lamb="0.1"
dir=`pwd`
c=0
for i in {123..100000..12345}; do 
  rm -r  $i"_lambda"$lamb ; mkdir $i"_lambda"$lamb
  cp -r "test"$lamb/* $i"_lambda"$lamb/.
  cd $i"_lambda"$lamb
  pwd
  sed -i 's/SEED      =  xxx  /SEED      =  '$i'/g' INCAR
  integrate_TU-TILD_SUPERFAST.x 2>&1  > 1.out &
  cd $dir
done
