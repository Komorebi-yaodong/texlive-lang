%Premier ensemble de mosaique
pair A[],O;
path Bc[];
picture MosaiqueUn[];

for k=1 upto 8:
  A1=u*(0,0);
  A3-A1=u*(1,0);
  A2=iso(A1,A3);
  A5=rotation(A1,A3,-90);
  A4=iso(A3,A5);
  A7-A5=A1-A3;
  A6=iso(A5,A7);
  A8=iso(A7,A1);
  O=iso(A1,A5);
endfor;

A9=A1;

for k=1 upto 8:
  Bc[k]=polygone(A[k],A[k+1],O);
endfor;

MosaiqueUn[0]=image(
    drawoptions(withcolor gris);
  for j=1 upto 4:
    trace segment(A[j],A[j+4]);
  endfor;
  drawoptions();
  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
  );

for l=1 upto 8:
  MosaiqueUn[l]=image(
      remplis Bc[l];
    drawoptions(withcolor gris);
    for j=1 upto 4:
      trace segment(A[j],A[j+4]);
    endfor;
    drawoptions();
    trace polygone(A1,A3,A5,A7) withcolor 0.5white;
    );
endfor;

p:=8;

for l=1 upto 7:
  for k=l+1 upto 8:
    p:=p+1;
    MosaiqueUn[p]=image(
	remplis Bc[l] withcolor noir;
      remplis Bc[k] withcolor noir;
      drawoptions(withcolor gris);
      for j=1 upto 4:
	trace segment(A[j],A[j+4]);
      endfor;
      drawoptions();
      trace polygone(A1,A3,A5,A7) withcolor 0.5white;
      );
  endfor;
endfor;

for l=1 upto 6:
  for k=l+1 upto 7:
    for m=k+1 upto 8:
      p:=p+1;
      MosaiqueUn[p]=image(
	  remplis Bc[l] withcolor noir;
	remplis Bc[k] withcolor noir;
	remplis Bc[m] withcolor noir;
	drawoptions(withcolor gris);
	for j=1 upto 4:
	  trace segment(A[j],A[j+4]);
	endfor;
	drawoptions();
	trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	);
    endfor;
  endfor;
endfor;

