#!/bin/bash

# alatts4.575, 4.6, 4.625, 4.6583, 4.685, 4.73, 4.759, 4.801, 4.85
#carbon 0.165499, 0.158227, 0.151089, 0.141842, 0.134761, 0.123415, 0.11651, 0.107097, 0.0971397
#zr 0.192018, 0.183107, 0.174287, 0.162656, 0.153519, 0.138365, 0.128789, 0.115211, 0.10025

steps=5000
pot="potparas_4_longRun_4.8_2_3_v1v2"
dir=`pwd`
stuff=$dir/SUB_STUFF

vols="4685 4730 4759 4801 4850"
temps="300 760 1900 2500 3200 3800"
chess="0.134761 0.123415 0.11651 0.107097 0.0971397"
zhess="0.153519 0.138365 0.128789 0.115211 0.10025"
chessArray=($chess)
zhessArray=($zhess)
c=-1
for i in $vols; do 
  mkdir $i
  cd $i 
  let c=c+1

  scale=$(echo "scale=9; $i/4850" | bc -l)
  sed -e 's/scaling/'$scale'/g' $stuff/POSCAR.4850 > POSCAR.$i

  for j in $temps; do 
    mkdir $j
    cd $j
    cp -r $stuff/lambda* .
    echo lambda* | xargs -n 1 cp $stuff/HesseMatrix_sphinx_ref  $stuff/settings $stuff/$pot
    
    for k in `echo lambda*`; do 
      cd $k 
      mv $pot potparas
     
      cFC=$(echo ${chessArray[$c]})
      zrFC=$(echo ${zhessArray[$c]})
      echo $cFC $zrFC
      sed -i 's/refFCzirconium/'$cFC'/g' HesseMatrix_sphinx_ref
      sed -i 's/refFCcarbon/'$zrFC'/g' HesseMatrix_sphinx_ref
      mv HesseMatrix_sphinx_ref HesseMatrix_sphinx

#     s=`date +%N | awk '{printf "%7d",$1%942438976}'`
#     sed -e 's|xxxLAMBDAxxx|'$i'|' \
#          -e 's|xxxSEEDxxx|'"$s"'|' INCAR
      sed -i 's/xxxTEMPxxx/'$j'/g' INCAR
      sed -i 's/xxxSTEPSxxx/'$steps'/g' INCAR
      cp $dir/$i/POSCAR.$i POSCAR

      cd $dir/$i/$j
    done

    cd $dir/$i
  done

  cd $dir
done

