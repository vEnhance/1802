import graph;
unitsize(0.9cm);
usepackage("amsmath");

pen arrpen = rgb(0.6, 0.6, 0.9);

picture vf(Label L, pair F(pair P)) {
  picture pic;
  xaxis(pic, "$x$", -4, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
  yaxis(pic, "$y$", -4, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);

  real eps = 0.3;
  for (real x=-3; x<=3; x+=1) {
    for (real y=-3; y<=3; y+=1) {
      pair P = (x,y);
      pair v = F(P);
      if (abs(v) > 0.01) {
        draw(pic, P -- (P + eps * v), arrpen, EndArrow(TeXHead));
      } else {
        dot(pic, P, arrpen);
      }
    }
  }
  label(pic, L, (0,-4), dir(-90), blue);
  return pic;
}
draw(unitsquare, opacity(0));
