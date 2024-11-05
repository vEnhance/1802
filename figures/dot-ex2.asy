size(16cm);
usepackage("amsmath");
import graph;
import geometry;

xaxis("$x$", -9, 9, Ticks(Label(fontsize(9pt)), Step=2, begin=true, end=true), Arrows);
yaxis("$y$", -5, 5, Ticks(Label(fontsize(9pt)), Step=2, begin=true, end=true), Arrows);

pair O = (0,0);
pair v = (1,2);
pair w = (-6,3);
draw((0,0)--v, blue, EndArrow);
draw((0,0)--w, blue, EndArrow);
markrightangle(v, O, w, deepgreen);

label("$\mathbf{v} = \begin{pmatrix} 1 \\ 2 \end{pmatrix}$", v, dir(v), blue);
label("$\mathbf{w} = \begin{pmatrix} -6 \\ 3 \end{pmatrix}$", w, dir(225), blue);
label("$|\mathbf{v}| = \sqrt5$", 0.7*v, dir(-45), black);
label("$|\mathbf{w}| = 3\sqrt5$", 0.7*w, dir(45), black);
