#!/bin/bash

lambdaList="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"
dir=`pwd`
#TList="100 300 500 1000 1500 2000"
#TList="100 2000"
TList="2000"

S=50000
#stepList=(10000 20000 50000 60000 80000 100000)
stepList=(100000 1000000)
d=-1

#nPairs="23 33 43"
nPairs="33"
sizes="2size 3size 4size 5size"


for l in $nPairs; do 
  if [ ! -d $l ]; then mkdir $l ; fi ; cd $l
  for k in $sizes; do
     if [ ! -d $k ]; then mkdir $k ; fi ; cd $k
     d=-1
     for j in $TList; do
       if [ ! -d $j ]; then mkdir $j ; fi ; cd $j
       let d=d+1 
       c=0
       for i in $lambdaList; do
         let c=c+1
         
         if [ ! -d lambda$i ]; then mkdir lambda$i ; fi ; cd lambda$i
         cp $dir/INPUT/HesseMatrix_sphinx . && cp $dir/INPUT/POSCAR POSCAR
         cp $dir/INPUT/settings_$l settings && cp $dir/INPUT/"potparas_"$l"_"$k potparas
         s=`date +%N | awk '{printf "%7d",$1%942438976}'`
         sed -e 's|xxxLAMBDAxxx|'$i'|' \
             -e 's|xxxTEMPxxx|'$j'|' \
             -e 's|xxxSTEPSxxx|'${stepList[$d]}'|' \
             -e 's|xxxSEEDxxx|'"$s"'|' $dir/INPUT/INCAR > INCAR
         sed -i 's/=  0.01/=  0.05/g' INCAR
         sed -i 's/=  1/=  1/g' INCAR

            nice -20  integrate_TU-TILD_SUPERFAST.x 2>&1 > 1.out &
         cd $dir/$l/$k/$j
       done
       cd $dir/$l/$k
       echo done $j
    done
    cd $dir/$l
  done
  cd $dir
done
