size(7cm);

import graph;
xaxis("$x$", -2.8, 2.8, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -2.8, 2.8, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

pair O = (0,0);

draw(circle((0,0), 2), red);
label("$x^2+y^2=4$", 2*dir(50), dir(50), red);
pair P = (1.2, -1.6);
draw(O--P, blue, EndArrow, Margins);
real r = 1.3;
draw((P+dir(90)*r*P)--(P-dir(90)*r*P), deepgreen, Arrows);
dot("$(1.2, -1.6)$", P, dir(P));
