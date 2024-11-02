import graph;
size(8cm);
xaxis("$x$", -1.5, 1.5, Ticks(Label(fontsize(9pt)), Step=0.5, begin=false, end=false), Arrows);
yaxis("$y$", -1.5, 1.5, Ticks(Label(fontsize(9pt)), Step=0.5, begin=false, end=false), Arrows);

real eps = 0.05;
for (real x=-1.26; x<=1.26; x+=0.21) {
  for (real y=-1.26; y<=1.26; y+=0.21) {
    pair P = (x,y);
    draw(P -- (P + eps * (2*x+1,3*y)), rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}
draw(arc((0,0), 1, 0, 180), blue+1.2, EndArrow, Margins);
draw((1,0)--(-1,0), brown+1.2, EndArrow, Margins);
