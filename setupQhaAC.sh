#!/bin/bash

dir=`pwd`
module load hdf5/1.8.19  python/3.5.3  phono3py/1.11.13.47  phonopy/1.11.12.92  dynaphopy/1.15.1 v_sim

list1="0.980 0.990 1.000  1.010 1.020 1.030"
list2="0.980 0.990 1.000  1.010 1.020 1.030"

for k in $list2; do 
  for i in $list1; do
    mkdir phon_a$i"_c"$k

    cp ac_a$i"_c"$k/CONTCAR phon_a$i"_c"$k/POSCAR_unitcell_rel_a$i"_c"$k
    cd phon_a$i"_c"$k
    cp POSCAR_unitcell_rel_a$i"_c"$k POSCAR
    phonopy -d --dim="2 2 3" --pm
  
    for j in {001..004}; do
      mkdir disp-$j
      cp POSCAR-$j disp-$j/POSCAR
    done

    cd $dir
  done
done
