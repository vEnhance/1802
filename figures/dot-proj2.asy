size(8cm);
import geometry;
pair foot(pair P, pair A, pair B) { return foot(triangle(A,B,P).VC); }
usepackage("amsmath");

import graph;
xaxis("$x$", -3.5, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -2.5, 4.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

pair v = (-3,4);
pair w = (3,1);
pair O = (0,0);

draw(O--v, blue, EndArrow);
draw(O--w, red, EndArrow);
label("$\mathbf{w}$", w, dir(w), red);
label("$\mathbf{v}$", v, dir(v), blue);
pair P = foot(v,O,w);
draw(v--P, dashed);
markangle(w, O, v, deepgreen);
label("$\theta > 90^{\circ}$", 1.4*dir(40), deepgreen);
markrightangle(v, P, O, black);
transform t = shift((0,0));
draw(t*(O--P), purple+1.5, EndMargin);
draw(t*(O--P), purple, EndArrow);
label("$\operatorname{proj}_{\mathbf{w}}(\mathbf{v})$", t*P, dir(255), purple);
