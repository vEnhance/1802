// Asymptote code for plotting level curves of f(x, y) = x^2 + y^2
import graph;

size(10cm);

real f(real x, real y) {
  return x^2 + y^2;
}

// Set up the range of the plot
real xmin = -4, xmax = 4;
real ymin = -4, ymax = 4;

// Draw axes
xaxis("$x$", xmin, xmax, Ticks(Step=2, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Step=2, begin=false, end=false), Arrows);

// Plot the level curves for different values of c
draw(circle((0, 0), 0), purple, "$c = 0$");
dot((0,0), purple);
draw(circle((0, 0), 1), blue, "$c = 1$");
draw(circle((0, 0), 2), green, "$c = 4$");
draw(circle((0, 0), 3), red, "$c = 9$");

add(legend(),(7,1), UnFill);
