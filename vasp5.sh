#!/bin/bash

var="ZrC.eam.alloy getdUdL.sh run.sh"
tim="28m"


echo 'copying run ZrC.eam.alloy, run.sh and getdUdL.sh to folders done-> grep to XXXXFOLDER 4.850Ang_[...]' && pwd &&
cp $var 4.850Ang_1900K/ &&
cp $var 4.850Ang_2500K/ &&
cp $var 4.850Ang_3200K/ &&
cp $var 4.850Ang_3805K/ &&
cp $var 4.850Ang_760K/ &&
echo 'finished copying run ZrC.eam.alloy, run.sh and getdUdL.sh to folders done-> grep to XXXXFOLDER 4.850Ang_[...]' && pwd &&



#dir=`pwd`
#cd $dir
dir="/workspace/tamellan/tom_harmonic_to_MEAM/test_EAM/"

cd $dir && echo 'at:' && pwd &&
cd 4.850Ang_1900K/ && echo 'Moved to first temp dir, now at' && pwd &&
./run.sh 
wait &&
sleep $tim
echo 'first sleep done, doing getdUdL' && ./getdUdL.sh wait && echo 'first done' && pwd ;

cd $dir && echo 'at: ' && pwd &&
cd 4.850Ang_2500K/ && echo 'Moved to second temp dir, now at ' && pwd &&
./run.sh 
wait &&
sleep $tim 
echo 'second sleep over...' && ./getdUdL.sh wait && echo 'second done' && pwd ;

cd $dir && echo $dir
cd 4.850Ang_3200K/ && echo 'Moved to third temp dir, now at ' && pwd &&
./run.sh 
wait &&
sleep $tim 
echo 'third sleep over...' && ./getdUdL.sh wait && echo 'third done' ;

cd $dir && echo $dir && echo 'Moved to fourth temp dir, now at ' && pwd &&
cd 4.850Ang_3805K/
./run.sh 
wait &&
sleep $tim 
echo 'fourth sleep over....' && ./getdUdL.sh  wait && echo 'fourth done' ;

cd $dir && echo $dir && echo 'Moved to fifth temp dir, now at ' && pwd &&
cd 4.850Ang_760K/ 
./run.sh 
wait &&
sleep $tim 
echo 'final sleep over' && ./getdUdL.sh wait && echo 'fifth and all done' ;

echo 'done XXXdone' && sleep 1


