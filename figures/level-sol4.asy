// Asymptote code for plotting level curves of f(x, y) = y - x^2
import graph;

size(12cm);

real fa(real x) { return x**2 - 2; }
real fb(real x) { return x**2 - 1; }
real fc(real x) { return x**2; }
real fd(real x) { return x**2 + 1; }
real fe(real x) { return x**2 + 2; }

// Set up the range of the plot
real xmin = -2, xmax = 2;
real ymin = -3, ymax = 7;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

draw(graph(fa, xmin, xmax, operator ..), red, "$c = e^{-2}$", align=W);
draw(graph(fb, xmin, xmax, operator ..), orange, "$c = 1/e$", align=W);
draw(graph(fc, xmin, xmax, operator ..), deepgreen, "$c = 1$", align=W);
draw(graph(fd, xmin, xmax, operator ..), blue, "$c = e$", align=W);
draw(graph(fe, xmin, xmax, operator ..), purple, "$c = e^2$", align=W);

add(legend(),point(E),(20,0),UnFill);
