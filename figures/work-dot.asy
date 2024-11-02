size(7cm);

import graph;
xaxis("$x$", -0.8, 0.8, Arrows);
yaxis("$y$", -0.7, 0.7, Arrows);
real w = 0.7;

for (int i=0; i<5; ++i) {
  for (int j=0; j<4; ++j) {
    draw(
      shift(-0.9*w,-0.6*w)*((0.4*i*w,0.45*j*w)--(0.4*i*w+0.2,0.45*j*w-0.15)),
      rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}

pair A = (-0.7*w,-0.4*w);
pair B = (-0.2*w,0.5*w);
pair C = (0.6*w,0.55*w);
draw(A..B..C, purple+1.4);
dotfactor *= 2;
dot("Start", A, dir(-90), purple);
dot("Stop", C, dir(-20), purple);

pair X = B+0.7*dir(30);
pair Y = B+(0.2, -0.15);
draw(B--X, blue + 1, EndArrow);
draw(B--Y, deepgreen + 1.2, EndArrow(TeXHead));
dot(B, blue);
label("$\mathbf{r}'(t)$", X, dir(X-B), blue);
label("$\mathbf{F}(\mathbf{r}(t))$", Y, dir(45), deepgreen);
