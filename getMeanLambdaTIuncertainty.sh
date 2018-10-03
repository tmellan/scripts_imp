#!/bin/bash

stats_timeseries.sh ; for i in `echo lambda*`; do awk '{print $3}' $i/stats.out | tail -n 1 ; done | awk -v N=1 '{ sum += $N } END { if (NR > 0) print sum / NR }' > meanL 

echo "Mean uncertainty across all lambda"
cat meanL

echo "Uncertainty in Fah (uncorrelated): mean(dU/dL)/N_L^0.5"
echo $(cat meanL)/3.31 | bc -l
echo $(cat meanL)/3.31 | bc -l > FahUncUnorr

echo "Uncertainty in Fah (correlated): mean(dU/dL)/N_L^0.5*correlationTime sqrt(500steps) = 24"
echo $(cat meanL)/3.31*24 | bc -l  > FahUncCorr200steps
echo $(cat meanL)/3.31*24 | bc -l 

t=$(basename `pwd`)
echo "Uncertainty in Fah (correlated): mean(dU/dL)/N_L^0.5*sqrt(tau) ; tau=1.8*10^6/T"
echo "$(cat meanL)/3.31*sqrt(1.81818*1000000/"$t")" | bc -l  > "FahUncCorrT"$t"steps"
echo "$(cat meanL)/3.31*sqrt(1.81818*1000000/"$t")" | bc -l

echo "Statistical error"
echo "$(cat meanL)/3.31*sqrt(1.81818*1000000/"$t")*127*0.7071" | bc -l
echo "$(cat meanL)/3.31*sqrt(1.81818*1000000/"$t")*127*0.7071" | bc -l > stat.error.supercell
#Scattering time taken from CVAC_TI_analysis mathematica notebook
