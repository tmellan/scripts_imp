#!/bin/bash

name=$(basename `pwd` | tail -c 5)
dir=`pwd`
mkdir Hesse_$name
for i in `echo 4.*`; do 
  cd $i
  phonopy --writefc --dim="1 1 1"
  convertphonopytoTI
  cp FCnew  HesseMatrix_700_666_PERF_$i
  cp HesseMatrix_700_666_PERF_$i ../Hesse_$name/HesseMatrix_700_666_PERF_$i
  cd $dir
done
