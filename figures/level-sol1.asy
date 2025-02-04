import graph;

size(9cm);

real c = 3/2;

real fa(real x) { return -c*x - 2; }
real fb(real x) { return -c*x - 1; }
real fc(real x) { return -c*x; }
real fd(real x) { return -c*x + 1; }
real fe(real x) { return -c*x + 2; }

// Set up the range of the plot
real xmin = -2, xmax = 2;
real ymin = -5, ymax = 5;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

draw(graph(fa, xmin, xmax, operator ..), red, "$c = -2$", align=W);
draw(graph(fb, xmin, xmax, operator ..), orange, "$c = -1$", align=W);
draw(graph(fc, xmin, xmax, operator ..), deepgreen, "$c = 0$", align=W);
draw(graph(fd, xmin, xmax, operator ..), blue, "$c = 1$", align=W);
draw(graph(fe, xmin, xmax, operator ..), purple, "$c = 2$", align=W);

add(legend(),point(E),(20,0),UnFill);
