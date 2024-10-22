size(10cm);

usepackage("amsmath");
import graph;
xaxis("$x$", -3, 3, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -2, 6, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);

real f(real x) { return x*x; }
draw(graph(f, -2, 2.4), purple+dashed);
draw((-1.8,0.2)--(3,5), blue+dashed);

for (real y=0.2; y<=3.8; y+=0.17) {
  if (y <= 1) {
    draw((-y**0.5,y)--(y**0.5,y), green);
  } else {
    draw((y-2,y)--(y**0.5,y), deepgreen);
  }
}

draw((-1,1)--(2,4), blue+1.5, Margins);
label("$\boxed{x \ge y-2}$", (1,4.3), blue);
draw(graph(f,0,2), purple+1.5, Margins);
label("$\boxed{x \le \sqrt y}$", (2.5,1.8), purple);
draw(graph(f,-1,0), red+1.5, Margins);
label("$\boxed{x \ge -\sqrt y}$", (-1.5,-1), red);
draw((-1.5, -0.6)--(-0.8,0.5), grey, EndArrow(TeXHead));

dot("$(-1,1)$", (-1,1), dir(180));
dot("$(2,4)$", (2,4), dir(310));
draw((1.1,-1.1)--(0.2,-0.2), grey, EndArrow(TeXHead));
dot("$(1,1)$", (1,1), dir(0));
draw((-1,1)--(1,1), black+1.2);
label("$(0,0)$", (1.4,-1.4), grey);
dot((0,0));
