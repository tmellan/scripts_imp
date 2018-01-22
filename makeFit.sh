#!/bin/bash

dir=`pwd`

#Get potparas and settings file noopt
cp ../UPSAMPLE_SUB_STUFF/* .

#Find the number of UP-sample vaspruns to look at:
sampleNum=$(echo vasprun-* | wc | awk '{print $2}')
echo $sampleNum " vaspruns"

#Generate a new fitdbse driver file
echo "  "$sampleNum" # Files | Configs to fit | Quantity to fit | Weights" > 1.tmp
for i in `seq 1 $sampleNum`; do echo vasprun-$i.xml 1-1s1  Fr 1 0 0 ; done > 2.tmp
cat 1.tmp 2.tmp > fitdbse
rm *.tmp

#Compute energies using MEAMfit
/workspace/aiduff/progs/MEAMfit/bin/MEAMfit.x > meam.out &
wait
echo "meam done"
echo " "

#Compute and print the UPsample, which is fitted minus true
echo "head fit_true_fit-true"
awk '{print $2, $3, $2-$3}' fitted_quantities.out | tail -n +2  | column -t > fit_true_fit-true
head fit_true_fit-true

#Mean up-sample
awk -v N=3 '{ sum += $N } END { if (NR > 0) print sum / NR }' fit_true_fit-true > mean.fit_true_fit-true

#Convegence of standard error with up-sample number
  awk '{ D[NR]=$3; T+=$3 }
          NR==1 { print 0 ; next }
          {        V=0
                    A=T/NR
                    for(N=1; N<=NR; N++) V+=(D[N]-A)*(D[N]-A)
                    V/=(NR-1)
                    $0 = V**0.5 / NR**0.5 } 1' fit_true_fit-true > acc.convergence.fit_true_fit-true
awk '{$2=$1*1000/64}'1 acc.convergence.fit_true_fit-true > acc.tmp
mv acc.tmp acc.convergence.fit_true_fit-true

#Final (most) accurate standard error
tail -n 1 acc.convergence.fit_true_fit-true | awk '{print $1}' > stErr.fit_true_fit-true

#Print results
echo " "
echo "Fit - True UP-sample" > out.1.tmp
echo "Mean" "SDerr" > out.2.tmp
paste <(cat  mean.fit_true_fit-true) <(cat stErr.fit_true_fit-true) > out.3.tmp
paste <(awk '{print $1*1000/64}' out.3.tmp) <(awk '{print $2*1000/64}' out.3.tmp) > out.4.tmp
cat out.1.tmp out.2.tmp out.3.tmp out.4.tmp > out.put
rm *.tmp
cat out.put
