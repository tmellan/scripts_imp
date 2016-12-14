#!/bin/bash

T=3805
S=30000
rm -r TILD
mkdir TILD

cd TILD 

list="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"
c=0
for i in $list; do 
  let c=c+1
  mkdir lambda$i
  cd lambda$i 
  cp ../../TILD_SUB_stuff/HesseMatrix_sphinx . && cp ../../TILD_SUB_stuff/POSCAR .
  cp ../../TILD_SUB_stuff/settings . && cp ../../potparas_best1 potparas
  s=`date +%N | awk '{printf "%7d",$1%942438976}'`
  sed -e 's|xxxLAMBDAxxx|'$i'|' \
      -e 's|xxxTEMPxxx|'$T'|' \
      -e 's|xxxSTEPSxxx|'$S'|' \
      -e 's|xxxSEEDxxx|'"$s"'|' ../../TILD_SUB_stuff/INCAR > INCAR
  integrate_TU-TILD.x 2>&1 > 1.out &
  cd ../
done
cd ../
echo done
