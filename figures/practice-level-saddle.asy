size(9cm);
import graph;
real M = 4.2*pi;
for (int i=-10; i<10; ++i) {
  real y = 1.5*pi + 2*pi*i;
  draw((-M,y-M)--(M,y+M), blue);
  draw((M,y-M)--(-M,y+M), blue);
}

xaxis("$x$", -M, M, Ticks(Label(fontsize(9pt)), Step=3, begin=true, end=true), Arrows);
yaxis("$y$", -M, M, Ticks(Label(fontsize(9pt)), Step=3, begin=true, end=true), Arrows);

dotfactor *= 1.5;
for (int i=-10; i<10; ++i) {
  for (int j=-10; j<10; ++j) {
    dot((2*pi*i,3*pi/2+2*pi*j), red);
    dot((2*pi*i+pi,pi/2+2*pi*j), red);
  }
}
clip(box((-M,-M),(M,M)));

dot("$(0, \frac{3\pi}{2})$", (0,3*pi/2), red);
dot("$(\pi, \frac{\pi}{2})$", (pi,pi/2), red);
