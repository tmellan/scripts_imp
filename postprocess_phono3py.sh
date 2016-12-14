module load phono3py
phono3py --cf3 disp-{00001..00146}/vasprun.xml
phono3py --dim="1 1 1" -c POSCAR-unitcell
phono3py --fc3 --fc2 --dim="1 1 1" --mesh="11 11 11" -c POSCAR-unitcell --br
phono3py --fc3 --fc2 --dim="1 1 1" --mesh="11 11 11" -c POSCAR-unitcell --br --wgp

