#/bin/awk

l="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0"
dir=`pwd`
enddir=`pwd | sed 's#.*/##'`
mkdir epsout

for i in $l; do
  cd lambda$i

  echo 1 2 3 4 5 6 7 8 9 10 11 12 13 > no.dat
  echo "Pre_Eq_N N dUdL dUdL/N Sum(dUdL) Mean(dUd)L dUdL^2 dUdL^2/N Sum(dUdL^2) Mean(dUdL^2) Variance SD Mean-SD" > name.dat 

  PRE_EQ_N=$(awk '{ if (NR==3) print $3 }' INCAR)
  echo $PRE_EQ_N

  awk -v PRE="$PRE_EQ_N" 'BEGIN{i=0}
                {pre_step[i]=$1 ; N[i]=($1+'PRE') ; dUdL[i]=$7 ; dUdLperN[i]=dUdL[i]/(i-1.0000001) ; Sum_dUdL[i]=dUdL[i]+Sum_dUdL[i-1] ; Av_dUdL[i]=Sum_dUdL[i]/(i-1.000000001) ; sq_dUdL[i]=$7*$7 ; sq_dUdLperN[i]=sq_dUdL[i]/(i-1.000000001) ; Sum_sq_dUdL[i]=sq_dUdL[i]+Sum_sq_dUdL[i-1] ; Av_sq_dUdL[i]=Sum_sq_dUdL[i]/(i-1.000000001) ; var[i]=Av_sq_dUdL[i]-(Av_dUdL[i]*Av_dUdL[i]) ; sd[i]=var[i]**0.5 ; dif[i]=(Av_dUdL[i]-sd[i]) ; i=i+1} \
       END{for (j=0;j<i;j++) print pre_step[j], N[j], dUdL[j], dUdLperN[j], Sum_dUdL[j], Av_dUdL[j], sq_dUdL[j], sq_dUdLperN[j], Sum_sq_dUdL[j], Av_sq_dUdL[j], var[j], sd[j], dif[j]}' pre_equilibration > tmp
  sed '1,2d' tmp | column -t > tmp2
  cat no.dat name.dat tmp2 name.dat | column -t > test.err
  rm tmp2 tmp


cat>plotfile<<!

set term postscript enhanced eps
set out "../epsout/$i$enddir.eps"
set title "dU/dL for lambda $i"
set xlabel "Nth step"
set ylabel "dU/dL (meV/atom)"
set termoption dash
plot "test.err" u 2:3 w l lw 1 lc 3 lt 1 title "dU/dL", "" u 2:6 w l lw 3 lc 4 lt 1 title "dU/dL Average", "" u 2:12 w l lw 3 lc 1 lt 1 title "dU/dL Standard Deviation"

!
  gnuplot -persist plotfile
  cd ../
done

echo "DONE FIRST PART! dUdL for each of the 12 lambdas"

dir=`pwd`

cat>plotfile2<<!
#set term x11
#set term qt 0
set term postscript enhanced eps
set out "epsout/Mean$enddir$i.eps"
set termoption dash
set xlabel "Nth step"
set ylabel "dU/dL Mean (meV/atom)" 
set title "Mean of dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:6 w l lc i lw 3 lt 1 title sprintf("Mu L=0.%i",i), "$dir/lambda1.0/test.err" u 2:6 w l lc 10 lw 3 lt 3 title "Mu L=1.0"

#set term qt 1
set term postscript enhanced eps
set out "epsout/SD$enddir$i.eps"
set termoption dash
set xlabel "Nth step"
set ylabel "dU/dL SD (meV/atom)"
set title "Standard Deviation of dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:12 w l lc i lw 3 lt 1 title sprintf("SD L=0.%i",i), "$dir/lambda1.0/test.err" u 2:12 w l lc 10 lw 3 lt 3 title "SD L=1.0"

#set term qt 2
set terminal postscript enhanced eps
set out "epsout/Dif$enddir$i.eps"
set termoption dash
set xlabel "Nth step"
set ylabel "dU/dL Mean-SD (meV/atom)"
set title "Mean minus Standard Deviation dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:13 w l lc i lw 3 lt 1 title sprintf("Mu-SD L=0.%i",i), "$dir/lambda1.0/test.err" u 2:13 w l lc 10 lw 3 lt 3 title "Mu-SD L=1.0"
!

gnuplot -persist plotfile2

echo "DONE FINAL PART! Mean, SD and SD minus Mean."
