#!/bin/bash

dir=`pwd`

mvtName="UP-samples"
mvtSteps="10000"

list=$(yes 0.5 | head -n 10)
mvtlist=$(echo $list)
#mvtlist="0.499845 0.497533 0.462485 0.444584 0.451342 0.455097 0.499956 0.495283 0.443662 0.428015 0.438869 0.43236"

list="4685 4850"

T="300 760 1900 2500 3200 3805"
c=0
for i in $list; do
  for j in $T; do
    let c=c+1  
    cd $i/$j
    rm -r $mvtName
    cp -r lambda0.5 $mvtName
    cd $mvtName
    sed -i 's/WRITEPOS  =  .FALSE./WRITEPOS  =  .TRUE./g' INCAR
   sed -i 's/5000/'$mvtSteps'/g' INCAR
    mvt=$(echo $mvtlist | awk '{print $'$c'}')
#    sed -i 's/LAMBDA    =  0.5 /LAMBDA    =  '$mvt' /g' INCAR
    cat INCAR && pwd
    nice -2 integrate_TU-TILD.x 2>&1 > 1.out &
    echo done $i/$i
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
