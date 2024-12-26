import three;
import math;
usepackage("amsmath");
usepackage("amssymb");

settings.render = 0;
settings.prc = false;

size(9cm);
currentprojection = perspective(1,1,1);

draw(surface(unitsphere), palegreen);
triple O = (0,0,0);
real r = 1;

draw(arc(O, r, -25, 0, 125, 0), red + 1);
draw(arc(O, r, -25, 60, 135, 60), red + 1);
draw(arc(O, r, -50, 120, 100, 120), red + 1);

draw(arc((0,0,Cos( 36)), Sin( 36), 90, -70, 90, 155, Z), blue + 1);
draw(arc((0,0,Cos( 72)), Sin( 72), 90, -50, 90, 135, Z), blue + 1);
draw(arc((0,0,Cos(108)), Sin(108), 90, -20, 90, 115, Z), blue + 1);

real h = 2.4;
draw((-h,0,0)--(h,0,0), Arrows3);
label("$+x$", (h,0,0), (0,1,0));
draw((0,-h,0)--(0,h,0), Arrows3);
label("$+y$", (0,h,0), (0,0,1));
draw((0,0,-h)--(0,0,0.6*h), Arrows3);
label("$+z$", (0,0,0.6*h), (0,0,1));
