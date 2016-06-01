#!/bin/bash

dir=`pwd`/
echo pwd is $dir

aldirlong="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K 4.730Ang_1900K 4.730Ang_2500K 4.730Ang_3200K 4.730Ang_3805K 4.730Ang_760K 4.759Ang_1900K 4.759Ang_2500K 4.759Ang_3200K 4.759Ang_3805K 4.759Ang_760K 4.801Ang_1900K 4.801Ang_2500K 4.801Ang_3200K 4.801Ang_3805K 4.801Ang_760K 4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

aldir="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K 4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

aldirtest="4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

cd $dir && echo in the directory $dir

for i in $aldirlong; do
  cd $i && echo  running uprun $i  && cp ../uprun.sh . && nice -1 ./uprun.sh 2>&1 > up.$i && echo uprun FINISHED running in $i && cd $dir
  sleep  3h 
done
echo TOTALLY FINISHED

