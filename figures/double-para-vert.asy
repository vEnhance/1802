size(13cm);

usepackage("amsmath");
import graph;
xaxis("$x$", -3, 3, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -2, 6, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);

real f(real x) { return x*x; }
draw(graph(f, -2, 2.4), purple+dashed);
draw((-1.8,0.2)--(3,5), blue+dashed);
for (real x=-0.8; x<=1.8; x+=0.17) {
  draw((x,x*x)--(x,2+x), green);
}

draw((-1,1)--(2,4), blue+1.5, Margins);
label("$\boxed{y \le x+2}$", (1,4.3), blue);
draw(graph(f,-1,2), purple+1.5, Margins);
label("$\boxed{y \ge x^2}$", (2,1.3), purple);

dot((0,0));
dot("$(-1,1)$", (-1,1), dir(180));
dot("$(2,4)$", (2,4), dir(310));
label("$(0,0)$", (1.4,-1.4), grey);
draw((1.1,-1.1)--(0.2,-0.2), grey, EndArrow(TeXHead));
