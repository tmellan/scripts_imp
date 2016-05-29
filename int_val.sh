#!/bin/bash

#script to collect integrated dUdL values
name=reproduce_andy
lat1=4.685
lat2=4.730
lat3=4.759
lat4=4.801
lat5=4.850

l="$lat1 $lat2 $lat3 $lat4 $lat5"
t="760 1900 2500 3200 3805"

for i in $l; do
  cat 'int_val.'$i'Ang_760K' 'int_val.'$i'Ang_1900K' 'int_val.'$i'Ang_2500K' 'int_val.'$i'Ang_3200K' 'int_val.'$i'Ang_3805K' > 'int_val.'$i'_T'
  sleep 1
  echo 'done:' $i
done

echo "catting all integrated values"

for i in $l; do
  echo 'Above five data for:     ' >> 'int_val.'$i'_T' 
  echo 'latpar = '$i'Ang         ' >> 'int_val.'$i'_T'
  echo '{'$t'}K ' >> 'int_val.'$i'_T'
  echo ' ' >> 'int_val.'$i'_T'
done

cat int_val.4.685_T int_val.4.730_T int_val.4.759_T int_val.4.801_T int_val.4.850_T > int_val_all.$name


echo '   '  >> int_val_all.$name
echo 'Data in column above' >> int_val_all.$name
echo 'made from calculation' >> int_val_all.$name
echo 'named: '$name >> int_val_all.$name

echo "FINISHED."



