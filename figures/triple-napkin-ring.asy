size(7cm);
pair O = (0,0);

draw(unitcircle, grey+dashed);
pair A = dir(40);
pair B = conj(A);
pair C = -A;
pair D = -B;
filldraw(A..dir(0)..B--cycle, opacity(0.3)+cyan, blue);
filldraw(C..dir(180)..D--cycle, opacity(0.3)+cyan, blue);
real k = 0.07;
pair E = (0, A.y);
draw(ellipse(E,A.x,k), blue);
draw(ellipse(-E,A.x,k), blue);
draw(ellipse((0,0),1,k), grey+dashed);

dot(O);
draw(O--A--E--cycle);
label("$R$", A/2, dir(-45));
label("$a$", midpoint(E--A), 2*dir(90));
label("$\sqrt{R^2-a^2}$", E/2, dir(180));
draw("$h$", (1.1,A.y)--(1.2,A.y)--(1.2,-A.y)--(1.1,-A.y), dir(0), deepgreen);
