#!/bin/bash

cat>ani_plot<<!
set term gif animate delay 1
set output "output.gif"
set yrange [0:0.6]
set xlabel "Pair separation distance (Ang)"
set ylabel "Frequency"
set title "PDF ZrC high-parameter DFT MD 4.850Ang 261x3 fs trajectory"
do for [i=1:261] { plot sprintf('PDF_POSCAR%d.txt', i) u 1:2 w l title sprintf('Zr-Zr%d', i), sprintf('PDF_POSCAR%d.txt', i) u 1:3 w l title sprintf('Zr-C%d', i), sprintf('PDF_POSCAR%d.txt', i) u 1:4 w l title sprintf('C-C%d', i); pause 0.1 }
!

gnuplot ani_plot

xdg-open output.gif
#gnome-open output.gif

