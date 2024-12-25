import geometry;
usepackage("amsmath");
usepackage("amssymb");
pair foot(pair P, pair A, pair B) { return foot(triangle(A,B,P).VC); }

size(16cm);
pair U = (5.6,4.8);

pair V = (3,5);
pair O = (0,0);
pair X = (3,0);
pair Y = (0,5);

pair P_1 = foot(X, O, U);
pair P_2 = foot(Y, O, U);
pair Q = foot(V, O, U);

pair ZO = (4,1);
pair ZX = ZO+0.3*(U.x,0);
pair ZY = ZX+0.3*(0,U.y);

/*
fill(O--X--P_1--cycle, paleyellow);
filldraw(ZO--ZX--ZY--cycle, paleyellow, deepgreen);
label("$\lvert \mathbf{u} \rvert = 1$", midpoint(ZO--ZY), dir(135), deepgreen);
draw("$a$", midpoint(ZO--ZX), dir(-90), deepgreen);
draw("$b$", midpoint(ZX--ZY), dir(0), deepgreen);
*/

draw(O--U, deepgreen+1.3, EndArrow);
draw(O--V, blue+1.3, EndArrow);
draw(Y--O--X, black, Arrows);
draw(Y--V--X);
label("$\mathbf{0}$", (0,0), dir(225));
label("$\mathbf{v} = \left< x,y \right>$", V, dir(V), blue);
label("$\mathbf{u} = \left< a,b \right>$", U, dir(90), deepgreen);
label("Assume $\lvert \mathbf{u} \rvert = 1$", U-(0,0.8), dir(-90), deepgreen);
label("$x \mathbf{e}_1$", X, dir(-90));
label("$y \mathbf{e}_2$", Y, dir(180));
draw(X--P_1, red);
draw(Y--P_2, red);
draw(V--Q, red);
dot("$xa \mathbf{u}$", P_1, dir(P_1-X));
dot("$yb \mathbf{u}$", P_2, dir(-60));
dot("$(xa+yb) \mathbf{u}$", Q, dir(Q-V));
