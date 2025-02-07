size(11cm);
draw(unitcircle, grey);
picture sph;
picture cyl;

real k = 0.13;

pair O = (0,0);

pair A = dir(10);
pair B = dir(40);

filldraw(sph, shift(0,B.y)*scale(B.x,k)*unitcircle, grey, black+dashed);
filldraw(sph,
  shift(0,A.y)*scale(A.x,k)*arc(O,1,180,360)
  --arc(O,A,B)
  --shift(0,B.y)*scale(B.x,k)*arc(O,1,360,180)
  --arc(O,-conj(B),-conj(A))--cycle,
  cyan,
  blue + 1.1
);
draw(sph, shift(0,A.y)*scale(A.x,k)*arc(O,1,0,180), black+dashed);

pair C = (1, A.y);
pair D = (1, B.y);
draw(cyl, (-1,-1)--(-1,1), grey);
draw(cyl, (1,-1)--(1,1), grey);
draw(cyl, shift(0,1)*scale(1,k)*unitcircle, grey);
draw(cyl, shift(0,-1)*scale(1,k)*unitcircle, grey);
filldraw(cyl, shift(0,D.y)*scale(D.x,k)*unitcircle, grey, black+dashed);
filldraw(cyl,
  shift(0,C.y)*scale(C.x,k)*arc(O,1,180,360)
  --(C--D)
  --shift(0,D.y)*scale(D.x,k)*arc(O,1,360,180)
  --(-conj(D))--(-conj(C))--cycle,
  cyan,
  blue + 1.1
);
draw(cyl, shift(0,C.y)*scale(C.x,k)*arc(O,1,0,180), black+dashed);

add(sph);
add(shift(2.6,0)*cyl);

draw((-1.3, A.y)--(4.6, A.y), red);
draw((-1.3, B.y)--(4.6, B.y), red);
label("$z=a$", (4.6, A.y), dir(135), red);
label("$z=b$", (4.6, B.y), dir(135), red);
