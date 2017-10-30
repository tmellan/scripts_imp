dim=192;
hesseMEAMraw=ReadList["new_HesseMEAM_raw",Table["Number",{i,1,192}]];
hesseDFT=ReadList["original_HesseMatrix_sphinx_DFT",Table["Number",{i,1,192}]];

hesseMEAMref=ReadList["../MEAM_HesseMatrix.PERF.46583",Table["Number",{i,1,192}]];
hesseDFTref=ReadList["../dft.46583.HesseMat",Table["Number",{i,1,192}]];

shiftzr=1.0*(hesseDFTref[[1]][[1]]/hesseMEAMref[[1]][[1]]);
shiftc=1.0*(hesseDFTref[[-1]][[-1]]/hesseMEAMref[[-1]][[-1]]);
shiftzrc=0.5*(shiftzr+shiftc)
Print@shiftzr
Print@shiftc
Print@shiftzrc

zrScale=(1.0*hesseDFT[[1]][[1]]/hesseMEAMraw[[1]][[1]]);
cScale=(1.0*hesseDFT[[-1]][[-1]]/hesseMEAMraw[[-1]][[-1]]);
zrcScale=0.5*(zrScale+cScale);
Print@zrScale
Print@cScale
Print@zrcScale

top=Table[Join[hesseMEAMraw[[i]][[1;;dim/2]]*zrScale/shiftzr, hesseMEAMraw[[i]][[dim/2+1;;dim]]*zrcScale/shiftzrc],{i,1,dim/2}];
Print@top[[1]][[1]]
bottom=Table[Join[hesseMEAMraw[[i]][[1;;dim/2]]*zrcScale/shiftzrc, hesseMEAMraw[[i]][[dim/2+1;;dim]]*cScale/shiftc],{i,dim/2+1,dim}];
Print@bottom[[1]][[1]]
hesse2=Join[top,bottom];

Export["2_HesseMatrix_sphinx.dat",hesse2]

