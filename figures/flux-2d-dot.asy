size(7cm);

usepackage("amsmath");
import graph;
xaxis("$x$", -0.8, 0.8, grey, Arrows);
yaxis("$y$", -0.7, 0.7, grey, Arrows);
real w = 0.7;

for (int i=0; i<5; ++i) {
  for (int j=0; j<4; ++j) {
    draw(
      shift(-0.9*w,-0.6*w)*((0.4*i*w,0.45*j*w)--(0.4*i*w+0.2,0.45*j*w-0.15)),
      rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}

pair A = (-0.5,0.445);
pair B = (-0.08,-0.095);
pair C = (0.4,0.585);
pair D = (0.3,0.68);
pair E = (-0.2,0.4);
draw(A..B..C..C..D..E..A, purple+1.4, EndMargin);
draw(A..B..C..C..D..E..A, purple, EndArrow, EndMargin);
dotfactor *= 2;

pair X = B+0.35*dir(-2);
pair Y = B+1.08*(0.2, -0.15);
pair Z = B+0.35*dir(-92);
draw(B--X, grey, EndArrow);
draw(B--X, grey + 1.4, Margins);
draw(B--Z, black, EndArrow);
draw(B--Z, black + 1.4, Margins);
draw(B--Y, deepgreen + 1.2, EndArrow(TeXHead));
dot(B, blue);
label("$\boxed{\mathbf{r}'(t)}$", X, dir(10), grey);
label("$\boxed{\mathbf{n}(t)}$", Z, dir(-110), black);
label("$\boxed{\mathbf{F}(\mathbf{r}(t))}$", Y, dir(-65), deepgreen);
