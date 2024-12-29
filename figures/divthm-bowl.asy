size(7cm);
usepackage("amsmath");

pair O = (0,0);
transform t = scale(1, 0.3);

draw((-1.5,0)--(1.5,0), Arrows);
draw((-1.2,-0.6)--(1.2,0.6), Arrows);
draw((0,-0.7)--(0,1.5), Arrows);
fill((1,0)..(0,1)..(-1,0)--(t*arc(O, 1, 180, 360))--cycle, opacity(0.4)+palered);
draw((1,0)..(0,1)..(-1,0), red);

filldraw(scale(1,0.3)*unitcircle, opacity(0.4)+lightblue, blue);
label("$\mathcal{S}$", dir(45), dir(45), red);
label("$\mathcal{S}_{\text{lid}}$", t*dir(-45), dir(-45), blue);

label("$+y$", (1.5,0), dir(-90));
label("$+x$", (-1.2,-0.6), dir(135));
label("$+z$", (0,1.5), dir(90));
