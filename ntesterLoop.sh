#!/bin/bash
dir=`pwd`

n=0

for i in {1..10}; do 
  let n=n+1
  rm -r $i."Fo.test" $i."Fr.test"
  mkdir $i."Fo.test" $i."Fr.test"

  cp settings vasprun*.xml "fo.test.fitdbse" $i."Fo.test"/.
  cp settings vasprun*.xml "fr.test.fitdbse" $i."Fr.test"/.

  cd $i."Fo.test"
  pwd
  echo "POTFILEIN=potparas_best"$n >> settings
  echo "NOOPT=TRUE" >> settings
  cp "fo.test.fitdbse" fitdbse
  cp ../potparas_best$n .
  /workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &
  wait
  grep "rms error on forces" meam.out
  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out  | column -t > forces
  echo "/workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &" > command
  cd $dir

  cd $i."Fr.test"
  pwd
  echo "POTFILEIN=potparas_best"$n >> settings
  echo "NOOPT=TRUE" >> settings
  cp "fr.test.fitdbse" fitdbse
  cp ../potparas_best$n .
  /workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &
  wait
  grep "rms error on energies" meam.out
  awk '{print $2, $3}' fitted_quantities.out  | column -t > free_energy
  echo "/workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &" > command
  cd $dir
done > testSet.fits
echo done
echo ""
echo test Set Fits:
echo ""
cat testSet.fits


#!Files:
#1vasprun_3822_9.7_1083_allgd.xml 
#2vasprun_3822_9.7_853_461gd.xml 
#3vasprun_3822_9.7_867_allgd.xml 
#4vasprun_3822_9.7_1041_allgd.xml 
#5vasprun_3822_9.7_1021_346gd.xml
