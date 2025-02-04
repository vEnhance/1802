import graph;

size(10cm);

real f(real x, real y) {
  return x^2 + y^2;
}

// Set up the range of the plot
real xmin = -4, xmax = 4;
real ymin = -4, ymax = 4;

// Draw axes
xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);

draw(circle((0, 0), 0), grey, "$c = 0$");
dot((0,0), grey);
draw(circle((0, 0), 1), red, "$c = 1$");
draw(circle((0, 0), 2), deepgreen, "$c = 4$");
draw(circle((0, 0), 3), blue, "$c = 9$");

add(legend(),(7,1), UnFill);
