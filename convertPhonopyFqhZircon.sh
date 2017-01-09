#!/bin/bash
#JK/mol to eV 0.0103643
natoms="64"
scaleJK=$(echo 0.0103643*1000/$natoms | bc -l)
scaleeV=$(echo 1000/$natoms | bc -l)
#list="4.575 4.600 4.625 4.65837 4.685 4.730 4.759 4.801 4.850"
#list="3.450 3.4750 3.500 3.525 3.550 3.575 3.600 3.625 3.650 3.675"
list="3.500 3.525 3.550 3.575 3.600 3.625 3.650 3.675"
name="Fqh_fromMeshfreq_"
dir=`pwd`
orderFit="2 3" 
c=0

#PARTIAL 3-10 only
#c=0; for i in {3..10}; do let c=c+1 ; cp full_ev_thermal/thermal_properties-$i.yaml thermal_properties-$c.yaml ; done



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
for i in $orderFit; do
  fqh.py -dfcc  -i Fqh_fromMeshfreq_* '-wqh'$i -p 100000
  mkdir order$i'ThermoAnalyze' 
  cp EVinet  order$i'ThermoAnalyze'/. 
  mv delta*dat Fqh_fromMeshfreq_Surface_$i*  order$i'ThermoAnalyze'/.
  cd order$i'ThermoAnalyze'
  getThermodynamics.sh 
  cd output_0.0001GPa/ && paste <(head *) <(tail *)
  cd $dir
  echo ***************************done order $orderFit *****************************
done
