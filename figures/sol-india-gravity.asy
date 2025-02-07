size(8cm);
pair O = (0,0);

path S1 = (2,1.2)..(0.8,1.4)..(-0.9,1.8)..(-2,0)..(0,-1.5)..(1,-0.3)..cycle;
path S2 = (1,1)..(0.5,0.8)..(-0.3,0.7)..(-1,0)..(0,-0.2)..cycle;

fill(S1, paleyellow);
unfill(S2);
dot("$O$", O, dir(45));
draw("$\mathcal{S}_1$", S1, purple);
draw("$\mathcal{S}_2$", S2, blue);

label("$\mathcal{T}$", (-1,1), black);
draw("$\mathbf{n}$", (-1,0)--(-1.5,-0.2), EndArrow);
draw("$\mathbf{n}$", (-2,0)--(-2.5,-0.05), EndArrow);
