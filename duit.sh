#!/bin/bash

var="getdUdL.sh integrate"
dir="/workspace/tamellan/tom_harmonic_to_MEAM/test_EAM/"

#aldirtest="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K "
aldir="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K 4.730Ang_1900K 4.730Ang_2500K 4.730Ang_3200K 4.730Ang_3805K 4.730Ang_760K 4.759Ang_1900K 4.759Ang_2500K 4.759Ang_3200K 4.759Ang_3805K 4.759Ang_760K 4.801Ang_1900K 4.801Ang_2500K 4.801Ang_3200K 4.801Ang_3805K 4.801Ang_760K 4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

cd $dir
rm -r answers
mkdir answers

for i in $aldir; do
  cp $var $dir$i && pwd && echo 'copied in getdUdL and integrate scripts done'
  cd $i && ./getdUdL.sh && ./integrate && echo getdUdL and integrate done for $i
  cp avg_dUdL ../answers/avg_dUdL.$i && cp integrated_value ../answers/int_val.$i && echo copied avgdudl and int for $i
  cd $dir
  echo ""
  echo ""
  sleep 1
done
echo 'TOTALLY FINISHED!'

#cp ZrC.eam.alloy 4.685Ang_1900K/ &&


#l="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"

#for i in $l; do
#  rm -fr lambda$i
#  mkdir lambda$i
#  s=`date +%N | awk '{printf "%7d",$1%942438976}'`
#  sed -e 's|xxxLAMBDAxxx|'$i'|' \
#      -e 's|xxxSEEDxxx|'"$s"'|' INCAR > lambda$i/INCAR
#  cp KPOINTS POTCAR POSCAR HesseMatrix_sphinx EqCoords_direct \
#     calculate_energy_and_forces scratch_path external_script_additional_input_files \
#     in.file ZrC.eam.alloy lmp_xc30_serial lambda$i/
#  cd lambda$i
#   /workspace/tamellan/vasp_Langevin/vasp5_TI_lammps/vasp_5.3.5/vasp &
##  /workspace/tamellan/vasp_Langevin/vasp_4.6/vasp &
#  sleep 1
#  cd $dir
#done
