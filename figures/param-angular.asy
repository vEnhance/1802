size(10cm);
import graph;

pair O = (0,0);
xaxis("$x$", -1.7, 1.7, Arrows);
yaxis("$y$", -1.7, 1.7, Arrows);
draw(unitcircle);
pair P = dir(70);
draw(O--P, blue);
dot("$P$", P, dir(70), blue);

draw(arc(O, 1.2, 80, 115), darkred, EndArrow);
draw(arc(O, 1.2, 60, 25), darkred, EndArrow);
label("$+\omega$", 1.2*dir(95), dir(110), darkred);
label("$-\omega$", 1.2*dir(45), dir(45), darkred);

label("$\theta_0$", 0.35*dir(35), blue);
draw(arc(O, 0.2, 0, 70), blue);
