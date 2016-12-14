#!/bin/bash

dir=`pwd`

#mvt list from 4_longRun_4.8_2_3_v1v2_GIBBS_BOG_TI in mathematica folder
mvtlist="0.500283 0.487596 0.485013 0.468097 0.481434 0.473213 0.475865 0.47199	0.461402 0.447247 0.46644 0.438019 0.473307 0.477697 0.464381 0.451758 0.436474 0.44167 0.486122 0.478134 0.427652 0.445639 0.4027 0.4094 0.48325 0.460266 0.426666 0.41164 0.394238 0.376472"
list="4685 4730 4759 4801 4850"
T="300 760 1900 2500 3200 3805"
c=0
for i in $list; do
  for j in $T; do
    let c=c+1  
    cd $i'a'/$j
    cp -r lambda0.5 mvtTILD
    cd mvtTILD
    sed -i 's/WRITEPOS  =  .FALSE./WRITEPOS  =  .TRUE./g' INCAR
    sed -i 's/STEPS     =  15000/STEPS     =  3000/g' INCAR
    mvt=$(echo $mvtlist | awk '{print $'$c'}')
    sed -i 's/LAMBDA    =  0.5 /LAMBDA    =  '$mvt' /g' INCAR
    cat INCAR
    nice -5 integrate_TU-TILD.x 2>&1 > 1.out &
    echo done $i'a'/$i
    cd $dir
  done
done
echo done
   



#  let c=c+1
#  mkdir $i && cd $i
#  cp -r ../../TILD_RUN_TEST/getdUdL.sh ../../TILD_RUN_TEST/tild.sh .  
#  cp -r ../../TILD_RUN_TEST/TILD_SUB_stuff_$i TILD_SUB_stuff
#  cp ../settings TILD_SUB_stuff/set1
#  rm set2
#  echo "USEREF=.false." >> TILD_SUB_stuff/set2
#  echo "POTFILEIN=potparas" >> TILD_SUB_stuff/set2
#  echo "NOOPT=true" >> TILD_SUB_stuff/set2
#  echo "FASTFORCE=.false" >> TILD_SUB_stuff/set2
#  cat TILD_SUB_stuff/set1 TILD_SUB_stuff/set2 > TILD_SUB_stuff/settings
#  nice -5 ./tild.sh > $i.out & 
#  echo submitted $i T=all
#  cd $dir
#done
#echo done tildsubs
#mkdir 5__4850 && 

#echo `jobs`
#for i in {1..20}; do 
#  disown %$i
#  jobs
#done
#echo disowned
