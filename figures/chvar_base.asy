import graph;
xaxis("$x$", -1, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -1, 4, Ticks(Label(fontsize(9pt)), Step=1, begin=false, end=false), Arrows);


real f9(real x) { return 16/(9*x); }
real f25(real x) { return 16/(25*x); }
fill((2/5,8/5)--(2/3,8/3)..graph(f9,2/3,8/3)..(8/3,2/3)--(8/5,2/5)..graph(f25,8/5,2/5)..cycle, opacity(0.3)+yellow);

draw(graph(f9, 0.5, 3.5), blue, Arrows, "$x y = 16 / 9$");
draw(graph(f25, 0.2, 3.5), deepcyan, Arrows, "$x y = 16 / 25$");
draw((0,0)--(1,4), orange, EndArrow, "$y = 4x$");
draw((0,0)--(4,1), brown, EndArrow, "$y = \frac14 x$");

dot("$(\frac85, \frac25)$", (8/5, 2/5), dir(90));
dot("$(\frac25, \frac85)$", (2/5, 8/5), dir(0));
dot("$(\frac83, \frac23)$", (8/3, 2/3), dir(90));
dot("$(\frac23, \frac83)$", (2/3, 8/3), dir(0));
