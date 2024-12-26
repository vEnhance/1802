size(16cm);
pair O = (0,0);
pair X = 2*dir(220);
pair Y = 2*dir(350);
pair Z = 1.7*dir(90);
draw(O--X, EndArrow);
draw(O--Y, EndArrow);
draw(O--Z, EndArrow);
pair A = 0.8*X;
pair B = 0.7*Y;
pair C = 0.6*Z;
filldraw(O--A--B--cycle, yellow, darkblue);
label(scale(1,0.7)*rotate(-25)*"$\mathcal{R}$", (0.1,-0.3), brown);

filldraw(A--B--C--cycle, opacity(0.3)+lightgreen, deepgreen);
dot("$(6,0,0)$", A, dir(330));
dot("$(0,3,0)$", B, dir(40));
dot("$(0,0,2)$", C, dir(30));
label("$x$", X, dir(135));
label("$y$", Y, dir(270));
label("$z$", Z, dir(Z));

transform t = scale(1.2)*shift(-5.5,-0.8);
filldraw(t*((2,0)--(0,0)--(0,1)--cycle), paleyellow, darkblue);
draw(t*((2.5,0)--(0,0)--(0,1.5)), Arrows);
label("$x$", t*(2.5,0), dir(-90));
label("$y$", t*(0,1.5), dir(90));
label("$\mathcal{R}$", t*(0.5,0.35), brown);
dot("$(6,0)$", t*(2,0), dir(-90));
dot("$(0,3)$", t*(0,1), dir(180));
draw("$\mathbf{r}(x,y) = \left( x, y, \frac{6-x-2y}{3} \right)$",
   (-5,0)--(-1,0), dir(90), darkblue, EndArrow);
label("$\mathcal{R}$: $x,y \ge 0$ and $2x+y \le 6$", t*(1.05,-0.5), dir(-90), brown);
label("$\mathcal{S}$: $x+2y+3z = 6$ and $x,y,z \ge 0$", (0,-1.55), dir(-90), deepgreen);
label("$\mathcal{S}$", midpoint(B--C), dir(45), darkgreen);
