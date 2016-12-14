#!/bin/bash

   phonopy -d --dim="1 1 1" --pm
  
   mkdir disp-001 disp-002 disp-003 disp-004
   cp POSCAR-001 disp-001/POSCAR
   cp POSCAR-002 disp-002/POSCAR
   cp POSCAR-003 disp-003/POSCAR
   cp POSCAR-004 disp-004/POSCAR
