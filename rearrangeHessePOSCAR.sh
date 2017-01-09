#!/bin/bash

#  Zr ZZ Zr ZZ Zr ZZ Zr ZZ Zr ZZ   C 
#13 1 1 1 3 1 3 1 6 2 31

#POSCAR
    sed -n '1,5p' POSCAR   > head1
    echo "ZZ Zr C" > head2
    echo "6 26 31" > head3
    sed -n '8,8p' POSCAR   > head4
    sed -n '9,21p' POSCAR  > zr1
    sed -n '22,22p' POSCAR > zz1
    sed -n '23,23p' POSCAR > zr2
    sed -n '24,24p' POSCAR > zz2
    sed -n '25,27p' POSCAR > zr3
    sed -n '28,28p' POSCAR > zz3
    sed -n '29,31p' POSCAR > zr4
    sed -n '32,32p' POSCAR > zz4
    sed -n '33,38p' POSCAR > zr5
    sed -n '39,40p' POSCAR > zz5
    sed -n '41,71p' POSCAR > c1 
cat head1 head2 head3 head4 zz1 zz2 zz3 zz4 zz5 zr1 zr2 zr3 zr4 zr5 c1 > reorder.POSCAR
cp reorder.POSCAR POSCAR

#Hessesphinx
    sed -n '1,13p' HesseMatrix_sphinx  > hzr1
    sed -n '14,14p' HesseMatrix_sphinx > hzz1
    sed -n '15,15p' HesseMatrix_sphinx > hzr2
    sed -n '16,16p' HesseMatrix_sphinx > hzz2
    sed -n '17,19p' HesseMatrix_sphinx > hzr3
    sed -n '20,20p' HesseMatrix_sphinx > hzz3
    sed -n '21,23p' HesseMatrix_sphinx > hzr4
    sed -n '24,24p' HesseMatrix_sphinx > hzz4
    sed -n '25,30p' HesseMatrix_sphinx > hzr5
    sed -n '31,32p' HesseMatrix_sphinx > hzz5
    sed -n '33,63p' HesseMatrix_sphinx > hc1
cat hzz1 hzz2 hzz3 hzz4 hzz5 hzr1 hzr2 hzr3 hzr4 hzr5 hc1 > reorder.hesse
cp HesseMatrix_sphinx orig.HesseMatrix_sphinx
mv reorder.hesse HesseMatrix_sphinx
