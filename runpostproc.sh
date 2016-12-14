#!/bin/bash

dir=`pwd`
list="4.685Ang/ 4.730Ang/ 4.759Ang/ 4.801Ang/ 4.850Ang/ blochl_test_4.6910600662Ang_exp/"

for i in $list; do 
  cp visualise_phono3.sh post_proc_phon.sh $i/.
  cd $i/
  ./post_proc_phon.sh
  cd $dir
  echo done $i
done
