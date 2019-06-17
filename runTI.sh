#!/bin/bash

lambdaList="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"
dir=`pwd`
TList="500 1000 1500 2000"

S=20000
stepList=(20000 20000 20000 20000)
d=-1

name="r1"
#potparas_33_mixed-wtest-4_3_9393254559_0a0c
nPairs="33"
vols="0a0c"
sizes="mixed-wtest-4_3_9393254559"


for l in $nPairs; do 
  if [ ! -d $l ]; then mkdir $l ; fi ; cd $l

  for v in $vols; do 
     if [ ! -d $v ]; then mkdir $v ; fi ; cd $v

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
                 cp $dir/INPUT/HesseMatrix_sphinx_$v HesseMatrix_sphinx && cp $dir/INPUT/POSCAR_$v POSCAR
                 cp $dir/INPUT/settings_$l settings && cp $dir/INPUT/potBest/"potparas_"$l"_"$k"_"$v potparas
                 s=`date +%N | awk '{printf "%7d",$1%942438976}'`
                 sed -e 's|xxxLAMBDAxxx|'$i'|' \
                     -e 's|xxxTEMPxxx|'$j'|' \
                     -e 's|xxxSTEPSxxx|'${stepList[$d]}'|' \
                     -e 's|xxxSEEDxxx|'"$s"'|' $dir/INPUT/INCAR > INCAR
                 sed -i 's/=  0.01/=  0.05/g' INCAR
                 sed -i 's/=  1/=  1/g' INCAR

                 nice -20  integrate_TU-TILD_SUPERFAST.x 2>&1 > 1.out &

                 cd $dir/$l/$v/$k/$j
             done
             cd $dir/$l/$v/$k
             echo done $j/$k
         done        
         cd $dir/$l/$v
    done
    cd $dir/$l
  done
  cd $dir
done
