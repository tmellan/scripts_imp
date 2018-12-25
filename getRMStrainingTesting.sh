#!/bin/bash

dir=`pwd`

dirList="1500maxfunc_2000k_0k_only 3000maxfunc_2000k_0k_only 500maxfunc_2000K_0K_only cont cont_1000maxfunc failed-best_cont fresh rr_1131556308_cont_1000maxfunc rr_1323524304_500maxfunc_2000K_0K_only rr_1240215929_500maxfunc_2000K_0K_only"
vaspRunPath="/workspace/tamellan/Zr2AlC/sizeTests48ang/0a0c_vapsruns"
vaspRunPathCleanTest="/workspace/tamellan/Zr2AlC/0a0c_vapsrunsTest"

##Calculate RMSs for training and test sets
function calculateRMS {
c=0
for i in $dirList; do 
  cd $i 

  if [ ! -d "testForce" ]; then mkdir testForce ; fi
  rsync $vaspRunPath/* testForce/.
  cd testForce
  pwd
  mv test.fitdbse fitdbse
  cp ../settings .
  echo "NOOPT=TRUE" >> settings
  echo "POTFILEIN=potparas_best1" >> settings
  sed -i 's/CONT=TRUE/!CONT=TRUE/g' settings
  cp ../potparas_best1 .
  let c=c+1
  echo "Job " $c " , running Test MEAMfit"
  MEAMfit_v2_25_9_18 > testMeam.out  
  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out > test.forces
  grep "rms error on forces=" testMeam.out
  grep "rms error on forces=" testMeam.out  > rms.out

  cd $dir/$i
  if [ ! -d "cleanTestForce" ]; then mkdir clearTestForce ; fi
  rsync $vaspRunPathCleanTest/* clearTestForce/.
  cd clearTestForce
  pwd
  mv test.fitdbse fitdbse
  cp ../settings .
  echo "NOOPT=TRUE" >> settings
  echo "POTFILEIN=potparas_best1" >> settings
  sed -i 's/CONT=TRUE/!CONT=TRUE/g' settings
  cp ../potparas_best1 .
  echo "Job " $c " , running Clean Test MEAMfit"
  MEAMfit_v2_25_9_18 > cleanTestMeam.out
  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out > clean.test.forces
  grep "rms error on forces=" cleanTestMeam.out
  grep "rms error on forces=" cleanTestMeam.out  > rms.out

  cd $dir
done
}

##Output

function showRMS {
echo Results:
pwd

#Full results to screen
c=0
for i in $dirList; do 
  trainRMS=$(head $i/best* | grep 1:) 
  testRMS=$(head $i/test*/rms* | awk '{print $5}') 
  cleanTestRMS=$(head $i/clean*/rms* | awk '{print $5}') 
  totalDataPoints=$(grep "Fitting to" $i/1.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/1.out | awk '{print $1}')
  let c=c+1 
  echo $c", "$i", DataPoints:" $totalDataPoints", DataPointsPerParameter:" $dataPointsPerParameter", TrainingRMS:" $trainRMS", TestingRMS:" $testRMS", CleanTestRMS:" $cleanTestRMS
done  | column -t 

#Full results to file
c=0
runTimeHr=`date +%H-%m-%d-%y`
for i in $dirList; do
  trainRMS=$(head $i/best* | grep 1:)
  testRMS=$(head $i/test*/rms* | awk '{print $5}')
  cleanTestRMS=$(head $i/clean*/rms* | awk '{print $5}')
  totalDataPoints=$(grep "Fitting to" $i/1.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/1.out | awk '{print $1}')
  let c=c+1
  echo $c", "$i", DataPoints:" $totalDataPoints", DataPointsPerParameter:" $dataPointsPerParameter", TrainingRMS:" $trainRMS", TestingRMS:" $testRMS", CleanTestRMS:" $cleanTestRMS
done | column -t  > $runTimeHr.out

#Plot friendly results to file
c=0
for i in $dirList; do
  trainRMSsmall=$(head $i/best* | grep 1: | awk '{print $2}')
  testRMS=$(head $i/test*/rms* | awk '{print $5}')
  cleanTestRMS=$(head $i/clean*/rms* | awk '{print $5}')
  totalDataPoints=$(grep "Fitting to" $i/1.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/1.out | awk '{print $1}')
  let c=c+1
  echo $c $totalDataPoints $dataPointsPerParameter $trainRMSsmall $testRMS $cleanTestRMS
done > $runTimeHr.dat
}

if [ "$1" == "show" ]; then showRMS ; else if [ ! -d outFiles ]; then mkdir outFiles ; fi ; mv *.dat *.out outFiles/. ; calculateRMS && showRMS ; fi
