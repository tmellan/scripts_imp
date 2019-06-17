#!/bin/bash
  
  case "$1" in 
  "2c_test") rsync -av /workspace/tamellan/Zr2AlC/2c_vapsruns/*.xml . ;;
  "2c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/2c_vapsrunsTest/*.xml . ;;

  "2a_test") rsync -av /workspace/tamellan/Zr2AlC/2a_vapsruns/*.xml . ;;
  "2a_cleantest") rsync -av /workspace/tamellan/Zr2AlC/2a_vapsrunsTest/*.xml . ;;

  "0a0c_test") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsruns/*.xml . ;;
  "0a0c_all") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsruns*/*.xml . ;;
  "0a0c_all3") rsync -av /workspace/tamellan/Zr2AlC/0a0c_va*runs*/*.xml . ;;
  "0a0c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest/*.xml . ;;
  "0a0c_test4") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest4all/*.xml . ;;

  "0a0c_test") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsruns/*.xml . ;;
  "0a0c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest/*.xml . ;;

  esac

  cp ../potparas_best1 .  
  rm fitdbse
  MEAMfit_v2_25_9_18
  rm cleanTestEnergy.out fitted_*
  MEAMfit_v2_25_9_18 > cleanTestEnergy.out

  tail -n +2 fitted_quantities.out | awk '{print $2*1000/128, $3*1000/128}' | awk '{$3=$2-$1}'1 > fitted_true_upSample
  tail -n +2 fitted_quantities.out | awk '{print $2*1000/128, $3*1000/128}' | awk '{$3=$2-$1}'1 | awk -v N=3 '{ sum += $N } END { if (NR > 0) print sum / NR }' >> fitted_true_upSample
  tail -n +2 fitted_quantities.out | awk '{print $2*1000/128, $3*1000/128}' | awk '{$3=$2-$1}'1 | awk -v N=3 '{sum+=$N; array[NR]=$N} END {for(x=0;x<=NR;x++){sumsq+=((array[x]-(sum/NR))**2);}print sqrt(sumsq/NR)/sqrt(NR)}' >> fitted_true_upSample

  echo fitted true upsample
  echo meam
  echo sderr
  cat fitted_true_upSample 
  rm vasp*.xml 
  tail -n 2 fitted_true_upSample > up.out 
