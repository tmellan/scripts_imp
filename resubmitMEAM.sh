#!/bin/bash

dir=`pwd`
for i in `echo *size`; do 
    cd $i
    if [ ! -d r1 ]; then mkdir r1; fi
    cp * r1/.
    cd r1
    sed -n '1,1p' ../fitdbse > fit.head.tmp_
    sed -n '2,32p' ../fitdbse > fit.force.tmp_
    sed -n '33,63p' ../fitdbse > fit.en.tmp_
    cat fit.head.tmp_ fit.en.tmp_ fit.force.tmp_ > fitdbse
    rm *.tmp_


    oldMaxFuncVals=$(grep MAXFUNCEVALS settings)
    sed -i 's|'"$oldMaxFuncVals"'|MAXFUNCEVALS=15000|g' settings
    oldOptFuncCG=$(grep OPTFUNCCG settings)
    sed -i 's|'"$oldOptFuncCG"'|OPTFUNCCG=1|g' settings
    echo "CONT=TRUE" >> settings
    cat settings
    MEAMfit_v2_25_9_18 > 1.out &
    cd $dir
done
