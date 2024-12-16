size(9cm);
import graph;
xaxis("$x$", -0.8, 2.8, grey, Ticks(Label(grey+fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -0.5, 1.5, grey, Ticks(Label(grey+fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

fill((0,0)--(2,1)--(0,1)--cycle, opacity(0.3)+lightcyan);
draw("$x/2 \le y \iff x \le 2y$", (0,0)--(2,1), dir(315), blue+1.5);

draw("$y \le 1$", (2,1)--(0,1), dir(90), deepgreen+1.5);
draw("$x \ge 0$", (0,0)--(0,1), dir(180), red+1.5);
dot("$(2,1)$", (2,1), dir(90));
dot("$(0,1)$", (0,1), dir(45));
dot("$(0,0)$", (0,0), dir(-45));
