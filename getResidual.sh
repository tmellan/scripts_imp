  awk '{$3=$2-$1}'1 free_energy  > residual
  mean=$(awk -v N=3 '{ sum += $N } END { if (NR > 0) print sum / NR }' residual)
  rm acc.*
  awk '{ D[NR]=$3; T+=$3 }
          NR==1 { print 0 ; next }
          {        V=0
                    A=T/NR
                    for(N=1; N<=NR; N++) V+=(D[N]-A)*(D[N]-A)
                    V/=(NR-1)
                    $0 = V**0.5 / NR**0.5 } 1'  residual > acc.convergence.true_minus_fit
sdErr=$(tail -n 1  acc.convergence.true_minus_fit)
  
echo mean residual in meV/at
echo $mean*1000/64 | bc -l
echo sdErr in meV/at
echo $sdErr*1000/64 | bc -l


cat <(echo mean residual in meV/at)  <(  echo $mean*1000/64 | bc -l) <( echo sdErr in meV/at) <(echo $sdErr*1000/64 | bc -l) > mean_sderr_residual.out

paste <(echo "meam = ") <(echo "scale=2; $mean*1000/64" | bc -l) <(echo "meV/at.") <(echo " sderr = ") <(echo "scale=2; $sdErr*1000/64" | bc -l) <(echo "meV/at.") | column -t
