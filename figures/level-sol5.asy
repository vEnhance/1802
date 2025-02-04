// Asymptote code for plotting level curves of f(x, y) = y - x^2
import graph;

size(12cm);

// Set up the range of the plot
real xmin = -3, xmax = 3;
real ymin = -3, ymax = 3;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

draw((xmin,-2)--(-2,-2)--(-2,ymin), red, "$c = -2$", align=W);
draw((xmin,-1)--(-1,-1)--(-1,ymin), orange, "$c = -1$", align=W);
draw((xmin,0)--(0,0)--(0,ymin), deepgreen+1.3, "$c = 0$", align=W);
draw((xmin,1)--(1,1)--(1,ymin), blue, "$c = 1$", align=W);
draw((xmin,2)--(2,2)--(2,ymin), purple, "$c = 2$", align=W);

add(legend(),point(E),(20,0),UnFill);
