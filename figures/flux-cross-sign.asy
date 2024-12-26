size(17cm);
usepackage("amsmath");
usepackage("amssymb");

import patterns;
add("hatch",crosshatch(1.5pt, deepgreen));

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

pair Q = Xs[1]+Ys[2]-A;
pair Ql = (0.86,4);


label("Point $\mathbf{r}(u,v)$ in $\mathcal{S}$", Ql, dir(Ql-Q), deepgreen);
draw(Ql--Q, EndArrow(TeXHead), Margins);

fill(
  shift(Ys[2])*subpath(south_border, 2, 3)
  --shift(Xs[2])*subpath(west_border, 3, 2)
  --shift(Ys[1])*subpath(south_border, 3, 2)
  --shift(Xs[1])*subpath(west_border, 2, 3)
  --cycle, pattern("hatch"));

for (int i=0; i<Xs.length; ++i) { draw(shift(Xs[i])*west_border, red); }
for (int i=0; i<Ys.length; ++i) { draw(shift(Ys[i])*south_border, blue); }
draw(surf, deepgreen + 1.2);

pair Qu = Q+Xs[2]-Xs[1];
pair Qv = Q+Ys[1]-Ys[2];
draw(Q--Qu, blue+1.6, EndArrow(6), BeginMargin);
draw(Q--Qv, red+1.6, EndArrow(6), BeginMargin);

label("Surface $\mathcal{S}$", (13, 2));
label("(lives in space $\mathbb{R}^3$)", (13, 1));
label("$\mathcal{S}$", shift(0.3,-0.3)*B, dir(0), deepgreen);

pair Qc = Q+(0,3);
draw(Q--Qc, deepgreen + 1.6, EndArrow(6), BeginMargin);
label("$\boxed{\frac{\partial \mathbf{r}}{\partial u} \times \frac{\partial \mathbf{r}}{\partial v}}$", Qc, dir(90), deepgreen);

label("$\frac{\partial \mathbf{r}}{\partial u}$", midpoint(Q--Qu), dir(220), blue);
label("$\frac{\partial \mathbf{r}}{\partial v}$", Qv, dir(40), red);

dotfactor *= 2;
dot(Q);