for l=1 upto 5:
  for k=l+1 upto 6:
    for m=k+1 upto 7:
      for n=m+1 upto 8:
	p:=p+1;
	MosaiqueUn[p]=image(
	    remplis Bc[l] withcolor noir;
	  remplis Bc[k] withcolor noir;
	  remplis Bc[m] withcolor noir;
	  remplis Bc[n] withcolor noir;
	  drawoptions(withcolor gris);
	  for j=1 upto 4:
	    trace segment(A[j],A[j+4]);
	  endfor;
	  drawoptions();
	  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	  );
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 4:
  for k=l+1 upto 5:
    for m=k+1 upto 6:
      for n=m+1 upto 7:
	for o=n+1 upto 8:
	  p:=p+1;
	  MosaiqueUn[p]=image(
	      remplis Bc[l] withcolor noir;
	    remplis Bc[k] withcolor noir;
	    remplis Bc[m] withcolor noir;
	    remplis Bc[n] withcolor noir;
	    remplis Bc[o] withcolor noir;
	    drawoptions(withcolor gris);
	    for j=1 upto 4:
	      trace segment(A[j],A[j+4]);
	    endfor;
	    drawoptions();
	    trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	    );
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 3:
  for k=l+1 upto 4:
    for m=k+1 upto 5:
      for n=m+1 upto 6:
	for o=n+1 upto 7:
	  for r=o+1 upto 8:
	    p:=p+1;
	    MosaiqueUn[p]=image(
		remplis Bc[l] withcolor noir;
	      remplis Bc[k] withcolor noir;
	      remplis Bc[m] withcolor noir;
	      remplis Bc[n] withcolor noir;
	      remplis Bc[o] withcolor noir;
	      remplis Bc[r] withcolor noir;
	      drawoptions(withcolor gris);
	      for j=1 upto 4:
		trace segment(A[j],A[j+4]);
	      endfor;
	      drawoptions();
	      trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	      );
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 2:
  for k=l+1 upto 3:
    for m=k+1 upto 4:
      for n=m+1 upto 5:
	for o=n+1 upto 6:
	  for r=o+1 upto 7:
	    for s=r+1 upto 8:
	      p:=p+1;
	      MosaiqueUn[p]=image(
		  remplis Bc[l] withcolor noir;
		remplis Bc[k] withcolor noir;
		remplis Bc[m] withcolor noir;
		remplis Bc[n] withcolor noir;
		remplis Bc[o] withcolor noir;
		remplis Bc[r] withcolor noir;
		remplis Bc[s] withcolor noir;
		drawoptions(withcolor gris);
		for j=1 upto 4:
		  trace segment(A[j],A[j+4]);
		endfor;
		drawoptions();
		trace polygone(A1,A3,A5,A7) withcolor 0.5white;
		);
	    endfor;
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 1:
  for k=l+1 upto 2:
    for m=k+1 upto 3:
      for n=m+1 upto 4:
	for o=n+1 upto 5:
	  for r=o+1 upto 6:
	    for s=r+1 upto 7:
	      for t=s+1 upto 8:
		p:=p+1;
		MosaiqueUn[p]=image(
		    remplis Bc[l] withcolor noir;
		  remplis Bc[k] withcolor noir;
		  remplis Bc[m] withcolor noir;
		  remplis Bc[n] withcolor noir;
		  remplis Bc[o] withcolor noir;
		  remplis Bc[r] withcolor noir;
		  remplis Bc[s] withcolor noir;
		  remplis Bc[t] withcolor noir;
		  drawoptions(withcolor gris);
		  for j=1 upto 4:
		    trace segment(A[j],A[j+4]);
		  endfor;
		  drawoptions();
		  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
		  );
	      endfor;
	    endfor;
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

% Deuxième jeu de mosaique
pair A[],O;
path Bc[];
picture MosaiqueDeux[];

for k=1 upto 8:
  A1=u*(0,0);
  A3-A1=u*(1,0);
  A2=iso(A1,A3);
  A5=rotation(A1,A3,-90);
  A4=iso(A3,A5);
  A7-A5=A1-A3;
  A6=iso(A5,A7);
  A8=iso(A7,A1);
  O=iso(A1,A5);
endfor;

A9=A1;

Bc[1]=polygone(A[1],A[2],A[8]);
Bc[2]=polygone(A[8],A[2],O);
Bc[3]=polygone(A[4],A[2],O);
Bc[4]=polygone(A[3],A[2],A[4]);
Bc[5]=polygone(A[5],A[4],A[6]);
Bc[6]=polygone(A[4],A[6],O);
Bc[7]=polygone(A[6],A[8],O);
Bc[8]=polygone(A[6],A[7],A[8]);

MosaiqueDeux[0]=image(
    drawoptions(withcolor gris);
  trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
  drawoptions();
  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
  );

for l=1 upto 8:
  MosaiqueDeux[l]=image(
      remplis Bc[l];
    drawoptions(withcolor gris);
    trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
    drawoptions();
    trace polygone(A1,A3,A5,A7) withcolor 0.5white;
    );
endfor;

p:=8;

for l=1 upto 7:
  for k=l+1 upto 8:
    p:=p+1;
    MosaiqueDeux[p]=image(
	remplis Bc[l] withcolor noir;
      remplis Bc[k] withcolor noir;
      drawoptions(withcolor gris);
      trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
      drawoptions();
      trace polygone(A1,A3,A5,A7) withcolor 0.5white;
      );
  endfor;
endfor;

