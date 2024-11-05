import graph;

size(8cm);

// Define the function with critical points
real f(real x) {
  return x**3 + 2*x**4/3 - 2*x**5/7 - x**6/5;
}

// Set up the range for x and y
real xmin = -2, xmax = 1.9;
real ymin = -1.5, ymax = 3;

// Draw the axes
xaxis("$x$", xmin, xmax, Arrows);
yaxis("$y$", ymin, ymax, Arrows);

// Plot the function
draw(graph(f, xmin, xmax), red, Arrows);

// Labels for critical points
real x1 = -1.6043;
real x2 = -1.05843;
real x3 = 0;
real x4 = 1.4723;

dot("Local max", (x1, f(x1)), 2*dir(90), blue);
dot("Local min", (x2, f(x2)), dir(-90), deepgreen);
dot("Infl point", (x3, f(x3)), dir(315), orange);
dot("Global max", (x4, f(x4)), dir(90), purple);

label("$f(x)=-\frac15x^6-\frac27x^5+\frac23x^4+x^3$", (0,ymin), dir(-90), red);
