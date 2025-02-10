size(7cm);

import graph;
xaxis("$x$", -1.6, 1.6, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -1.3, 0.6, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

real f(real x) {
  return x*x-1;
}
draw(graph(f, -1, 1), blue+1, EndArrow(6), Margins);
draw((1,0)--(-1,0), red+1, EndArrow(6), Margins);
dot("$(1,0)$", (1,0), dir(90));
dot("$(-1,0)$", (-1,0), dir(90));
label("$y=x^2-1$", (0.5,f(0.5)), dir(-45), blue);
label("$\mathcal{C}_1$", (-0.5,f(-0.5)), dir(225), blue);
label("$\mathcal{C}_2$", (0.3,0), dir(90), red);
