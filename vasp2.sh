#!/bin/bash

cp ZrC.eam.alloy 4.685Ang_1900K/ &&
cp ZrC.eam.alloy 4.685Ang_2500K/ && 
cp ZrC.eam.alloy 4.685Ang_3200K/ &&
cp ZrC.eam.alloy 4.685Ang_3805K/ && 
cp ZrC.eam.alloy 4.685Ang_760K/ &&

cp ZrC.eam.alloy 4.730Ang_1900K/ &&
cp ZrC.eam.alloy 4.730Ang_2500K/ &&
cp ZrC.eam.alloy 4.730Ang_3200K/ && 
cp ZrC.eam.alloy 4.730Ang_3805K/ &&
cp ZrC.eam.alloy 4.730Ang_760K/ &&

cp ZrC.eam.alloy 4.759Ang_1900K/ &&
cp ZrC.eam.alloy 4.759Ang_2500K/ && 
cp ZrC.eam.alloy 4.759Ang_3200K/ &&
cp ZrC.eam.alloy 4.759Ang_3805K/ &&
cp ZrC.eam.alloy 4.759Ang_760K/ &&

cp ZrC.eam.alloy 4.801Ang_1900K/ &&
cp ZrC.eam.alloy 4.801Ang_2500K/ &&
cp ZrC.eam.alloy 4.801Ang_3200K/ &&
cp ZrC.eam.alloy 4.801Ang_3805K/ &&
cp ZrC.eam.alloy 4.801Ang_760K/ &&

cp ZrC.eam.alloy 4.850Ang_1900K/ &&
cp ZrC.eam.alloy 4.850Ang_2500K/ &&
cp ZrC.eam.alloy 4.850Ang_3200K/ &&
cp ZrC.eam.alloy 4.850Ang_3805K/ &&
cp ZrC.eam.alloy 4.850Ang_760K/ &&

cd 4.685Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_2500K/ &&
cd ../4.685Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_3200K/ &&
cd ../4.685Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_3805K/ &&
cd ../4.685Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.685Ang_760K/ &&
cd ../4.685Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_1900K/ &&

cd ../4.730Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_2500K/ &&
cd ../4.730Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_3200K/ &&
cd ../4.730Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_3805K/ &&
cd ../4.730Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.730Ang_760K/ &&
cd ../4.730Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_1900K/ &&

cd ../4.759Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_2500K/ &&
cd ../4.759Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_3200K/ &&
cd ../4.759Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_3805K/ &&
cd ../4.759Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.759Ang_760K/ &&
cd ../4.759Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_1900K/ &&

cd ../4.801Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_2500K/ &&
cd ../4.801Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_3200K/ &&
cd ../4.801Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_3805K/ &&
cd ../4.801Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.801Ang_760K/ &&
cd ../4.801Ang_760K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_1900K/ &&

cd ../4.850Ang_1900K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_2500K/ &&
cd ../4.850Ang_2500K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_3200K/ &&
cd ../4.850Ang_3200K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_3805K/ &&
cd ../4.850Ang_3805K/ && ./run.sh && ./getdUdL.sh && cp run.sh getdUdL.sh ../4.850Ang_760K/ &&
cd ../4.850Ang_760K/ && ./run.sh && ./getdUdL.sh







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

