#!/bin/bash

cat>felplota<<!
  set output "GFE.pdf"
  set terminal pdf linewidth 3
  set ylabel "Gibbs free energy (meV/atom)"
  set xlabel "T (K)"
  set termoption dashed
  set key outside

  p "PERF/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "PERF",\
    "FREN_129_B2/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "FREN-B2",\
    "FREN_1126_U4/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "FREN-U4",\
    "FREN_174_U3/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "FREN-U3",\
    "FREN_142_B3/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "FREN-142",\
    "FREN_70_U2/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "FREN-70",\
    "C_vac/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "CVAC",\
    "Z_vac/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l t "ZVAC",\
    "SUBSTOI_ZR8C7/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l dashtype 4  t "ZR8C7",\
    "SUBSTOI_ZR6C5/3_fel/output_0.0001GPa/Gibbs_energy" u 1:2 w l dashtype 2  t "ZR6C5"
!

cat>felplotb<<!
  set output "entropy.pdf"
  set terminal pdf linewidth 3
  set ylabel "Entropy (k_B/atom)"
  set xlabel "T (K)"
  set key left

  p "PERF/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "PERF",\
    "FREN_129_B2/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "FREN-B2",\
    "FREN_1126_U4/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "FREN-U4",\
    "FREN_174_U3/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "FREN-U3",\
    "FREN_142_B3/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "FREN-142",\
    "FREN_70_U2/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "FREN-70",\
    "C_vac/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "CVAC",\
    "Z_vac/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "ZVAC",\
    "SUBSTOI_ZR8C7/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "ZR8C7",\
    "SUBSTOI_ZR6C5/3_fel/output_0.0001GPa/entropy" u 1:2 w l t "ZR6C5"
!
cat>felplotc<<!
  set output "bulkModAdiabtic.pdf"
  set terminal pdf linewidth 3
  set ylabel "K (GPa)"
  set xlabel "T (K)"
  set key outside
  set termoption dashed

  p "PERF/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "PERF",\
    "FREN_129_B2/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "FREN-B2",\
    "FREN_1126_U4/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "FREN-U4",\
    "FREN_174_U3/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "FREN-U3",\
    "FREN_142_B3/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "FREN-142",\
    "FREN_70_U2/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "FREN-70",\
    "C_vac/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "CVAC",\
    "Z_vac/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l t "ZVAC",\
    "SUBSTOI_ZR8C7/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l dashtype 4 t "ZR8C7",\
    "SUBSTOI_ZR6C5/3_fel/output_0.0001GPa/bulk_modulus_adiabatic" u 1:2 w l dashtype 2 t "ZR6C5"
!

cat>felplotd<<!
  set output "volExpCoeff.pdf"
  set terminal pdf linewidth 3
  set ylabel "Volume expansion coefficient (10^-5 K^-1)"
  set xlabel "T (K)"
  set key outside
  set termoption dashed

  p "PERF/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "PERF",\
    "FREN_129_B2/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "FREN-129-B2",\
    "FREN_1126_U4/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "FREN-1126-U4",\
    "FREN_174_U3/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "FREN-174-U3",\
    "FREN_142_B3/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "FREN-142-B3",\
    "FREN_70_U2/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "FREN-70-U2",\
    "C_vac/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "CVAC",\
    "Z_vac/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l t "ZVAC",\
    "SUBSTOI_ZR8C7/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l dashtype 4 t "ZR8C7",\
    "SUBSTOI_ZR6C5/3_fel/output_0.0001GPa/volume_expansion_coefficient" u 1:2 w l dashtype 2 t "ZR6C5"
!

cat>felplote<<!
  set output "cp.pdf"
  set terminal pdf linewidth 3
  set ylabel "Heat capacity isobaric (k_B)"
  set xlabel "T (K)"
  set key outside
  set termoption dashed

  p "PERF/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "PERF",\
    "FREN_129_B2/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "FREN-B2",\
    "FREN_1126_U4/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "FREN-U4",\
    "FREN_174_U3/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "FREN-U3",\
    "FREN_142_B3/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "FREN-142",\
    "FREN_70_U2/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "FREN-70",\
    "C_vac/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "CVAC",\
    "Z_vac/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l t "ZVAC",\
    "SUBSTOI_ZR8C7/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l dashtype 4 t "ZR8C7",\
    "SUBSTOI_ZR6C5/3_fel/output_0.0001GPa/heat_capacity_isobaric" u 1:2 w l dashtype 2 t "ZR6C5"
!

gnuplot -persist felplotd
xdg-open volExpCoeff.pdf
