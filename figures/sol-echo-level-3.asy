import graph;

size(15cm);

// Set up the range of the plot
real xmin = -3.4, xmax = 3.4;
real ymin = -3.4, ymax = 3.4;

xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

transform ss(real t) {
  return scale(sqrt(t));
}

draw(ss(3*pi/2)*unitcircle, red, "$c = -1$", align=W);

draw(ss(7*pi/6)*unitcircle, orange, "$c = -1/2$", align=W);
draw(ss(11*pi/6)*unitcircle, orange);
draw(ss(19*pi/6)*unitcircle, orange);

dot((0,0), deepgreen);
draw(ss(pi)*unitcircle, deepgreen, "$c = 0$", align=W);
draw(ss(2*pi)*unitcircle, deepgreen);
draw(ss(3*pi)*unitcircle, deepgreen);

draw(ss(pi/6)*unitcircle, blue, "$c = 1/2$", align=W);
draw(ss(5*pi/6)*unitcircle, blue);
draw(ss(13*pi/6)*unitcircle, blue);
draw(ss(17*pi/6)*unitcircle, blue);

draw(ss(pi/2)*unitcircle, purple, "$c=1$", align=W);
draw(ss(5*pi/2)*unitcircle, purple);

add(legend(),point(E),(20,0),UnFill);