for l=1 upto 6:
  for k=l+1 upto 7:
    for m=k+1 upto 8:
      p:=p+1;
      MosaiqueDeux[p]=image(
	  remplis Bc[l] withcolor noir;
	remplis Bc[k] withcolor noir;
	remplis Bc[m] withcolor noir;
	drawoptions(withcolor gris);
	trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
	drawoptions();
	trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	);
    endfor;
  endfor;
endfor;

for l=1 upto 5:
  for k=l+1 upto 6:
    for m=k+1 upto 7:
      for n=m+1 upto 8:
	p:=p+1;
	MosaiqueDeux[p]=image(
	    remplis Bc[l] withcolor noir;
	  remplis Bc[k] withcolor noir;
	  remplis Bc[m] withcolor noir;
	  remplis Bc[n] withcolor noir;
	  drawoptions(withcolor gris);
trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
	  drawoptions();
	  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	  );
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 4:
  for k=l+1 upto 5:
    for m=k+1 upto 6:
      for n=m+1 upto 7:
	for o=n+1 upto 8:
	  p:=p+1;
	  MosaiqueDeux[p]=image(
	      remplis Bc[l] withcolor noir;
	    remplis Bc[k] withcolor noir;
	    remplis Bc[m] withcolor noir;
	    remplis Bc[n] withcolor noir;
	    remplis Bc[o] withcolor noir;
	    drawoptions(withcolor gris);
trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
	    drawoptions();
	    trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	    );
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 3:
  for k=l+1 upto 4:
    for m=k+1 upto 5:
      for n=m+1 upto 6:
	for o=n+1 upto 7:
	  for r=o+1 upto 8:
	    p:=p+1;
	    MosaiqueDeux[p]=image(
		remplis Bc[l] withcolor noir;
	      remplis Bc[k] withcolor noir;
	      remplis Bc[m] withcolor noir;
	      remplis Bc[n] withcolor noir;
	      remplis Bc[o] withcolor noir;
	      remplis Bc[r] withcolor noir;
	      drawoptions(withcolor gris);
trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
	      drawoptions();
	      trace polygone(A1,A3,A5,A7) withcolor 0.5white;
	      );
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 2:
  for k=l+1 upto 3:
    for m=k+1 upto 4:
      for n=m+1 upto 5:
	for o=n+1 upto 6:
	  for r=o+1 upto 7:
	    for s=r+1 upto 8:
	      p:=p+1;
	      MosaiqueDeux[p]=image(
		  remplis Bc[l] withcolor noir;
		remplis Bc[k] withcolor noir;
		remplis Bc[m] withcolor noir;
		remplis Bc[n] withcolor noir;
		remplis Bc[o] withcolor noir;
		remplis Bc[r] withcolor noir;
		remplis Bc[s] withcolor noir;
		drawoptions(withcolor gris);
trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
		drawoptions();
		trace polygone(A1,A3,A5,A7) withcolor 0.5white;
		);
	    endfor;
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;

for l=1 upto 1:
  for k=l+1 upto 2:
    for m=k+1 upto 3:
      for n=m+1 upto 4:
	for o=n+1 upto 5:
	  for r=o+1 upto 6:
	    for s=r+1 upto 7:
	      for t=s+1 upto 8:
		p:=p+1;
		MosaiqueDeux[p]=image(
		    remplis Bc[l] withcolor noir;
		  remplis Bc[k] withcolor noir;
		  remplis Bc[m] withcolor noir;
		  remplis Bc[n] withcolor noir;
		  remplis Bc[o] withcolor noir;
		  remplis Bc[r] withcolor noir;
		  remplis Bc[s] withcolor noir;
		  remplis Bc[t] withcolor noir;
		  drawoptions(withcolor gris);
		  trace polygone(A2,A4,A6,A8);
  trace segment(A8,A4);
  trace segment(A6,A2);
		  drawoptions();
		  trace polygone(A1,A3,A5,A7) withcolor 0.5white;
		  );
	      endfor;
	    endfor;
	  endfor;
	endfor;
      endfor;
    endfor;
  endfor;
endfor;
