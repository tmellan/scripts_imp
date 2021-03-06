#!/bin/bash

var="ZrC.eam.alloy getdUdL.sh run.sh"
tim="26m"

#cp ZrC.eam.alloy 4.685Ang_1900K/ &&
#cp ZrC.eam.alloy 4.685Ang_2500K/ && 
#cp ZrC.eam.alloy 4.685Ang_3200K/ &&
#cp ZrC.eam.alloy 4.685Ang_3805K/ && 
#cp ZrC.eam.alloy 4.685Ang_760K/ &&

#cp ZrC.eam.alloy 4.730Ang_1900K/ &&
#cp ZrC.eam.alloy 4.730Ang_2500K/ &&
#cp ZrC.eam.alloy 4.730Ang_3200K/ && 
#cp ZrC.eam.alloy 4.730Ang_3805K/ &&
#cp ZrC.eam.alloy 4.730Ang_760K/ &&

#cp $var 4.759Ang_1900K/ &&
#cp $var 4.759Ang_2500K/ && 
#cp $var 4.759Ang_3200K/ &&
#cp $var 4.759Ang_3805K/ &&
#cp $var 4.759Ang_760K/ &&
#echo 'copying run ZrC.eam.alloy, run.sh and getdUdL.sh to folders done'

cp $var 4.801Ang_1900K/ &&
cp $var 4.801Ang_2500K/ &&
cp $var 4.801Ang_3200K/ &&
cp $var 4.801Ang_3805K/ &&
cp $var 4.801Ang_760K/ &&
echo "starting to wait" && 
#sleep 150m
echo "finished sleeping" &&
echo 'copying run ZrC.eam.alloy, run.sh and getdUdL.sh to folders done-> grep to XXXXFOLDER 4.801Ang_[...]'
#cp $var 4.850Ang_1900K/ &&
#cp $var 4.850Ang_2500K/ &&
#cp $var 4.850Ang_3200K/ &&
#cp $var 4.850Ang_3805K/ &&
#cp $var 4.850Ang_760K/ &&

#cd 4.685Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_2500K/ &&
#cd ../4.685Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_3200K/ &&
#cd ../4.685Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_3805K/ &&
#cd ../4.685Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_760K/ &&
#cd ../4.685Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_1900K/ &&
#
#cd ../4.730Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_2500K/ &&
#cd ../4.730Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_3200K/ &&
#cd ../4.730Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_3805K/ &&
#cd ../4.730Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_760K/ &&
#cd ../4.730Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_1900K/ &&
#





#dir=`pwd`
#cd $dir
dir="/workspace/tamellan/tom_harmonic_to_MEAM/test_EAM/"

cd $dir && echo $dir
cd 4.801Ang_1900K/ && echo 'Moved to first temp dir, now at' && pwd &&
./run.sh 
wait &&
sleep $tim
echo 'first sleep done, doing getdUdL' && ./getdUdL.sh wait && echo 'first done' ;

cd $dir && echo $dir
cd 4.801Ang_2500K/ && echo 'Moved to second temp dir, now at ' && pwd &&
./run.sh 
wait &&
sleep $tim 
echo 'second sleep over...' && ./getdUdL.sh wait && echo 'second done' ;

cd $dir && echo $dir
cd 4.801Ang_3200K/ && echo 'Moved to third temp dir, now at ' && pwd &&
./run.sh 
wait &&
sleep $tim 
echo 'third sleep over...' && ./getdUdL.sh wait && echo 'third done' ;

cd $dir && echo $dir && echo 'Moved to fourth temp dir, now at ' && pwd &&
cd 4.801Ang_3805K/
./run.sh 
wait &&
sleep $tim 
echo 'fourth sleep over....' && ./getdUdL.sh  wait && echo 'fourth done' ;

cd $dir && echo $dir && echo 'Moved to fifth temp dir, now at ' && pwd &&
cd 4.801Ang_760K/ 
./run.sh 
wait &&
sleep $tim 
echo 'final sleep over' && ./getdUdL.sh wait && echo 'fifth and all done' ;

echo 'done XXXdone' && sleep 1

#
#cd ../4.801Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_2500K/ &&
#cd ../4.801Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_3200K/ &&
#cd ../4.801Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_3805K/ &&
#cd ../4.801Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_760K/ &&
#cd ../4.801Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_1900K/ &&
#
#cd /4.850Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_2500K/ &&
#cd ../4.850Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_3200K/ &&
#cd ../4.850Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_3805K/ &&
#cd ../4.850Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_760K/ &&
#cd ../4.850Ang_760K/ && ./run.sh && ./getdUdL.sh







#cd ../4.730Ang_2500K/
#./run.sh
#./getdUdL.sh
#cd ../4.730Ang_3200K/
#./run.sh
#./getdUdL.sh
#cd ../4.730Ang_3805K/
#./run.sh
#./getdUdL.sh
#cd ../4.730Ang_760K/
#./run.sh
#./getdUdL.sh
#cd ../4.759Ang_1900K/
#./run.sh
#./getdUdL.sh
#cd ../4.759Ang_2500K/
#./run.sh
#./getdUdL.sh
#cd ../4.759Ang_3200K/
#./run.sh
#./getdUdL.sh
#cd ../4.759Ang_3805K/
#./run.sh
#./getdUdL.sh
#cd ../4.759Ang_760K/
#./run.sh
#./getdUdL.sh
#cd ../4.801Ang_1900K/
#./run.sh
#./getdUdL.sh
#cd ../4.801Ang_2500K/
#./run.sh
#./getdUdL.sh
#cd ../4.801Ang_3200K/
#./run.sh
#./getdUdL.sh
#cd ../4.801Ang_3805K/
#./run.sh
#./getdUdL.sh
#cd ../4.801Ang_760K/
#./run.sh
#./getdUdL.sh
#cd ../4.850Ang_1900K/
#./run.sh
#./getdUdL.sh
#cd ../4.850Ang_2500K/
#./run.sh
#./getdUdL.sh
#cd ../4.850Ang_3200K/
#./run.sh
#./getdUdL.sh
#cd ../4.850Ang_3805K/
#./run.sh
#./getdUdL.sh
#cd ../4.850Ang_760K/

