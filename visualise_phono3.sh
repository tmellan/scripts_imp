phonopy --dim="2 2 2" --pa="0 1/2 1/2 1/2 0 1/2 1/2 1/2 0" -c POSCAR-unitcell --mesh="21 21 21" --band="0 0 0 1/2 0 1/2 1/2 1/2 1/2 0 0 0" --hdf5 --readfc --thm -p
kaccum --mesh="21 21 21" POSCAR-unitcell kappa-m111111.hdf5 |tee kaccum.dat &&
