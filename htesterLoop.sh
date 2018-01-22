#!/bin/bash
dir=`pwd`

n=0
for i in {1..5}; do 
  let n=n+1
  rm -r $i."hold.Fo.test" $i."hold.Fr.test"
  mkdir $i."hold.Fo.test" $i."hold.Fr.test"

  cp settings vasprun*.xml "h.fo.test.fitdbse" $i."hold.Fo.test"/.
  cp settings vasprun*.xml "h.fr.test.fitdbse" $i."hold.Fr.test"/.

  cd $i."hold.Fo.test"
  echo $i."hold.Fo.test"
#  pwd
  echo "POTFILEIN=potparas_best"$n >> settings
  echo "NOOPT=TRUE" >> settings
  cp "h.fo.test.fitdbse" fitdbse
  cp ../potparas_best$n .
  /workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &
  wait
  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out  | column -t > forces
  echo "/workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &" > command
  cd $dir

  cd $i."hold.Fr.test"
  echo $i."hold.Fr.test"
#  pwd
  echo "POTFILEIN=potparas_best"$n >> settings
  echo "NOOPT=TRUE" >> settings
  cp "h.fr.test.fitdbse" fitdbse
  cp ../potparas_best$n .
  /workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &
  wait
  awk '{print $2, $3}' fitted_quantities.out  | column -t > free_energy
  echo "/workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &" > command
  getResidual.sh
  cd $dir
done > residual.all
rm *.Fo.test/vasprun*
rm *.Fr.test/vasprun*
echo done up to $n
echo residuals are: 
echo " "
cat residual.all

#!Files:
#1vasprun_3822_9.7_1083_allgd.xml 
#2vasprun_3822_9.7_853_461gd.xml 
#3vasprun_3822_9.7_867_allgd.xml 
#4vasprun_3822_9.7_1041_allgd.xml 
#5vasprun_3822_9.7_1021_346gd.xml
