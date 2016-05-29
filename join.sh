#!/bin/bash

#script to collect integrated dUdL values
#name1=reproduce_andy
#name2=Andy_original
#name3=test_EAM

rm harm_to_eam_TI_details.dat
rm harm_to_eam_TI_results.dat
rm harm_to_eam_TI_results.out

file1=/workspace/tamellan/tom_harmonic_to_MEAM/andy_original/answers/int_val_all.andy_original
file2=/workspace/tamellan/tom_harmonic_to_MEAM/reproduce_andy/answers/int_val_all.reproduce_andy
file3=/workspace/tamellan/tom_harmonic_to_MEAM/test_EAM/answers/int_val_all.test_EAM


touch harm_to_eam_TI_details.dat


echo "################################################################################## " >> harm_to_eam_TI_details.dat
echo "Thermodynamic integration results: " >> harm_to_eam_TI_details.dat
echo "Integrated dU/dL for each temperature, " >> harm_to_eam_TI_details.dat
echo "and for each lattice parameters." >> harm_to_eam_TI_details.dat
echo "  " >> harm_to_eam_TI_details.dat
echo "Column 1) Andy's original calculation," >> harm_to_eam_TI_details.dat
echo "Column 2) Reproduction by me with same potential (new random seeds)" >> harm_to_eam_TI_details.dat
echo "Column 3) Reproduction by me using a new fitted EAM potential" >> harm_to_eam_TI_details.dat
echo "##################################################################################  " >> harm_to_eam_TI_details.dat
echo "  " >> harm_to_eam_TI_details.dat

paste $file1 $file2 $file3 >> harm_to_eam_TI_results.dat
cat harm_to_eam_TI_details.dat harm_to_eam_TI_results.dat >> harm_to_eam_TI_results.out

