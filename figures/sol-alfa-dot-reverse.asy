size(12cm);
import graph;
import geometry;

xaxis("$x$", -2.5, 4.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -2.5, 4.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

pair O = (0,0);
draw(unitcircle, grey);

pair P = (3,4);
pair A = (1,0);
pair B = (-7/25, 24/25);
draw(O--P, blue+2, EndArrow(6));
draw(O--A, red+2, EndArrow(TeXHead, 2));
draw(O--B, red+2, EndArrow(TeXHead, 2));
label("$\langle 3,4 \rangle$", (3,4), dir(P), blue);
label("$\mathbf{v}_1$", A, dir(45), red);
label("$\mathbf{v}_2$", B, dir(90), red);

markangle(radius=16.0, "$\theta$", A, O, P, deepgreen);
markangle(radius=11.0, "$\theta$", P, O, B, deepgreen);
