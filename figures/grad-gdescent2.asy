import graph;
size(12cm);
xaxis("$x$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);

draw(scale(5)*unitcircle, blue);
real eps = 1.8;
pair P = (3,4);
pair P1 = (3+eps,4);
label("Level curve $f(x,y) = \frac{1}{x^2+y^2} = \frac{1}{25}$", 5*dir(-71), dir(-71), blue);
draw(P--0.8*P, deepgreen+1.2, EndArrow);
label("$\nabla f(P) = \langle -\frac{6}{625}, -\frac{8}{625} \rangle$", 0.8*P, -dir(P), deepgreen);
real s = 5;
draw((P+s*dir(90)*dir(P))--(P+s*dir(-90)*dir(P)), purple + dashed, Arrows);
label("Tangent line to level curve", P+s*dir(90)*dir(P), dir(90), purple);
dot("$P = (3,4)$", P, dir(30), red);
