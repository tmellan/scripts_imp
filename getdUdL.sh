#!/bin/bash

cutoff=500
l=`ls -ld lambda* | awk '{print $9}'`
rm -rf avg_dUdL
for i in $l; do
   dUdLin=`awk 'BEGIN{s=0;c=0} NR>100 {s=s+$7;c=c+1} END{print s/c}' $i/dUdL`
   lam=`echo $i | sed 's|lambda\(.*\)*|\1|'`
   echo $lam $dUdLin >> avg_dUdL
done

