#!/bin/bash
#JK/mol to eV 0.0103643
natoms="64"
scaleJK=$(echo 0.0103643*1000/$natoms | bc -l)
scaleeV=$(echo 1000/$natoms | bc -l)
list="4.575 4.600 4.625 4.65837 4.685 4.730 4.759 4.801 4.850"
name="Fqh_fromMeshfreq_"
c=0

#convert phonopy to Fqh files
for i in $list; do 
  let c=c+1
  paste <(grep "temperature:" thermal_properties-$c.yaml | sed '1,1d' | awk '{printf "%.17g\n", $3}') <(grep "free_energy:" thermal_properties-$c.yaml | sed '1,1d' | awk '{printf "%.17g\n", $2*'$scaleJK'}') | column -t > $name$i
done

#Convert phonopy Vinet to EVinet
a=$(grep "Energy:" vinet.out | awk '{printf "%.17g\n", $2*'$scaleeV'}')
b=$(grep "Volume:" vinet.out | awk '{printf "%.17g\n", $2/'$natoms'}')
c=$(grep "Bulk modulus:" vinet.out | awk '{printf "%.17g\n", $3}')
d=$(grep "Parameters:" vinet.out | awk '{printf "%.17g\n", $4}')
echo $a $b $c $d > EVinet

#Run the MPI fqh.py and getThermodynamics.sh scripts
fqh.py –dfcc –i Fqh_fromMeshfreq_* -wqh2 –p 100000
mkdir ThermoAnalyze 
cp EVinet Fqh_fromMeshfreq_Surface_3rd_order1 ThermoAnalyze/. && cd ThermoAnalyze/
getThermodynamics.sh 
cd output_0.0001GPa/ && head *
