size(5cm);
import graph;
xaxis("$x$", -1, 6, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -1, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);

filldraw(box((0,0), (5,3)), opacity(0.5)+cyan, blue+1.5);
