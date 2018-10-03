#!/bin/bash

steps="100000"
steplist=(10000 20000 50000 60000 80000 100000)
dir=`pwd`
#rid="/workspace/tamellan/THERMODYNAMIC_integration_f_lambda_tests/Cvac/3_Cvac_rear_700_666"
rid="/workspace/tamellan/THERMODYNAMIC_integration_f_lambda_tests/GibbsBog"
list="4730"
c=-1
for i in $list; do
#  let c=c+1
  rm -r $i
  mkdir $i 
  cd $i
  let c=c+1
  cp -r $rid/TILD_RUN_TEST/getdUdL.sh .  
  cp  $rid/TILD_RUN_TEST/final_tild_cvac_perf.sh  final_tild_cvac_perf.sh
  cp -r $rid/TILD_RUN_TEST/TILD_SUB_stuff_$i TILD_SUB_stuff
  cp ../settings_small TILD_SUB_stuff/set1
  rm set2
  echo "USEREF=.false." >> TILD_SUB_stuff/set2
  echo "POTFILEIN=potparas" >> TILD_SUB_stuff/set2
  echo "NOOPT=true" >> TILD_SUB_stuff/set2
  echo "FASTFORCE=.false" >> TILD_SUB_stuff/set2
  cat TILD_SUB_stuff/set1 TILD_SUB_stuff/set2 > TILD_SUB_stuff/settings
  chmod 777 final_tild_cvac_perf.sh
  nice -20 ./final_tild_cvac_perf.sh > $i.out & 
  echo submitted $i T=all
  cd $dir
done
echo done tildsubs
#mkdir 5__4850 && 

echo `jobs`
#for i in {1..20}; do 
#  disown %$i
#  jobs
#done
#echo disowned
