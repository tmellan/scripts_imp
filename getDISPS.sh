#!/bin/bash

#Note - instead of making the supercell displacements explicitly, I just used the fractional displacements from 46583, which is 0.03Ang absolute, but not 0.03 abosolute for other lattice parameter. There I have work backwards to create the displaceents corresponding to the non-0.03 aplitidues.

mkdir DISPS
cp ../../222anharmonic_444harmonic/POSCAR-unitcell DISPS/POSCAR-UNITCELL-ORIGINAL
cd DISPS

cp ../disp-00001/POSCAR disp1POSCAR

oldalat=$(sed -n '2,2p' POSCAR-UNITCELL-ORIGINAL)
echo $oldalat
alat=$(sed -n '3,3p' disp1POSCAR | awk '{print $1/2}')
echo $alat
disp=$(echo "scale=9; 0.03*$alat/$oldalat" | bc -l)
echo $disp

sed -e 's/   4.65868296411000/'$alat'/g' POSCAR-UNITCELL-ORIGINAL > POSCAR-unitcell
paste POSCAR-UNITCELL-ORIGINAL  POSCAR-unitcell

phono3py -d --amplitude="$disp" --dim_fc2="4 4 4" --dim="2 2 2" -c POSCAR-unitcell > 1.out
cat 1.out

cp disp_fc2.yaml disp_fc3.yaml ../ 
cd ../

