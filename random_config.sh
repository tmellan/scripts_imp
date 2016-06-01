#!/bin/bash



#MAXCOUNT=10
#count=1
#RANGE=100
CEED=$(awk '{ if (NR==5) print $3 }' ../INCAR)

rm  x* 
split -l 64 -d last100x64

l="39 73 08 67 67 96 12 38 81 74"

for i in $l; do
  cp x$i config$i.$CEED
done

rm x*

#while [ "$count" -le $MAXCOUNT ]      # Generate 10 ($MAXCOUNT) random integers.
#do
#  number=$RANDOM
#  let "number %= $RANGE"
#  echo $number && echo $number > out.random_configs
#  let "count += 1"  # Increment count.
#done

#cat out.random_configs | var
#l="1 2 3 4 5 6 7 8 9 10"
#for i in $var; do
#  cp x$var random$var
#done
  
 
