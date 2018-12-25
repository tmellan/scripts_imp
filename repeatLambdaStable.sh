#!/bin/bash


if [ "$1" = "--help" ] || [ "$1" = "-h" ] ; then
  echo "Purpose:"
  echo "If a Langevin MD job has failed due to some numerical or physical instability,"
  echo "resubmit a population of 10 (default) reruns, optionally with more stable friction and timestep parameters"
  echo ""

  echo "Usage: "
  echo "repeatLambdaStable.sh arg1 arg2_optional arg3_optional"
  echo "arg1 = directory to repeat"
  echo "arg2_optional = Specify friction parameter e.g 0.1"
  echo "arg3_optional = Specify time-step e.g 0.5"
  echo "arg4_optional = Number of reruns (default=10)"
  exit 0
fi

argDir=$1
argGamma=$2
argPotim=$3
argNumber=$4

oldSeed=$(grep SEED $argDir/INCAR | grep -o '[0-9]*')
oldGamma=$(grep GAMMA_LD $argDir/INCAR)
oldGammaNumber=$(grep GAMMA_LD $argDir/INCAR | grep -o '[0-9]*')
oldPotim=$(grep POTIM $argDir/INCAR)
oldPotimNumber=$(grep POTIM $argDir/INCAR | grep -o '[0-9]*')
re='^[0-9]+$'
reDecimal='^[0-9]+([.][0-9]+)?$'
if [[ $argNumber =~ $re ]]; then n=$argNumber ; else n="10" ; fi

#echo "ParameterTest:"
#echo $oldSeed
#echo $oldGamma
#echo $oldPotim
#echo $argNumber
#echo "TestEnd"


dir=`pwd`
c=0
for i in $(seq 1 $n); do 
    let c=c+1
    if [ ! -d "r"$c"_"$argDir ]; then mkdir "r"$c"_"$argDir ; fi
    cp $argDir/* "r"$c"_"$argDir/.
    randomSeed=`date +%N | awk '{printf "%7d",$1%942438976}'`
    cd "r"$c"_"$argDir    

    sed -e 's|'$oldSeed'|'$randomSeed'|g' $dir/$argDir/INCAR > $dir/"r"$c"_"$argDir/INCAR

    if [[ $argGamma =~ $reDecimal ]]; then  
         newGamma=$(echo "GAMMA_LD = " $argGamma)
         sed -i 's|'"$oldGamma"'|'"$newGamma"'|g' $dir/"r"$c"_"$argDir/INCAR
         else 
         echo "Not changing friction parameter"
    fi

    if [[ $argPotim =~ $reDecimal ]]; then 
       newPotim=$(echo "POTIM = " $argPotim)
       sed -i 's|'"$oldPotim"'|'"$newPotim"'|g' INCAR
       else
       echo "Not changing timestep"
    fi

      echo ""
      pwd
      diff -y $dir/$argDir/INCAR $dir/"r"$c"_"$argDir/INCAR

      integrate_TU-TILD_SUPERFAST.x > 1.out &

    cd $dir
done

