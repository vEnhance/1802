import graph;

size(15cm);

real fa(real x) { return -2/x; }
real fb(real x) { return -1/x; }
// real fc(real x) { return -c*x; }
real fd(real x) { return 1/x; }
real fe(real x) { return 2/x; }

// Set up the range of the plot
real xmin = -4, xmax = 4;
real ymin = -4, ymax = 4;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

draw(graph(fa, -4, -1/2, operator ..), red, "$c = -2$", align=W);
draw(graph(fa, 1/2, 4, operator ..), red);
draw(graph(fb, -4, -1/4, operator ..), orange, "$c = -1$", align=W);
draw(graph(fb, 1/4, 4, operator ..), orange);

draw((xmin,0)--(xmax,0), deepgreen+1.3, "$c = 0$", align=W);
draw((0,ymin)--(0,ymax), deepgreen+1.3);

draw(graph(fd, -4, -1/4, operator ..), blue, "$c = 1$", align=W);
draw(graph(fd, 1/4, 4, operator ..), blue);
draw(graph(fe, -4, -1/2, operator ..), purple, "$c = 2$", align=W);
draw(graph(fe, 1/2, 4, operator ..), purple);

add(legend(),point(E),(20,0),UnFill);
