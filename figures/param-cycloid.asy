import graph;
import math;
usepackage("amsmath");

size(14cm);

// Define the parametric equations for the cycloid
pair P(real t) {
    return (t - sin(t), 1 - cos(t));
}

// Set up the graph
real tmin = 0;
real tmax = 5 * pi;
real xmin = -1;
real xmax = tmax;
real ymin = -1;
real ymax = 3;

// Plot the cycloid
draw(graph(P, tmin, tmax), red, EndArrow);

filldraw(circle((0,1), 1), opacity(0.3)+lightcyan, blue);

draw((1.5,1)--(3.5,1), blue, EndArrow);
filldraw(circle((5,1), 1), opacity(0.3)+lightcyan, blue);

draw((7,1)--(9,1), blue, EndArrow);
filldraw(circle((10.3,1), 1), opacity(0.3)+lightcyan, blue);

dotfactor *= 1.5;

dot(P(0), red);
dot(P(5), red);
dot(P(10.3), red);

// Add labels for the axes
xaxis("$x$", xmin, xmax, Arrows);
yaxis("$y$", ymin, ymax, Arrows);
