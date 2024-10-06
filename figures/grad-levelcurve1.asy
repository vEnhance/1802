// Asymptote code for plotting level curves of f(x, y) = y - x^2
import graph;

size(8cm);

real fa(real x) { return x**2 - 2; }
real fb(real x) { return x**2 - 1; }
real fc(real x) { return x**2; }
real fd(real x) { return x**2 + 1; }
real fe(real x) { return x**2 + 2; }

// Set up the range of the plot
real xmin = -2, xmax = 2;
real ymin = -3, ymax = 7;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), step=1));
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), step=1));

draw(graph(fa, xmin, xmax, operator ..), red, "$c = -2$", align=W);
draw(graph(fb, xmin, xmax, operator ..), orange, "$c = -1$", align=W);
draw(graph(fc, xmin, xmax, operator ..), blue, "$c = 0$", align=W);
draw(graph(fd, xmin, xmax, operator ..), green, "$c = 1$", align=W);
draw(graph(fe, xmin, xmax, operator ..), purple, "$c = 2$", align=W);

add(legend(),point(E),(20,0),UnFill);
