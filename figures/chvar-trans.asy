unitsize(1.1cm);

import graph;
import chvar_base;
picture right_half = shift(0,7)*currentpicture;
currentpicture.erase();
add(right_half);

xaxis("$u = y/x$", -1, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$v = x y$", -1, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
fill(box((1/4, 16/25), (4,16/9)), opacity(0.3)+yellow);

draw((1/4,16/9)--(4,16/9), blue+1.5, "$v = 16 / 9$");
draw((1/4,16/25)--(4,16/25), deepcyan+1.5, "$v = 16 / 25$");
draw((4,16/25)--(4,16/9), orange+1.5, "$u = 4$");
draw((1/4,16/25)--(1/4,16/9), brown+1.5, "$u = \frac14$");
dotfactor *= 2;
dot("$(u,v)=(\frac14,\frac{16}{9})$", (1/4, 16/9), dir(45));
dot("$(u,v)=(\frac14,\frac{16}{25})$", (1/4, 16/25), dir(315));
dot("$(u,v)=(4,\frac{16}{9})$", (4, 16/9), dir(45));
dot("$(u,v)=(4,\frac{16}{25})$", (4, 16/25), dir(315));

add(legend(fontsize(9pt)), (6,8), UnFill);
draw("$\mathbf{T}(u,v)$", (2.7,3)--(2.7,6), dir(0), darkblue+fontsize(24pt)+1.8, EndArrow);
draw("$\mathbf{T}^{-1}(x,y)$", (2.1,6)--(2.1,3), dir(180), darkblue+fontsize(24pt)+1.8, EndArrow);
