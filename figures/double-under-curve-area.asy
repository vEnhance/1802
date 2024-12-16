import graph;
unitsize(0.5cm, 0.05cm);
xaxis("$x$", -2, 11, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", -20, 100, Ticks(Label(fontsize(9pt)), Step=20, begin=false, end=false), Arrows);

real f(real x) {
  return x*x;
}
fill(graph(f, 0, 10)--(10,0)--(0,0)--cycle, opacity(0.3)+palered);
draw(graph(f, 0, 10), red, EndArrow, EndMargin, "$y=x^2$");
draw((10,100)--(10,0), red+dashed);
dot("$(10,100)$", (10,100), dir(0), red);
dot((0,0), red);

add(legend(fontsize(9pt)), (1.5,90), UnFill);
