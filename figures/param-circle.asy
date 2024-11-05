size(6cm);
import graph;
xaxis("$x$", -1.6, 1.6, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);
yaxis("$y$", -1.6, 1.6, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);

draw(unitcircle, grey + dashed);
dot("$(-1,0)$", dir(270), dir(225), blue);
dot("$(\frac12,\frac{\sqrt3}{2})$", dir(390), dir(395), blue);
draw(arc((0,0), 1, 270, 390), blue+1.2, Margin(1,1.5));
draw(arc((0,0), 1, 270, 390), blue, EndArrow, Margin(1,1));
