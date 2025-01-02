size(12cm);
usepackage("amsmath");

pair A = (-1,3);
pair B = (5,-1);
draw(A--B, blue+1, Arrows);
pair n = dir(90)*dir(B-A);
real k = 5;
transform t = shift(k*n);
draw(t*(A--B), blue+1, Arrows);
label(B, "Plane $\Pi_1$: $3x+4y+12z=-1$", 7*dir(180), blue);
label(t*A, "Plane $\Pi_2$: $3x+4y+12z=1001$", 7*dir(0), blue);

pair C = 0.7*B+0.3*A;
draw("$77$", C--t*C, deepgreen, Arrows(TeXHead), Margins);
pair D = 0.8*A+0.2*B;

pair P1 = D+42/77*k*n;
pair P2 = D-42/77*k*n;
dot("Possible $P$", P1, dir(0), red);
dot("Possible $P$", P2, dir(-45), red);
draw("$42$", D--P1, red, Arrows(TeXHead), Margins);
draw("$42$", D--P2, red, Arrows(TeXHead), Margins);

pair O = (8,-1);
dot(O);
draw(O--(O+n), black+1.4, EndArrow(TeXHead));
label("$\mathbf{n} = \langle 3,4,12 \rangle$", O+n, dir(n));
