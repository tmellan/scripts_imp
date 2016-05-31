#!/bin/bash

dir=`pwd`/
echo pwd is $dir
type="Tom"

aldirlong="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K 4.730Ang_1900K 4.730Ang_2500K 4.730Ang_3200K 4.730Ang_3805K 4.730Ang_760K 4.759Ang_1900K 4.759Ang_2500K 4.759Ang_3200K 4.759Ang_3805K 4.759Ang_760K 4.801Ang_1900K 4.801Ang_2500K 4.801Ang_3200K 4.801Ang_3805K 4.801Ang_760K 4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

aldir="4.685Ang_1900K 4.685Ang_2500K 4.685Ang_3200K 4.685Ang_3805K 4.685Ang_760K 4.850Ang_1900K 4.850Ang_2500K 4.850Ang_3200K 4.850Ang_3805K 4.850Ang_760K "

cd $dir && echo in the directory $dir

for i in $aldir; do
  cd $i && echo  calculating the error for $i  && cp ../pdfgen_error.awk . && ./pdfgen_error.awk && echo pdfgen_error done in $i
  cp pdfout/* ../../results_mike/long_dUdL/Tom_$i/. && echo pdfs copied to results_mike for $i && cd $dir
  sleep 1
done
echo TOTALLY FINISHED

