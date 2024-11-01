size(10cm);
import graph;
xaxis("$x$", -0.5, 10, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -0.5, 3, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);

real f(real x) {
  return (x**0.5+1)**0.5;
}
filldraw(graph(f,0,9)--(9,1)--(0,1)--cycle, paleblue, blue);
filldraw(box((0,0), (9,1)), palecyan, blue);
draw(graph(f, 0, 10), red+1.3);
draw(graph(f, 0, 10), red, EndArrow);
label("$y \le \sqrt{\sqrt{x}+1}$", (4, f(4)), dir(90), red);
dotfactor *= 2;
dot("$(9,2)$", (9,2), 1.2*dir(130), red);
dot("$(0,1)$", (0,1), 1.4*dir(225), red);
