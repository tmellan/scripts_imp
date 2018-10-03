#!/bin/bash

lamb="$@"
dir=`pwd`
c=0

cp -r "lambda"$lamb "test"$lamb
seed=$(grep SEED lambda$lamb/INCAR | awk '{print $3}')


for i in {123..2220000..112345}; do 
  rm -r  $i"_lambda"$lamb ; mkdir $i"_lambda"$lamb
  cp -r "test"$lamb/* $i"_lambda"$lamb/.
  cd $i"_lambda"$lamb
  pwd
  sed -i 's/'$seed'/'$i'/g' INCAR
  integrate_TU-TILD_SUPERFAST.x 2>&1  > 1.out &
  cd $dir
done
