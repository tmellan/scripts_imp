#!/bin/bash

list="1_300  2_760  3_1900  4_2500  5_3200  6_3805"

#for i in $list; do echo CONT=T >> $i/settings ; cat $i/settings ; done
#sleep 2

for i in $list; do
#  rm $i/*
#  sed -e 's/MEAMforces/N3me'$i'/g' mrun.pbs > $i/mrun.pbs &&
#  cp settings $i/settings && cp fitdbse $i/fitdbse && 
#  cd $i && qsub mrun.pbs && cd ../
  cd $i
  nice -2 MEAMfit.x 2>&1 > $i.out &
  sleep 0.25
  cd ../
  echo dunne $i
done
echo dunal

disown %1 %2 %3 %4 %5 %6
