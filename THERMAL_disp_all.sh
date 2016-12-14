#!/bin/bash

#list="alatt4.575 alatt4.65837 alatt4.685 alatt4.730 alatt4.759 alatt4.801 alatt4.850"
cp ../../../temps .
sed '1,3'd thermal_displacement_matrices.yaml | sed -n '4~66p' | column -t | awk '{print $3, $4, $5}' > Zr_disp
sed '1,3'd thermal_displacement_matrices.yaml | sed -n '12~66p' | column -t | awk '{print $3, $4, $5}' > Zr_disp_def

sed '1,3'd thermal_displacement_matrices.yaml | sed -n '36~66p' | column -t | awk '{print $3, $4, $5}' > C_disp
sed '1,3'd thermal_displacement_matrices.yaml | sed -n '60~66p' | column -t | awk '{print $3, $4, $5}' > C_disp_def



paste temps Zr_disp > T_d_Zr
paste temps Zr_disp_def > T_d_Zr_def
paste temps C_disp > T_d_C
paste temps C_disp_def > T_d_C_def

#cat >plotfile<<!
#set key left
#set title "Defect ZrC : C Mean square thermal displacements"
#set xrange [-100:4100]
#set ylabel "MS displacement (Ang^2)"
#set xlabel "Temperature (K)"
#plot "T_d_Zr" u 1:2 ps 3 title "Zr", "" u 1:2 w l lw 2 title "", "T_d_C" u 1:2 ps 3 title "C", "" u 1:2 w l lw 2 title ""

#set term x11 0
#plot "Zr_all_disp_T" u 1:2 w l lw 2 title "4.575", "" u 1:3 w l lw 2 title "4.685", "" u 1:4 w l lw 2 title "4.730", "" u 1:5 w l lw 2 title "4.759", "" u 1:6 w l lw 2 title "4.801", "" u 1:7 w l lw 2 title "4.850"

#set term x11 1

#set title "ZrC : Zr Mean square thermal displacements"
#plot "C_all_disp_T" u 1:2 w l lw 2 title "4.575", "" u 1:3 w l lw 2 title "4.685", "" u 1:4 w l lw 2 title "4.730", "" u 1:5 w l lw 2 title "4.759", "" u 1:6 w l lw 2 title "4.801", "" u 1:7 w l lw 2 title "4.850"


#!
#gnuplot -persist plotfile
