import graph;
size(8cm);
xaxis("$x$", -1.5, 1.5, Ticks(Label(fontsize(9pt)), Step=0.5, begin=false, end=false), Arrows);
yaxis("$y$", -1.2, 1.2, Ticks(Label(fontsize(9pt)), Step=0.5, begin=true, end=true), Arrows);

pen arrpen = rgb(0.6, 0.6, 0.9);

real eps = 0.15;
for (real x=-1.26; x<=1.26; x+=0.21) {
  for (real y=-1.05; y<=1.05; y+=0.21) {
    pair P = (x,y);
    pair v = (abs(y)**(2/3),0);
    if (abs(v) > 0.01) {
      draw(P -- (P + eps * v), arrpen, EndArrow(TeXHead));
    } else {
      dot(P, arrpen);
    }
  }
}
real f(real x) {
  return x*x;
}
draw(graph(f, -1, 1), purple+1.5, Margins);
draw(graph(f, -1, 1), purple, EndArrow, Margins);
dot("$(-1,1)$", (-1, 1), 2*dir(90), purple);
dot("$(1,1)$", (1, 1), 2*dir(90), purple);
