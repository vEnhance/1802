size(10cm);

real e = exp(1);
real k = (e-1)**2;

import graph;
xaxis("$x$", -0.5, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -0.5, 1.9, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=true), Arrows);

real f(real x) {
  return log(x**0.5+1);
}
filldraw(graph(f,0,k)--(k,0)--(0,0)--cycle, lightcyan, blue);
draw(graph(f, 0, 4), red+1.3);
draw(graph(f, 0, 4), red, EndArrow);
label("$y \le \log(\sqrt{x}+1)$", (1, f(1)), 3*dir(90), red);
dotfactor *= 2;
dot("$((e-1)^2,1)$", (k,1), 1.2*dir(80), red);
dot("$(0,0)$", (0,0), 1.4*dir(225), red);
