import graph;
size(14cm);
usepackage("amsmath");
for (int i=-2; i<=5; ++i) {
  draw((i,-5)--(i,1), grey+dotted);
}
for (int i=-5; i<=1; ++i) {
  draw((-2,i)--(5,i), grey+dotted);
}

xaxis("$x$", -2, 5, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -5, 1, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
draw(unitcircle, grey);

draw((0,0)--(3,-4), blue, EndArrow);
draw((0,0)--(3/5,-4/5), red+2.4);
draw((0,0)--(3/5,-4/5), red+1.4, EndArrow);
label("$\mathbf{v} = \begin{pmatrix} 3 \\ -4 \end{pmatrix}$", (3,-4), dir(270), blue);
label("Direction $\begin{pmatrix} 3/5 \\ -4/5 \end{pmatrix}$", (0.8,-1), dir(0), red);
label("Unit circle", dir(30), dir(0), grey);
