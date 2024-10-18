// Draw axes
size(8cm);
import graph;
usepackage("amsmath");
xaxis("$x$", -2, 2, Ticks(Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -2, 2, Ticks(Step=1, begin=false, end=false), Arrows);

dot("$\mathbf{r}(0) = \mathbf{r}(2\pi) = \begin{pmatrix} 1 \\ 1 \end{pmatrix}$", (1,1), dir(90), blue);
dot("$\mathbf{r}(\pi) = \begin{pmatrix} -1 \\ -1 \end{pmatrix}$", (-1,-1), dir(270), blue);

real eps = 0.04;
draw((1-eps,1)--(-1,-(1-eps)), blue, EndArrow, Margins);
draw((-(1-eps),-1)--(1,1-eps), blue, EndArrow, Margins);
