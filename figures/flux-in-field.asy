size(13cm);
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

pair Q = Xs[1]+Ys[2]-A;
pair Ql = (0.86,4);

guide g = A;
for (int i=0; i<Xs.length; ++i) { g = g..Xs[i]; }
path south_border = g..B;

guide g = D;
for (int i=0; i<Ys.length; ++i) { g = g..Ys[i]; }
path west_border = g..A;

path surf = west_border--south_border--(shift(B-A)*reverse(west_border))--(shift(D-A)*reverse(south_border))--cycle;


// Shadow
fill(surf, mediumgrey);
fill(shift(0.3,-0.3)*surf, mediumgrey);

pair Qb = Q-(0,3);

// Surface itself
fill(surf, opacity(0.8)+palegreen);

pair v = (-1.4, 2.5);
for (int i=-2; i<6; ++i) {
  for (int j=-2; j<2; ++j) {
    pair T = Q + 2*(i,j);
    draw(T--(T+v), rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}
draw(Q--(Q+v), black+1.8, EndArrow(TeXHead, 4));
label("$\mathbf{F}$", Q+v, dir(v), black);

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

pair Qc = Q+(0,3);
draw(Q--Qc, deepgreen + 1.6, EndArrow(6), BeginMargin);
label("$\boxed{\frac{\partial \mathbf{r}}{\partial u} \times \frac{\partial \mathbf{r}}{\partial v}}$", Qc, dir(90), deepgreen);

label("$\frac{\partial \mathbf{r}}{\partial u}$", midpoint(Q--Qu), dir(220), blue);
label("$\frac{\partial \mathbf{r}}{\partial v}$", Qv, dir(40), red);

dotfactor *= 2;
dot(Q);
