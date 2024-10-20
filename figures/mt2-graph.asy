import graph;
size(12cm);
usepackage("amsmath");
picture left_pic;
picture right_pic;

// Set up the range of the plot
real ymin = -3, ymax = 4;

xaxis(left_pic, "$x$", -4, 4, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis(left_pic, "$a(x)$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

xaxis(right_pic, "$y$", -3, 3, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);
yaxis(right_pic, "$b(y)$", ymin, ymax, Ticks(Label(fontsize(8pt)), Step=1, begin=false, end=false), Arrows);

real a(real x) { return cos(pi*x); }
real b(real y) { return y**4/4 - y**3/3 - y^2; }

draw(left_pic, graph(a, -3.8, 3.8, operator ..), red, Arrows);
draw(right_pic, graph(b, -2, 3, operator ..), blue, Arrows);
label(left_pic, "$\boxed{a(x) = \cos(\pi x)}$", (0,ymin), 3*dir(-90), red);
label(right_pic, "$\boxed{b(y) = \tfrac{y^4}{4} - \tfrac{y^3}{3} - y^2}$", (0,ymin), 3*dir(-90), blue);

draw(scale(2)*"$f = $", (-4.5,0), dir(180), deepgreen);
draw(scale(2)*"$+$", (5.5,0), deepgreen);

pen rs = red + fontsize(9pt);
dot(left_pic, (-3,-1), rs);
dot(left_pic, (-2,1), rs);
dot(left_pic, (-1,-1), rs);
dot(left_pic, (0,1), rs);
dot(left_pic, "$a(2)=1$", (2,a(2)), dir(105), rs);
dot(left_pic, "$a(1)=-1$", (1,a(1)), dir(-75), rs);
dot(left_pic, (3,-1), rs);

pen bs = blue + fontsize(9pt);
dot(right_pic, "$b(0)=0$", (0,0), 2*dir(50), bs);
dot(right_pic, "$b(2)=-\frac{8}{3}$", (2,-8/3), dir(-90), bs);
dot(right_pic, (-1,-5/12), bs);
label(right_pic, "$b(-1)=-\frac{5}{12}$", (-3,-2), bs);
draw(right_pic, (-3,-1.8)--(-1,-5/12), blue, EndArrow(TeXHead), Margins);

add(left_pic);
add(shift(10,0)*right_pic);
