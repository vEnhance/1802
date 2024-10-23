size(9cm);

import graph;
xaxis("$x$", -3, 3, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -2, 6, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
fill((2,4)--(-1,1)..(-0.5,0.25)..(0,0)..(0.5,0.25)..(1,1)..(2,4)--cycle, opacity(0.3)+yellow);

real f(real x) { return x*x; }
draw(graph(f, -2, 2.4), purple, Arrows, "$y=x^2$");
draw((-1.8,0.2)--(3,5), blue, Arrows, "$y-x=2$");

add(legend(), (4,3), UnFill);
dot("$(-1,1)$", (-1,1), dir(180));
dot("$(2,4)$", (2,4), dir(310));
dot((0,0));
label("$(0,0)$", (1.4,-1.4), grey);
dot((0,0));
draw((1.1,-1.1)--(0.2,-0.2), grey, EndArrow(TeXHead));
