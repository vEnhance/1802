size(8cm);
import graph;
xaxis(-3.9, 3.9, Ticks(Label(fontsize(9pt)), Step=1), Arrows);
yaxis(-3.9, 3.9, Ticks(Label(fontsize(9pt)), Step=1), Arrows);

filldraw(circle((0,0), 3), opacity(0.1)+cyan, blue);
draw((0,0)--4*dir(60), blue, EndArrow);
draw((0,0)--4*dir(120), blue, EndArrow);
filldraw(arc((0,0),3,60,120)--(0,0)--cycle, opacity(0.4)+yellow, brown+1.8);
label("$y \ge \sqrt3x$", 4*dir(60), dir(60), darkblue);
label("$y \ge -\sqrt3x$", 4*dir(120), dir(120), darkblue);
label("$x^2+y^2 \le 9$", 3*dir(-60), dir(-60), darkblue);
