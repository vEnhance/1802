import graph;
size(10cm);
draw(scale(5)*unitcircle, red+dashed);
draw(scale(2.3)*unitcircle, red+dashed);
xaxis("$x$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);
yaxis("$y$", -6, 6, Ticks(Label(fontsize(9pt)), Step=2, begin=false, end=false), Arrows);

pair D = 4.97*dir(50);
pair A = 3*dir(78);
pair B = 2.4*dir(45);
pair C = 3.1*dir(30);
draw(D..A..B..C..cycle, blue+1);
pair P = 5*dir(53);
dot("$P$", P, dir(P), deepgreen);
pair Q = 2.3*dir(56);
dot("$Q$", Q, dir(-Q), deepgreen);
label("$g(x,y) = c$", 3.7*dir(54), blue);
