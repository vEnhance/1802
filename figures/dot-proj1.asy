size(12cm);
import geometry;
pair foot(pair P, pair A, pair B) { return foot(triangle(A,B,P).VC); }
usepackage("amsmath");

import graph;
xaxis("$x$", -1.5, 4.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -1.5, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

pair v = (2,3);
pair w = (4,1);
pair O = (0,0);

draw(O--v, blue, EndArrow);
draw(O--w, red, EndArrow);
label("$\mathbf{w}$", w, dir(w), red);
label("$\mathbf{v}$", v, dir(v), blue);
pair P = foot(v,O,w);
draw(v--P, dashed);
markangle("$\theta < 90^{\circ}$", w, O, v, deepgreen);
markrightangle(v, P, O, black);
transform t = shift(dir(w)*dir(-90)*0.05);
draw(t*(O--P), purple+1.5, EndMargin);
draw(t*(O--P), purple, EndArrow);
label("$\operatorname{proj}_{\mathbf{w}}(\mathbf{v})$", t*P, dir(-45), purple);
