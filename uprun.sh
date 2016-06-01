#!/bin/bash

#module load openmpi/64/intel/1.6.0
#module load vasp
#module load mpi
#module purge
#module unload intel-suite/2015.3.187  openmpi/1.8.7  mkl wannier90 fftw/3.3.4 vasp
#module load intel-suite/2015.3.187  openmpi/1.8.7
#module load mkl wannier90 fftw/3.3.4 
#module load vasp

module purge 
module load intel-suite/2015.3.187 openmpi/1.8.7
module load mkl wannier90
module load "fftw"

sed -i 's/PRE_EQ_N     = 3000/PRE_EQ_N     = -3000/g' INCAR

l="0.0 0.15 0.5 0.85 1.0"
dir=`pwd`
for i in $l; do
  rm -fr lambda$i
  mkdir lambda$i
  s=`date +%N | awk '{printf "%7d",$1%942438976}'`
  sed -e 's|xxxLAMBDAxxx|'$i'|' \
      -e 's|xxxSEEDxxx|'"$s"'|' INCAR > lambda$i/INCAR
  cp KPOINTS POTCAR POSCAR HesseMatrix_sphinx EqCoords_direct \
     calculate_energy_and_forces scratch_path external_script_additional_input_files \
     in.file ZrC.eam.alloy lmp_xc30_serial lambda$i/
  cd lambda$i
   /workspace/tamellan/vasp_Langevin/vasp5_TI_lammps/vasp_5.3.5/vasp &
#  /workspace/tamellan/vasp_Langevin/vasp_4.6/vasp &
  sleep 15
  cd $dir
  sleep 1
done
echo done
sleep 1
