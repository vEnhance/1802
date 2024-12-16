size(9cm);
pen e1 = orange;
pen e2 = blue;
pen e3 = brown;
pen e4 = deepcyan;
real h = 2*pi;
fill(box((0,-h/2),(2,h/2)), paleyellow);

draw((0,-pi)--(2,-pi), e1, EndArrow);
draw((2,-pi)--(2,pi), e2, EndArrow);
draw((2,pi)--(0,pi), e3, EndArrow);
draw((0,pi)--(0,-pi), e4, EndArrow);
label("$r$", (2,-pi), dir(-45));
label("$\theta$", (0,pi), dir(135));


label("$[0,1] \times [0, 2\pi]$", (2,3), dir(0));
draw("$\mathbf{T}$", (2.5,0)--(6.5,0), dir(90), darkblue+1.2, EndArrow(9));

pair O = (9,0);
pair P = O + 2*dir(0);
fill(circle(O,2), paleyellow);
real eps = 0.1;
draw(shift(0,eps) * (O--P), e1, EndArrow, Margins);
draw(shift(0,-eps) * (P--O), e3, EndArrow, Margins);
draw(circle(O,2), e2, EndArrow, Margins);
dot(O, e4+4);
label("Unit disk $x^2 + y^2 \le 1$", O+2*dir(90), dir(90));
