size(16cm);
import geometry;
usepackage("amsmath");
usepackage("derivative");
real dtheta = 30;

pair P = (0,0);
pair X = (3,1);
pair O = -3*X;
pair Y = rotate(dtheta, O) * P;
filldraw(arc(O,P,Y)--arc(O,(rotate(dtheta,O)*X), X, false)--cycle, palecyan, dotted);
dot("Origin", O, dir(180));
draw(P--O--Y, deepgreen);
markangle("$\odif \theta$", P, O, Y, deepgreen);
draw(P--X, red, EndArrow, Margins);
draw(arc(O,P,Y), red, EndArrow, Margins);
dot("$P = (r, \theta)_{\text{pol}}$", P, 2*dir(-90));
draw("$\odif r$", midpoint(P--X), dir(Y), red);
draw("$r \odif \theta$", rotate(dtheta/2, O) * P, dir(dtheta/2)*dir(P-O), red);
label("$\odif A$", 1.3*(X+Y)/2-0.3*P, blue);

dot("$(r + \odif r, \theta)_{\text{pol}}$", X, dir(30), blue);
dot("$(r, \theta + \odif \theta)_{\text{pol}}$", Y, dir(150), blue);
draw(P--(X.x,P.y)--X, purple);
draw(P--(Y.x,P.y)--Y, purple);
label("$\cos \theta \odif r$", (0.7*X.x+0.3*P.x,P.y), dir(270), purple);
label("$\sin \theta \odif r$", midpoint(X--(X.x,P.y)), dir(0), purple);

label("$-r \sin \theta \odif \theta$", (0.9*Y.x+0.1*P.x,P.y), dir(270), purple);
label("$r \cos \theta \odif \theta$", (Y.x,0.7*P.y+0.3*Y.y), dir(180), purple);
