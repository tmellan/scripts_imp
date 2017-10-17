#!/bin/bash

###########
#NOTE: reads in vinet.out and thermal_properties-X.yaml files
############


#JK/mol to eV 0.0103643
natoms="44"
scaleJK=$(echo 0.0103643*1000/$natoms | bc -l)
scaleeV=$(echo 1000/$natoms | bc -l)

list="4.575 4.600 4.625 4.658285 4.685 4.730 4.759 4.801 4.850 4.875 4.900"
name="Fqh_fromMeshfreq_"
dir=`pwd`
orderFit="2 3" 
c=0

#convert phonopy to Fqh files
for i in $list; do 
  let c=c+1
  aa=$(sed -n '2p' $i"a"/POSCAR)
  bb=$(sed -n '3p' $i"a"/POSCAR | awk '{print $1}')
  cc=$(sed -n '4p' $i"a"/POSCAR | awk '{print $2}')
  dd=$(sed -n '5p' $i"a"/POSCAR | awk '{print $3}')
  volperatom=$(echo "scale=9; $aa*$aa*$aa*$bb*$cc*$dd/$natoms" | bc -l)
  paste <(grep "temperature:" thermal_properties-$c.yaml | sed '1,1d' | awk '{printf "%.17g\n", $3}') <(grep "free_energy:" thermal_properties-$c.yaml | sed '1,1d' | awk '{printf "%.17g\n", $2*'$scaleJK'}') | column -t > $name$volperatom
done

#Convert phonopy Vinet to EVinet
a=$(grep "Energy:" vinet.out | awk '{printf "%.17g\n", $2*'$scaleeV'}')
b=$(grep "Volume:" vinet.out | awk '{printf "%.17g\n", $2/'$natoms'}')
c=$(grep "Bulk modulus:" vinet.out | awk '{printf "%.17g\n", $3}')
d=$(grep "Parameters:" vinet.out | awk '{printf "%.17g\n", $4}')
echo $a $b $c $d > EVinet

#Run the MPI fqh.py and getThermodynamics.sh scripts
for i in $orderFit; do
  fqh.py  -i Fqh_fromMeshfreq_* '-wqh'$i -p 100000
  mkdir order$i'ThermoAnalyze' 
  cp EVinet  order$i'ThermoAnalyze'/. 
  mv delta*dat Fqh_fromMeshfreq_Surface_$i*  order$i'ThermoAnalyze'/.
  cd order$i'ThermoAnalyze'
  getThermodynamics.sh 
  cd output_0.0001GPa/ && paste <(head *) <(tail *)
  cd $dir
  echo ***************************done order $orderFit *****************************
done
