#!/bin/bash

stats_timeseries.sh ; for i in `echo lambda*`; do awk '{print $3}' $i/stats.out | tail -n 1 ; done | awk -v N=1 '{ sum += $N } END { if (NR > 0) print sum / NR }' > meanL 

echo "Mean uncertainty across all lambda"
cat meanL

echo "Uncertainty in Fah (uncorrelated): mean(dU/dL)/N_L^0.5"
echo $(cat meanL)/3.31 | bc -l
echo $(cat meanL)/3.31 | bc -l > FahUncUnorr

echo "Uncertainty in Fah (correlated): mean(dU/dL)/N_L^0.5*correlationTime (200steps)"
echo $(cat meanL)/3.31*400 | bc -l  > FahUncCorr200steps
echo $(cat meanL)/3.31*400 | bc -l 
