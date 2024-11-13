size(11cm);
usepackage("amsmath");
import graph;
import geometry;

xaxis("$x$", -12.5, 12.5, Ticks(Label(fontsize(9pt)), Step=5, begin=true, end=true), Arrows);
yaxis("$y$", -12.5, 12.5, Ticks(Label(fontsize(9pt)), Step=5, begin=true, end=true), Arrows);

pair O = (0,0);
pair v = (-5,5*3**0.5);
pair w = (7*3**0.5,-7);
draw((0,0)--v, blue, EndArrow);
draw((0,0)--w, blue, EndArrow);
markangle("$30^{\circ}$", dir(90), O, v, deepgreen);
markangle("$30^{\circ}$", w, O, dir(0), deepgreen);
markrightangle(dir(0), O, dir(90), deepgreen);

label("$\mathbf{v} = \begin{pmatrix} -5 \\ 5\sqrt3 \end{pmatrix}$", v, dir(225), blue);
label("$\mathbf{w} = \begin{pmatrix} 7\sqrt3 \\ -7 \end{pmatrix}$", w, dir(225), blue);
label("$|\mathbf{v}| = 10$", midpoint(O--v), dir(225), black);
label("$|\mathbf{w}| = 14$", midpoint(O--w), dir(225), black);
