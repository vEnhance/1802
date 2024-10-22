// Draw axes
size(12cm);
import graph;
usepackage("amsmath");
xaxis("$x$", -2, 2, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -2, 2, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
real eps = 0.04;

draw((1-eps,1)--(-1,-(1-eps)), blue, EndArrow, Margins);
draw((-(1-eps),-1)--(1,1-eps), blue, EndArrow, Margins);

dot("$\mathbf{r}(0) = \mathbf{r}(2\pi) = (1,1)$", (1,1), dir(90), blue);
dot("$\mathbf{r}(\pi) = (-1,-1)$", (-1,-1), dir(270), blue);

dot("$\mathbf{r}(\frac{\pi}{6}) = (\frac{\sqrt3}2, \frac{\sqrt3}2)$", (0.836-eps, 0.836), dir(155), deepgreen);
dot("$\mathbf{r}(\frac{\pi}{3}) = (\frac12, \frac12)$", (1/2-eps, 1/2), dir(135), deepgreen);
dot("$\mathbf{r}(\frac{\pi}{2}) = (0,0)$", (-eps, 0), dir(135), deepgreen);
dot("$\mathbf{r}(\frac{3\pi}{4}) = (-\frac{\sqrt2}2, -\frac{\sqrt2}2)$", (-0.707-eps, -0.707), dir(135), deepgreen);
dot("$\mathbf{r}(\frac{5\pi}{4}) = (-\frac{\sqrt2}2, -\frac{\sqrt2}2)$", (-0.707, -0.707-eps), dir(315), deepgreen);
dot("$\mathbf{r}(\frac{4\pi}{3}) = (-\frac12, -\frac12)$", (-0.5, -0.5-eps), dir(315), deepgreen);
