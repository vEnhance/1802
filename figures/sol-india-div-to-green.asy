size(10cm);
usepackage("amsmath");

path C = (-1,0)..(0,-0.15)..(1,0)..(0,0.12)..cycle;

draw((0,0)--(0,-0.5), EndArrow);

draw(shift(0,0.5)*C, grey + dashed);
filldraw(C, opacity(0.4)+yellow, brown+1.3);
filldraw(shift(0,1)*C, opacity(0.4)+yellow, brown+1.3);
fill(subpath(C, 4, 2)--subpath(shift(0,1)*C, 2, 0)--cycle, opacity(0.2)+cyan);
draw((-1,0)--(-1,1), blue);
draw((1,0)--(1,1), blue);

draw((0,1)--(0,1.5), EndArrow);
draw((-1,0.3)--(-1.5,0.3), EndArrow);
dot((-1,0.3));
dot((0,0));
dot((0,1));

label("$\mathcal{R}$", (-0.6,0), brown);
label("$\mathcal{R}$", (-0.6,1), brown);
// label("$\mathcal{C}$", (0.6,0.2), dir(90), brown);
// label("$\mathcal{C}$", (0.6,1.2), dir(90), brown);

label("Height $z=0$", (-1,0), dir(180), red);
label("Height $z=1$", (-1,1), dir(180), red);

label("$\mathcal{T}$", (0,0.5), blue);
label("$\mathcal{S}_{\text{bottom}}$", (0.2,-0.3), dir(0));
label("$\mathcal{S}_{\text{top}}$", (0.2,1.3), dir(0));
label("$\mathcal{S}$", (-1,0.6), dir(180));
