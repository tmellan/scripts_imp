module load openmpi/64/intel/1.6.0
module load intel-suite
module load vasp
ls -d */*/* | grep 'Ang' > list

FILES=*/*/*

echo "Starting vasp jobs" > logfile
for f in $FILES
do
   echo "Entering directory "$f
   echo "Entering directory "$f >> logfile
   cd $f
   echo "Running vasp (mpirun -np 16 vasp)"
   echo "Running vasp (mpirun -np 16 vasp)" >> ../../../logfile
   #mpirun -np 16 vasp
   echo "Finished vasp"
   echo
   cd ../../../
   echo "Finished vasp" >> logfile
   echo >> logfile
done
