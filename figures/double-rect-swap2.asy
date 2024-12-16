size(9cm);
usepackage("amsmath");

import graph;
xaxis("$x$", -0.8, 2.8, grey, Ticks(Label(grey+fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -0.5, 4.5, grey, Ticks(Label(grey+fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

real k = (37/3 * pi)**(0.2);

real f(real x) {
  return x*x;
}

fill(graph(f, 0, k)--(k,0)--(0,0)--cycle, opacity(0.3)+lightcyan);
draw("$\begin{aligned} \sqrt{y} &\le x \\ \iff x &\ge y^2 \end{aligned}$", graph(f, 0, k), dir(135), blue+1.5);
draw("$y \le 0$", (0,0)--(k,0), dir(315), deepgreen+1.5);
draw("$x \le k$", (k,k*k)--(k,0), dir(0), red+1.5);
dot("$(k,k^2)$", (k,k*k), dir(90), black);
dot("$(k,0)$", (k,0), dir(-45), black);
dot("$(0,0)$", (0,0), dir(-45), black);
