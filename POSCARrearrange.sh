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
