#!/bin/bash
mvt=0.476

l="1_300/ 1_300_test/ 2_760/ 3_1900/ 4_2500/ 5_3200/ 6_3805/"
ll="1_300_test/"
for i in $l; do 
  cd $i
  sed -e 's/TILD/MVT/g' tild.sh > tildmvt.sh
  cp -r TILD_SUB_stuff MVT_SUB_stuff 
  sed -i 's/list="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"/list='$mvt'/g' tildmvt.sh
  sed -i 's/integrate_TU-MVT.x/integrate_TU-TILD.x/g' tildmvt.sh
  sed -i 's/S=30000/S=15000/g' tildmvt.sh
  sed -i 's/.FALSE/.TRUE./g' MVT_SUB_stuff/INCAR
  chmod 777 tildmvt.sh
  ./tildmvt.sh
  cd ../
done
echo done

