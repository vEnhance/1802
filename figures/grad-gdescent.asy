import graph;
size(14cm);
xaxis("$x$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);

draw(scale(5)*unitcircle, blue);
real eps = 1.8;
pair P = (3,4);
pair P1 = (3+eps,4);
draw(circle(P, abs(P-P1)), black);
label("Level curve $f(x,y) = x^2+y^2=25$", 5*dir(-71), dir(-71), blue);
draw(P--1.9*P, deepgreen+1.2, EndArrow);
label("$\nabla f(P) = \langle 6,8 \rangle$", 1.9*P, dir(P), deepgreen);
real s = 5;
draw((P+s*dir(90)*dir(P))--(P+s*dir(-90)*dir(P)), purple + dashed, Arrows);
label("Tangent line to level curve", P+s*dir(90)*dir(P), dir(90), purple);
label("$\mathbf{v}$", midpoint(P--P1), dir(70));
dot("$P + \mathbf{v}$", (3+eps, 4), dir(315), red);

draw(P--P1, black, EndArrow(TeXHead), Margins);

dot("$P = (3,4)$", P, dir(210), red);
