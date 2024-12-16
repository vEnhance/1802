size(9cm);
import graph;
real M = 4.2*pi;

xaxis("$x$", -M, M, Ticks(Label(fontsize(9pt)), Step=3, begin=true, end=true), Arrows);
yaxis("$y$", -M, M, Ticks(Label(fontsize(9pt)), Step=3, begin=true, end=true), Arrows);

dotfactor *= 1.5;
for (int i=-10; i<10; ++i) {
  for (int j=-10; j<10; ++j) {
    dot((2*pi*i, 2*pi*j+pi/2), deepgreen);
  }
}
clip(box((-M,-M),(M,M)));

dot("$(0, \frac{\pi}{2})$", (0,pi/2), deepgreen);
dot("$(2\pi, -\frac{3\pi}{2})$", (2*pi,-3*pi/2), deepgreen);
