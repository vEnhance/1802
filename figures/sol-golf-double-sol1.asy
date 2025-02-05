size(8cm);
import graph;
xaxis("$x$", -0.3, 1.3, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);
yaxis("$y$", -0.3, 1.3, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);

real f(real x) {
  return x**(1/2);
}
real g(real x) {
  return x**3;
}
fill(graph(f,0,1)--reverse(graph(g,0,1))--cycle, opacity(0.3)+yellow);
draw(graph(f, 0, 1.3), red, EndArrow);
draw(graph(g, 0, 1.1), blue, EndArrow);
dot("$(1,1)$", (1,1), dir(315));
dot("$(0,0)$", (0,0), dir(315));
label("$y = \sqrt x$", (1.3, f(1.3)), dir(85), red);
label("$y = x^3$", (1.1, g(1.1)), dir(180), blue);
