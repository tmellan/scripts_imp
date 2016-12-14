#!/bin/bash

rm -r split_pdos
mkdir split_pdos

for i in {1..64}; do
  sed '1d' partial_dos.dat | column -t | awk '{print $'$i'}' > split_pdos/$i.pdos
done
echo done  

paste split_pdos/1.pdos split_pdos/2.pdos > Zr_atom1_4.575.pdos
paste split_pdos/1.pdos split_pdos/34.pdos > C_atom1_4.575.pdos
