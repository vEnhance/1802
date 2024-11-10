import geometry;

usepackage("derivative");
unitsize(2cm);
real dtheta = 7;
pair P1 = (2,0);
pair X1 = P1 + (0.4, 0);
pair Y1 = rotate(dtheta)*P1;
pair P2 = (5,0);
pair X2 = P2 + (0.4, 0);
pair Y2 = rotate(dtheta)*P2;

pair O = (0,0);
dot("Origin", O, dir(225), black);

draw(7*dir(X2)--O--7*dir(Y2), deepgreen, Arrows);

filldraw(arc(O,P1,Y1)--arc(O,(rotate(dtheta)*X1), X1, false)--cycle, palecyan, dotted);
label("$\odif A$", (X1+Y1)/2, blue);
draw(P1--X1, red, EndArrow, Margins);
draw(arc(O, P1, Y1), red, EndArrow, Margins);
dot("$P_1$", P1, dir(225));
dot("$(r_1 + \odif r, \theta_1)$", X1, 2*dir(310), blue);
dot("$(r_1, \theta_1 + \odif \theta)$", Y1, dir(105), blue);

filldraw(arc(O,P2,Y2)--arc(O,(rotate(dtheta)*X2), X2, false)--cycle, palecyan, dotted);
label("$\odif A$", (X2+Y2)/2, blue);
draw(P2--X2, red, EndArrow, Margins);
draw(arc(O, P2, Y2), red, EndArrow, Margins);
dot("$P_2$", P2, dir(225));
dot("$(r_2 + \odif r, \theta_2)$", X2, 2*dir(310), blue);
dot("$(r_2, \theta_2 + \odif \theta)$", Y2, dir(105), blue);

markangle(X1, O, Y1, deepgreen);
label("$\odif \theta$", O, 7*dir(-10), deepgreen);

label("$\odif \theta$", midpoint(P1--X1), dir(-90), red);
label("$\odif \theta$", midpoint(P2--X2), dir(-90), red);
label("$r_1 \odif \theta$", midpoint(P1--Y1), -dir(dtheta/2), red);
label("$r_2 \odif \theta$", midpoint(P2--Y2), -dir(dtheta/2), red);
