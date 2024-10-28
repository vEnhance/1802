size(12cm);

real M = 3.9;
for (int t=-3; t<=3; ++t) {
if (t!=0) {
  draw((M,t)--(-M,t), grey+dashed);
  draw((t,M)--(t,-M), grey+dashed);
}
}

draw(unitcircle, black+1);
draw((-M,0)--(M,0), black+1, Arrows);
draw((0,-M)--(0,M), black+1, Arrows);
label("Re", (M,0), dir(-90));
label("Im", (0,M), dir(180));

pair O = (0,0);
pair A = 3*dir(18);
pair B = A*dir(72);
pair C = B*dir(72);
pair D = C*dir(72);
pair E = D*dir(72);
draw(O--A, blue+1.4);
draw(O--B, blue+1.4);
draw(O--C, blue+1.4);
draw(O--D, blue+1.4);
draw(O--E, blue+1.4);
dotfactor *= 3;
dot(A, blue);
dot(B, blue);
dot(C, blue);
dot(D, blue);
dot(E, blue);

label("$z_1 = 3 (\cos(18^\circ) + i \sin (18^\circ))$",  A, dir(90), blue);
label("$z_2 = 3 (\cos(90^\circ) + i \sin (90^\circ)) = 3i$",  B, dir(45), blue);
label("$z_3 = 3 (\cos(162^\circ) + i \sin (162^\circ))$",  C, dir(90), blue);
label("$z_4 = 3 (\cos(234^\circ) + i \sin (234^\circ))$",  D, dir(252), blue);
label("$z_5 = 3 (\cos(306^\circ) + i \sin (306^\circ))$",  E, dir(288), blue);
