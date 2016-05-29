#/bin/awk

dir=`pwd`
cat>plotfile2<<!
#set term x11

set term qt 0
set termoption dash
set out "dUdL_mean.eps"
set xlabel "Nth step"
set ylabel "dU/dL Mean (meV/atom)" 
set title "Mean of dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:6 w l lc i lw 3 lt 1 title sprintf("Mu L=0.%i",i), "$dir/lambda1.0/test.err" u 2:6 w l lc 10 lw 3 lt 3 title "Mu L=1.0"

set term qt 1
set termoption dash
set out "dUdL_SD.pdf"
set xlabel "Nth step"
set ylabel "dU/dL SD (meV/atom)"
set title "Standard Deviation of dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:12 w l lc i lw 3 lt 1 title sprintf("SD L=0.%i",i), "$dir/lambda1.0/test.err" u 2:12 w l lc 10 lw 3 lt 3 title "SD L=1.0"

set term qt 2
set terminal postscript
set termoption dash
set out "dUdL_Mu_minus_SD.pdf"
set xlabel "Nth step"
set ylabel "dU/dL Mean-SD (meV/atom)"
set title "Mean minus Standard Deviation dU/dL"
plot for [i=0:9] sprintf('$dir/lambda0.%i/test.err', i) u 2:13 w l lc i lw 3 lt 1 title sprintf("Mu-SD L=0.%i",i), "$dir/lambda1.0/test.err" u 2:13 w l lc 10 lw 3 lt 3 title "Mu-SD L=1.0"
!

gnuplot -persist plotfile2

echo "DONE FINAL PART!"
