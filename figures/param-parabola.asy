size(14cm);
import graph;
xaxis("$x$", -3.5, 3.5, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis("$y$", -1.2, 2.8, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);
real f(real x) {
  return x*x / 10 + 1;
}
draw(graph(f, -2, 3), blue, EndArrow, Margins);
dot("Start: $(-2, 1.4)$", (-2, f(-2)), dir(90), blue);
dot("Stop: $(3, 1.9)$", (3, f(3)), dir(90), blue);
dot("$(-2, 1.4)$", (-1, f(1)), dir(225), deepcyan);
dot("$(0, 1)$", (0, f(0)), dir(315), deepcyan);
dot("$(1, 1.1)$", (1, f(1)), dir(90), deepcyan);
dot("$(2, 1.4)$", (2, f(2)), dir(315), deepcyan);
