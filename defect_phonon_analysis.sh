#!/bin/bash

dir=`pwd`

list="2_4850_defect_phonons_repeated_higher_convergence 3_4685_defect_phonons 4_FULL_rel 5_4730 6_4759 7_4801 8_4575_vol 9_4625_vol 10_46583_vol 11_4.6910600662Ang_exp"

#list="3_4685_defect_phonons"

for i in $list; do 
  cd $i/

  rm -r ANALYSIS_11
  mkdir ANALYSIS_11 && cd ANALYSIS_11
  mkdir CPDOS ZPDOS DOS MEAN_THERMAL_DISP THERMAL
  
  cd CPDOS/. && sed -e 's/MP = 5 5 5/MP = 11 11 11/g' ../../../ANALYSIS_STUFF/cpdos.conf > cpdos.conf && cp ../../OUTPUT/POSCAR  ../../OUTPUT/FORCE_SETS .
  phonopy -p -s cpdos.conf &
  cd ../

  cd ZPDOS/. && sed -e 's/MP = 5 5 5/MP = 11 11 11/g' ../../../ANALYSIS_STUFF/zpdos.conf > zpdos.conf && cp ../../OUTPUT/POSCAR  ../../OUTPUT/FORCE_SETS .
  phonopy -p -s zpdos.conf &
  cd ../

  cd DOS/. && sed -e 's/MP = 5 5 5/MP = 11 11 11/g' ../../../ANALYSIS_STUFF/mesh.conf > mesh.conf && cp ../../OUTPUT/POSCAR  ../../OUTPUT/FORCE_SETS .
  phonopy -p -s mesh.conf &
  cd ../

  cd MEAN_THERMAL_DISP/. && sed -e 's/MP = 5 5 5/MP = 11 11 11/g' ../../../ANALYSIS_STUFF/mean_thermal.conf > mean_thermal.conf && cp ../../OUTPUT/POSCAR  ../../OUTPUT/FORCE_SETS .
  phonopy mean_thermal.conf &
  cd ../

  cd THERMAL/. && sed -e 's/MP = 5 5 5/MP = 11 11 11/g' ../../../ANALYSIS_STUFF/thermal.conf > thermal.conf && cp ../../OUTPUT/POSCAR  ../../OUTPUT/FORCE_SETS .
  phonopy -t thermal.conf > thermal_gnu.out &
  cd ../

  cd $dir

echo done $i

done


echo done all


#cp ../POSCAR . && cp ../../mesh.conf . && phonopy -f disp-{001..208}/vasprun.xml && phonopy -t mesh.conf > 111111_thermal_4000K_gnu.out &
