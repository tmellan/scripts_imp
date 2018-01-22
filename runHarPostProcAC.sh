#!/bin/bash

dir=`pwd`
module load hdf5/1.8.19  python/3.5.3  phono3py/1.11.13.47  phonopy/1.11.12.92  dynaphopy/1.15.1 v_sim
name=$(basename `pwd` | tail -c 6 | cut -c1-5)
list1="0.980 0.990 1.000  1.010 1.020 1.030"
list2="0.980 0.990 1.000  1.010 1.020 1.030"
disp=`echo disp-*`
vaspruns=`echo disp-*/vasprun*`

c=0
for k in $list2; do 
  for i in $list1; do

    cd phon_a$i"_c"$k
    let c=c+1
    echo $disp
    phonopy -f $vaspruns
    cd $dir
  
  done
done
echo force creation done

#Thermal properties
c=0
for k in $list2; do
  for i in $list1; do

    cd phon_a$i"_c"$k
    let c=c+1
    cp /workspace/tamellan/RuO2/POSTPROC_STUFF/* .
    phonopy -p -s mesh.conf
    phonopy -t -s thermal.conf > thermalSimpleList_$i.out
    sed -i 's/nan/0.0/g' thermalSimpleList_$i.out
    cat thermalSimpleList_$i.out
    rm mesh.yaml
    cd $dir
  
  done
done
echo force creation done

