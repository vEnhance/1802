size(17cm);
usepackage("amssymb");

// Surface, in green

pair D = (2.4,3.5);
pair A = (0,0);
pair B = (8,0.2);
pair C = D+B-A;

pair[] Xs = { (1,0.1), (2,0), (3,-0.4), (4,-0.3), (5,0.1), (6,-0.2), (7,0.1) };
pair[] Ys = { (1.7,2.8), (1.5,2.1), (1.1,1.4), (0.5,0.7) };

guide g = A;
for (int i=0; i<Xs.length; ++i) { g = g..Xs[i]; }
path south_border = g..B;

guide g = D;
for (int i=0; i<Ys.length; ++i) { g = g..Ys[i]; }
path west_border = g..A;

path surf = west_border--south_border--(shift(B-A)*reverse(west_border))--(shift(D-A)*reverse(south_border))--cycle;

// Shadow
fill(shift(0.3,-0.3)*surf, mediumgrey);
// Surface itself
fill(surf, palegreen);

// Map
real a = 2.3, b = 6, c = 9.3, d = 10;
filldraw(box((a,b),(c,d)), paleyellow, black+1.2);

// Labeled point inside the surface
real w = (c-a)/(Xs.length+1);
real h = (d-b)/(Ys.length+1);
pair P = (a+2*w,b+2*h);
pair Q = Xs[1]+Ys[2]-A;
pair Pl = (1,5.5);
pair Ql = (0.86,4);

label("Point $(u,v)$ in $\mathcal{R}$", Pl, dir(Pl-P), brown);
label("Point $\mathbf{r}(u,v)$ in $\mathcal{S}$", Ql, dir(Ql-Q), deepgreen);
draw(Pl--P, EndArrow(TeXHead), Margins);
draw(Ql--Q, EndArrow(TeXHead), Margins);

fill(
  shift(Ys[2])*subpath(south_border, 2, 3)
  --shift(Xs[2])*subpath(west_border, 3, 2)
  --shift(Ys[1])*subpath(south_border, 3, 2)
  --shift(Xs[1])*subpath(west_border, 2, 3)
  --cycle, deepgreen);

for (int i=0; i<Xs.length; ++i) { draw(shift(Xs[i])*west_border, red); }
for (int i=0; i<Ys.length; ++i) { draw(shift(Ys[i])*south_border, blue); }
draw(surf, deepgreen + 1.2);

pair Qu = Q+Xs[2]-Xs[1];
pair Qv = Q+Ys[1]-Ys[2];
draw(P--(P+(w,0)), blue+1.6, EndArrow(6), BeginMargin);
draw(P--(P+(0,h)), red+1.6, EndArrow(6), BeginMargin);
draw(Q--Qu, blue+1.6, EndArrow(6), BeginMargin);
draw(Q--Qv, red+1.6, EndArrow(6), BeginMargin);

for (int i=1; i<=Xs.length; ++i) {
  draw((a+w*i,b)--(a+w*i,d), red);
}
for (int i=1; i<=Ys.length; ++i) {
  draw((a,b+h*i)--(c,b+h*i), blue);
}

draw(((a+c)/2, 5.5)--((a+c)/2, 3.5), darkblue + 1.5, EndArrow(6));
label("$\mathbf{r}$", ((a+c)/2, 4.5), dir(0), darkblue);
label("$\mathcal{R}$", (c,(b+d)/2), dir(0), brown);

label("Pairs $(u,v)$ in region $\mathcal{R}$", (13, 8));
label("(piece of paper)", (13, 7));

label("Surface $\mathcal{S}$", (13, 2));
label("(lives in space $\mathbb{R}^3$)", (13, 1));
label("$\mathcal{S}$", shift(0.3,-0.3)*B, dir(0), deepgreen);

pair Qc = Q+(0,3);
draw(Q--Qc, deepgreen + 1.6, EndArrow(6), BeginMargin);
label("$\frac{\partial \mathbf{r}}{\partial u} \times \frac{\partial \mathbf{r}}{\partial v}$", Qc, dir(90), deepgreen);

dotfactor *= 1.5;
dot(P, brown);
dot(Q, deepgreen);

label("$\frac{\partial \mathbf{r}}{\partial u}$", midpoint(Q--Qu), dir(220), blue);
label("$\frac{\partial \mathbf{r}}{\partial v}$", Qv, dir(40), red);
