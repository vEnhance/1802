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
real tmax = 2.5 * pi;
real xmin = -1;
real xmax = tmax;
real ymin = -1;
real ymax = 3;
xaxis("$x$", xmin, xmax, Arrows);
yaxis("$y$", ymin, ymax, Arrows);

// Plot the cycloid
draw(graph(P, tmin, tmax), red, EndArrow);

filldraw(circle((0,1), 1), opacity(0.3)+lightcyan, blue);

draw((1.5,1)--(3.5,1), blue, EndArrow);
filldraw(circle((5,1), 1), opacity(0.3)+lightcyan, blue);

dotfactor *= 1.5;
draw((0,-0.1)--(5,-0.1), brown+1.5);
label("$L_{\text{tire track}}$ based on ground", (2.5,-0.1), dir(-90), brown);
draw(shift(5,1)*scale(1.1)*shift(-5,-1)*arc((5,1),P(5),(5,0)), deepblue+1.5);
label("$L_{\text{tire track}}$ based on wheel", (5,2.1), dir(90), deepblue);

dot(P(0), red);
dot(P(5), red);
dot((5,0), black);
