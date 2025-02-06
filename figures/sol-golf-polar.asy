size(16cm);
usepackage("amsmath");

picture orig;
picture changed;

import graph;
xaxis(orig, "$x$", -2.3, 2.3, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis(orig, "$y$", -2.3, 2.3, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
xaxis(changed, "$x$", -2.3, 2.3, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);
yaxis(changed, "$y$", -2.3, 2.3, Ticks(Label(fontsize(9pt)), Step=1, begin=true, end=true), Arrows);

filldraw(orig, circle((1,0), 1), opacity(0.3)+cyan, blue);
pair A = (1.4, 0.2);
pair O = (0,0);
draw(orig, A--O, dashed);
dot(orig, "$(x,y)$", A, dir(90), deepgreen);
dot(orig, "$O=(0,0)$", O, dir(135), red);
label(orig, "$\mathcal{R}_1$", (1,1), dir(90), blue);

filldraw(changed, unitcircle, opacity(0.3)+cyan, blue);
pair P = (-3/5,-4/5);
pair B = rotate(180+degrees(P))*(0.4,0.2);
draw(changed, B--P, dashed);
dot(changed, "$(x,y)$", B, dir(-45), deepgreen);
dot(changed, "$P=(-\frac35,-\frac45)$", P, dir(225), red);
label(changed, "$\mathcal{R}_2$", dir(45), dir(45), blue);

label(orig, "$\sqrt{x^2+y^2}$", (0, 2.4), dir(90), deepgreen);
label(changed, "$\sqrt{\left(x+\frac35\right)^2+\left(y+\frac45\right)^2}$", (0, 2.4), dir(90), deepgreen);

add(orig);
add(shift(6,0)*changed);
