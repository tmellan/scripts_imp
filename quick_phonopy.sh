#!/bin/bash

  cp SP/POSCAR .
  phonopy -d --dim="1 1 1" --pm
  phonopy -f disp-001/vasprun.xml disp-002/vasprun.xml disp-003/vasprun.xml disp-004/vasprun.xml 
  phonopy -t mesh.conf 
  cp ../../mesh.conf .
  phonopy -t mesh.conf
