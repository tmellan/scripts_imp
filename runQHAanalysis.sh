#!/bin/bash

module load hdf5/1.8.16 phono3py phonopy dynaphopy

list=`echo qha_*.*a`
#phonopy-qha -b e-v.dat > zero_temperature_vinetEOS_bulk_mod_noZPE
#cat zero_temperature_EOS_bulk_mod
c=0 ; for i in $list; do let c=c+1 ; sed '17,28d'  $i/thermal_properties.yaml > thermal_properties-$c.yaml ; done
phonopy-qha --tmax=4010 e-v.dat thermal_properties-{1..11}.yaml > runQHA.out 
phonopy-qha --tmax=4010 e-v.dat thermal_properties-{1..11}.yaml 
cat runQHA.out
head -20 runQHA.out
tail -20 runQHA.out
