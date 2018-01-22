#!/bin/bash
dir=`pwd`
cd $dir

for j in `echo lambda*`; do 
  cd $dir/$j
  echo $j >  head.tmp
  echo Stats "T(K)" "dUdL(meV/at)" >> head.tmp
  echo Mean > side.tmp
  echo SD >> side.tmp
  echo Accuracy >> side.tmp

  tail -n +2 dUdL | awk '{print $3, $9}' > t_dudl

  for i in {1..2}; do
    sd=$(awk -v N=$i '{sum+=$N; array[NR]=$N} END {for(x=200;x<=NR;x++){sumsq+=((array[x]-(sum/NR))**2);}print sqrt(sumsq/NR)}' t_dudl)
    accuracy=$( awk -v N=$i '{sum+=$N; array[NR]=$N} END {for(x=200;x<=NR;x++){sumsq+=((array[x]-(sum/NR))**2);}print sqrt(sumsq/NR)/sqrt(NR)}' t_dudl)
    mean=$(awk -v N=$i '{ sum += $N } END { if (NR > 200) print sum / NR }' t_dudl)
    echo $mean > out.$i.tmp
    echo $sd >> out.$i.tmp
    echo $accuracy >> out.$i.tmp
  done

  paste side.tmp out.1.tmp out.2.tmp > data.tmp

  cat head.tmp data.tmp | column -t  > stats.out

  rm *.tmp
  cat stats.out
  cd $dir
done
