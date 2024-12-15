settings.render = 0;
settings.prc = false;

import three;
usepackage("amsmath");
usepackage("amssymb");

size(12cm);
currentprojection = perspective(7,-3.3,2);

draw((-14,0,0)--(11,0,0), Arrows3);
label("$+x$", (11,0,0), (0,1,0));
draw((0,-5,0)--(0,9,0), Arrows3);
label("$+y$", (0,9,0), (0,0,1));
draw((0,0,-5)--(0,0,7), Arrows3);
label("$+z$", (0,0,7), (0,0,1));

triple A = 1.2*(1,-4,3);
triple B = 1.2*(-7,-1,3);
triple C = -A;
triple D = -B;

for (int i=1; i<10; ++i) {
  real p = i / 10;
  real q = 1 - p;
  draw((p*A+q*B)--(p*D+q*C), lightcyan);
}
for (int i=1; i<20; ++i) {
  real p = i / 20;
  real q = 1 - p;
  draw((p*A+q*D)--(p*B+q*C), lightcyan);
}

path3 bdd = A--B--C--D--cycle;
surface plane = surface(bdd);
draw(plane, lightcyan + opacity(0.4));
draw(bdd, blue);

triple O = (0,0,0);
triple n = (1,2,3);
draw(O--n, red + 1.2, EndArrow3(6));
label("$\mathbf{n}$", n, dir(135), red);
triple v = (7,8,4);
draw(O--v, deepgreen + 1.2, EndArrow3(6));
label("$\mathbf{v}$", v, dir(v), deepgreen);

triple p = (38/14, 38/14*2, 38/14*3); // projection
triple q = v-p;
draw(v--p, purple, BeginMargin3);
draw(v--q, purple, BeginMargin3);
draw(n--p, red+dashed, Margins3);
dot(q, purple);
dot("$\operatorname{proj}_{\mathbf{n}}(\mathbf{v})$", p, dir(90), red);
label("$\operatorname{comp}_{\mathbf{n}}(\mathbf{v})$", midpoint(v--q), dir(315), purple);
draw(O--q, grey);
