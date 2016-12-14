#!/bin/bash

phono3py --cf3 disp-{00001..00146}/vasprun.xml & echo 1
phono3py --dim="2 2 2" -c POSCAR-unitcell & echo 2 
phono3py --fc3 --fc2 --dim="2 2 2" --mesh="21 21 21" -c POSCAR-unitcell --br --tmin=10 --tmax=4010 --tstep=100 & echo 3
#phono3py --fc3 --fc2 --dim="2 2 2" --mesh="21 21 21" -c POSCAR-unitcell --br --wgp && echo 4 && 
#phono3py --fc3 --fc2 --dim="2 2 2" --mesh="21 21 21" -c POSCAR-unitcell --br --read_gamma && echo 5 &&

#kaccum --mesh="21 21 21" POSCAR-unitcell kappa-m111111.hdf5 |tee kaccum.dat && echo 6
