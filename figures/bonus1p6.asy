size(12cm);
draw(unitcircle, lightblue);
draw((-1.3,0)--(1.3,0), Arrows);
draw((0,-1.3)--(0,1.3), Arrows);
label("Re", (1.3,0), dir(-90));
label("Im", (0,1.3), dir(180));

pair O = (0,0);
pair A = dir(16.73);
pair B = A*dir(120);
pair C = B*dir(120);
draw(O--A, blue, EndArrow);
draw(O--B, blue, EndArrow);
draw(O--C, blue, EndArrow);
draw(A--B--C--cycle, lightblue);
label("$\sqrt[6]{61}$", midpoint(O--A), dir(A)*dir(90), blue);
label("$\sqrt[6]{61}$", midpoint(O--B), dir(B)*dir(90), blue);
label("$\sqrt[6]{61}$", midpoint(O--C), dir(C)*dir(90), blue);
