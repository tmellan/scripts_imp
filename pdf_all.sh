#!/bin/bash

TITLE="PDF high-parameter 700eV 444kp MD DFT 261x3fs"
NAME=MD_high

cat>pdfplot<<!
#set term postscript enhanced eps
set term pdf
set output "$NAME.pdfall.pdf"
set xlabel "Distance (Angstrom)"
set ylabel "Freq"
set yrange [0:0.6]
set title '$TITLE'
plot "all_pdf.txt" u 1:2 lt 4 ps 2 title "Zr-Zr", "" u 1:3 title "Zr-C", "" u 1:4 title "C-C"
!

gnuplot -persist pdfplot
#xdg-open "$NAMEpdfall.eps"
