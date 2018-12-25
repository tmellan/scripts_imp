#!/bin/bash

dir=`pwd`

for j in {1..3}; do
  for i in `echo *size`; do 
      cd $i
      if [ ! -d best$j ]; then mkdir best$j; fi
      cp * best$j/.
      cd best$j

     sed -n '1,1p' ../fitdbse > fit.head.tmp_
     sed -n '2,32p' ../fitdbse > fit.force.tmp_
     sed -n '33,63p' ../fitdbse > fit.en.tmp_
     cat fit.head.tmp_ fit.en.tmp_ fit.force.tmp_ > fitdbse
     rm *.tmp_

      oldMaxFuncVals=$(grep MAXFUNCEVALS settings)
      sed -i 's|'"$oldMaxFuncVals"'|MAXFUNCEVALS=15000|g' settings
#    oldOptFuncCG=$(grep OPTFUNCCG settings)
#    sed -i 's|'"$oldOptFuncCG"'|OPTFUNCCG=1|g' settings
      echo "  POTFILEIN=potparas_best"$j >> settings
      echo ""
      cat settings
      nice -5  MEAMfit_v2_25_9_18 > 1.out &
      cd $dir
  done
done
