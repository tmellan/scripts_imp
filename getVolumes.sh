#convert phonopy to Fqh files
list="4.658285 4.685 4.730 4.759 4.801 4.850 4.875 4.900"
natoms=44
for i in $list; do 
  let c=c+1
  aa=$(sed -n '2p' $i"_0.01"/POSCAR)
#  echo $aa
  bb=$(sed -n '3p' $i"_0.01"/POSCAR | awk '{printf "%.23g", $1}')
#  echo $bb
  cc=$(sed -n '4p' $i"_0.01"/POSCAR | awk '{printf "%.23g", $2}')
#  echo $cc
  dd=$(sed -n '5p' $i"_0.01"/POSCAR | awk '{printf "%.23g", $3}')
#  echo $dd
  volperatom=$(echo "scale=18; $aa*$aa*$aa*$bb*$cc*$dd/$natoms" | bc -l)
  echo $volperatom
done > volumes
cat volumes

