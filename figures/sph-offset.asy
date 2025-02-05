import geometry;
usepackage("amsmath");
usepackage("amssymb");

size(8cm);

pair O = (0,0);
pair A = (0,2);
pair M = (O+A)/2;
pair P = M + dir(35);

label("$x$", (-1,-0.3), dir(-90));
draw((-1,-0.3)--(1,0.3), Arrows);
filldraw(circle(M, 1), opacity(0.7)+lightgreen, darkgreen);
draw((0,-0.5)--(0,2.5), Arrows);
draw((-1.3,0)--(1.3,0), Arrows);
label("$y$", (1.3,0), dir(90));
label("$z$", (0,2.5), dir(90));
dot("$O=(0,0,0)$", (0,0), dir(315), brown);
dot("$(0,0,2)$", (0,2), dir(45));
draw(A--P);
draw(O--P, brown);
dot("$P$", P, dir(0));
markangle("$\varphi$", P, O, A, black);
markrightangle(A, P, O, black);
label(rotate(degrees(P)) * "$\rho = 2 \cos \varphi$", 0.6*P, dir(P)*dir(-90), brown);
dot("$(0,0,1)$", (0,1), dir(180));

label("$\mathcal{T}: x^2 + y^2 + (z-1)^2 \le 1$", (1,2.5), deepgreen);
