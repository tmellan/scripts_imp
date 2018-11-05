#!/bin/bash

dir=`pwd`

vaspRunPath="/workspace/tamellan/Zr2AlC/sizeTests48ang/0a0c_vapsruns"

##Calculate RMSs for training and test sets
function calculateRMS {
c=0
for i in `echo *size`; do 
  cd $i 
  if [ ! -d "testForce" ]; then mkdir testForce ; fi
  rsync $vaspRunPath/* testForce/.
  cd testForce
  pwd
  mv test.fitdbse fitdbse
  cp ../settings .
  echo "NOOPT=TRUE" >> settings
  echo "POTFILEIN=potparas_best1" >> settings
  cp ../potparas_best1 .
  let c=c+1
  echo "Job " $c " , running Test MEAMfit"
  MEAMfit_v2_25_9_18 > testMeam.out  
  awk -F" {2,}" '{print $2, $3, $4, $5, $6, $7}' fitted_quantities.out > test.forces
  grep "rms error on forces=" testMeam.out
  grep "rms error on forces=" testMeam.out  > rms.out
  cd $dir
done
}

##Output

function showRMS {
echo Results:
pwd

#Full results to screen
c=0
for i in `echo *size`; do 
  trainRMS=$(head $i/best* | grep 1:) 
  testRMS=$(head $i/test*/rms* | awk '{print $5}') 
  totalDataPoints=$(grep "Fitting to" $i/meam.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/meam.out | awk '{print $1}')
  let c=c+1 
  echo $c", DataPoints:" $totalDataPoints", DataPointsPerParameter:" $dataPointsPerParameter", TrainingRMS:" $trainRMS", TestingRMS:" $testRMS
done  

#Full results to file
c=0
runTimeHr=`date +%H-%m-%d-%y`
for i in `echo *size`; do
  trainRMS=$(head $i/best* | grep 1:)
  testRMS=$(head $i/test*/rms* | awk '{print $5}')
  totalDataPoints=$(grep "Fitting to" $i/meam.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/meam.out | awk '{print $1}')
  let c=c+1
  echo $c", DataPoints:" $totalDataPoints", DataPointsPerParameter:" $dataPointsPerParameter", TrainingRMS:" $trainRMS", TestingRMS:" $testRMS
done > $runTimeHr.out

#Plot friendly results to file
c=0
for i in `echo *size`; do
  trainRMSsmall=$(head $i/best* | grep 1: | awk '{print $2}')
  testRMS=$(head $i/test*/rms* | awk '{print $5}')
  totalDataPoints=$(grep "Fitting to" $i/meam.out | awk '{print $3}')
  dataPointsPerParameter=$(grep 'fit points' $i/meam.out | awk '{print $1}')
  let c=c+1
  echo $c $totalDataPoints $dataPointsPerParameter $trainRMSsmall $testRMS
done > $runTimeHr.dat
}

if [ "$1" == "show" ]; then showRMS ; else if [ ! -d outFiles ]; then mkdir outFiles ; fi ; mv *.dat *.out outFiles/. ; calculateRMS && showRMS ; fi
