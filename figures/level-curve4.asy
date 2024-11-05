// Asymptote code for plotting level curves of f(x, y) = x^2 + y^2
import graph;

size(14cm);

real f(real x, real y) {
  return x^2 + y^2;
}

// Set up the range of the plot
real xmin = -4, xmax = 4;
real ymin = -4, ymax = 4;

// Draw axes
xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);

// Plot the level curves for different values of c
draw(circle((0, 0), 0), purple, "$c = 0$");
dot((0,0), purple);
draw((1,0)--(0,1)--(-1,0)--(0,-1)--cycle, blue, "$c = 1$");
draw((2,0)--(0,2)--(-2,0)--(0,-2)--cycle, green, "$c = 2$");
draw((3,0)--(0,3)--(-3,0)--(0,-3)--cycle, red, "$c = 3$");

add(legend(),(7,1), UnFill);
