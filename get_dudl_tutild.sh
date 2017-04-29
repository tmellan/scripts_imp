#!/bin/bash

#volumes="4801a"
#maxval=5000
#generalised
volumes=`echo 4*a`
maxvals="3000 5000 5000 5000 3000"

TEMPS="300 760 1900 2500 3200 3805"
temps="1_300 2_760 3_1900 4_2500 5_3200 6_3805"
temps2="300 760 1900 2500 3200 3805"
kbt="0.00008617332"
dir=`pwd`


#pick out results
#(array counts from 0)
c=-1
for i in $volumes; do

  let c=c+1
  arr=($maxvals)
  maxval=${arr[$c]}
  configs=$(for i in {0..30}; do echo $maxval - $i*30 -1 | bc -l ; done)
  coords=$(for j in $configs; do echo $j*64 + 1 | bc -l ; done)
  dudlSelect=$(for k in $configs; do echo $k + 2 | bc -l ; done)
  dudlSelectReverse=$(echo $dudlSelect|tr ' ' '\n'|tac|tr '\n' ' ')

  for j in $TEMPS; do 
    cd $i/$j/
    rm dudl_tmp
    sed -n '1,1p' dUdL > dudl_head
    pwd
    for l in $dudlSelectReverse; do 
      sed -n ''$l','$l'p' dUdL >> dudl_tmp
    done

    cat dudl_head dudl_tmp > dudl_select
    awk '{print $5}' dudl_tmp > Umeam
    rm dudl_tmp
    cd $dir
  done
done
echo "done picking out dudls"


#Collate results
cd $dir  ; cd RESULTS

for i in $volumes; do
  for j in $TEMPS; do
    cp $dir/$i/$j/Umeam $dir/RESULTS/$i.$j.Umeam
    cp $dir/$i/$j/dudl_select $dir/RESULTS/$i.$j.dudl_select
  done
done

#Collate more
listU=$(for i in $volumes; do for j in $TEMPS; do echo $i.$j.Umeam ; done ; done)
listd=$(for i in $volumes; do for j in $TEMPS; do echo $i.$j.dudl_select ; done ; done)
cat `echo $listU` > cat.Umeam
paste `echo $listU` > paste.Umeam
cat `echo $listd` > cat.dudl_select
paste `echo $listd` > paste.dudl_select

echo "done collating results"



