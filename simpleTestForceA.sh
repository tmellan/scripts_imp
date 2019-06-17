#!/bin/bash
  
  case "$1" in
  "2c_test") rsync -av /workspace/tamellan/Zr2AlC/2c_vapsruns/*.xml . ;;
  "2c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/2c_vapsrunsTest/*.xml . ;;

  "2a_test") rsync -av /workspace/tamellan/Zr2AlC/2a_vapsruns/*.xml . ;;
  "2a_cleantest") rsync -av /workspace/tamellan/Zr2AlC/2a_vapsrunsTest/*.xml . ;;

  "0a0c_test") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsruns/*.xml . ;;
  "0a0c_all") rsync -av /workspace/tamellan/Zr2AlC/0a0c_va*/*.xml . ;;
  "0a0c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest/*.xml . ;;

  "0a0c_test") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsruns/*.xml . ;;
  "0a0c_cleantest") rsync -av /workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest/*.xml . ;;

  esac

  cp ../potparas_best1 .  
  rm fitdbse
  MEAMfit_v2_25_9_18
  rm cleanTestForce.out fitted_*
  sed -i 's/1 0 0/0 1 0/g' fitdbse
  MEAMfit_v2_25_9_18 > cleanTestForce.out

  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out > clean.test.forces
  grep "rms error on forces=" cleanTestForce.out > forceRMS.out
  echo force RMS
  cat forceRMS.out
  rm vasp*.xml
