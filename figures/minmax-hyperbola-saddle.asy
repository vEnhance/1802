import graph;
usepackage("amsmath");
size(16cm);

// Set up the range of the plot
real xmin = -1.7, xmax = 1.7;
real ymin = -1.7, ymax = 1.7;
// Draw axes
xaxis("$x$", xmin, xmax, Arrows);
yaxis("$y$", ymin, ymax, Arrows);

pair O = (0,0);
draw(arc(O, 1, -45, 45), deepgreen);
draw(arc(O, 1, 135, 225), deepgreen);
draw(arc(O, 1, 45, 135), red);
draw(arc(O, 1, 225, 315), red);

draw((-1.4,-1.4)--(1.4,1.4), paleblue);
draw((-1.4,1.4)--(1.4,-1.4), paleblue);

draw(O--dir(0), deepgreen+1, EndArrow, Margins);
dot("$f(0.1, 0) = 0.01$", dir(0), dir(45), deepgreen);
draw(O--dir(180), deepgreen+1, EndArrow, Margins);
dot("$f(-0.1, 0) = 0.01$", dir(180), dir(135), deepgreen);

draw(O--dir(45), blue+1, EndArrow, Margins);
dot("$f(0.0707, 0.0707) = 0$", dir(45), dir(0), blue);

draw(O--dir(90), red+1, EndArrow, Margins);
dot("$f(0, 0.1) = -0.01$", dir(90), dir(45), red);
draw(O--dir(-90), red+1, EndArrow, Margins);
dot("$f(0, -0.1) = -0.01$", dir(270), dir(315), red);

dot(dir(135), blue);
dot(dir(225), blue);
dot(dir(315), blue);

draw(O--(-0.6,0.8), red+1, EndArrow, Margins);
dot("$f(-0.06, 0.08) = -0.0028$", (-0.6,0.8), dir(130), red);

draw(O--(-0.8,-0.6), deepgreen+1, EndArrow, Margins);
dot(minipage("$f(-0.08, -0.06)$ \\ $ \; = 0.0028$", 3cm), (-0.8,-0.6), dir(200), deepgreen);

dot(O);
label("$\boxed{f(x,y) = x^2-y^2}$", (-1.2, 1.6));
