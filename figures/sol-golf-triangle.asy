size(10cm);

import graph;
xaxis("$x$", -0.8, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -0.8, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

fill((0,0)--(2,1)--(1,2)--cycle, paleyellow);
draw((-0.3,3.3)--(3.3,-0.3), red, Arrows);
draw((-0.6,0.6)--(0.6,-0.6), red, Arrows);
draw((0,0)--(2.8,1.4), blue, EndArrow);
draw((0,0)--(1.4,2.8), blue, EndArrow);
label("$x+y=0$", (0.6,-0.6), dir(0), red);
label("$x+y=3$", (2.8,0.4), dir(0), red);
label("$y=2x$", (1.4,2.8), dir(45), blue);
label("$y=x/2$", (2.8,1.4), dir(45), blue);
dot("$(0,0)$", (0,0), dir(225));
dot("$(2,1)$", (2,1), dir(-20));
dot("$(1,2)$", (1,2), dir(0));
