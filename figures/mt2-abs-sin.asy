import graph;
import math;

size(12cm);

// Define the function |sin(x)|
real f(real x) {
    return abs(sin(x));
}

// Set up the graph limits
real xmin = 0;
real xmax = 2 * pi;
real ymin = 0;
real ymax = 1.5;

// Draw the graph of |sin(x)|
draw(graph(f, xmin, xmax), blue+2bp);

// Fill the area under the curve
fill(graph(f, xmin, xmax)--(xmax, 0)--(xmin, 0)--cycle, lightcyan);

// Draw the x-axis and y-axis
xaxis("$t$", -0.2, 7.2);
yaxis("$\left|\sin t\right|$", ymin, ymax, Ticks(1.0));

// Add a title
label("$\int_0^{2\pi} \left|\sin t\right| \; \mathrm{d}t$", (xmax/2, ymax), dir(90), blue);

// Add dashed lines for pi and 2*pi
draw((pi, 0)--(pi, ymax), black+dashed);
draw((2*pi, 0)--(2*pi, ymax), black+dashed);
dot("$\pi$", (pi, 0), dir(-90));
dot("$2\pi$", (2*pi, 0), dir(-90));
