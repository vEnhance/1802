size(7cm);

import graph;
xaxis("$x$", -1.6, 1.6, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -1.3, 0.6, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

real f(real x) {
  return x*x-1;
}
filldraw(graph(f, -1, 1)--cycle, opacity(0.1)+green, deepgreen+1.3);
dot("$(1,0)$", (1,0), dir(90), deepgreen);
dot("$(-1,0)$", (-1,0), dir(90), deepgreen);
label("$y=x^2-1$", (0.5,f(0.5)), dir(-45), deepgreen);
