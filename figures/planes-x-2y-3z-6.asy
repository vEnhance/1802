settings.render = 0;
settings.prc = false;

import three;

size(13cm);
currentprojection = perspective(9,3,2);

draw((0,0,0)--(7,0,0), Arrow3(6));
label("$x$", (7,0,0), (0,0,1));
draw((0,0,0)--(0,4,0), Arrow3(6));
label("$y$", (0,4,0), (0,0,1));
draw((0,0,0)--(0,0,3), Arrow3(6));
label("$z$", (0,0,3), (0,0,1));

triple A = (6,0,0);
triple B = (0,3,0);
triple C = (0,0,2);
triple D = (0.753, 0.618, 1.337);

path3 bdd = A--B--C--cycle;
surface plane = surface(bdd);
draw(plane, lightcyan + opacity(0.4));
draw(bdd, blue);

triple n = (1,2,3) / 3;
draw(A--(A+n), red, EndArrow3);
draw(B--(B+n), red, EndArrow3);
draw(C--(C+n), red, EndArrow3);
draw(D--(D+n), red, EndArrow3);

label("$\langle 1,2,3 \rangle$", A+n, dir(80), red);
label("$\langle 1,2,3 \rangle$", B+n, dir(80), red);
label("$\langle 1,2,3 \rangle$", C+n, dir(80), red);
label("$\langle 1,2,3 \rangle$", D+n, dir(80), red);

dot("$(6,0,0)$", A, dir(150), black);
dot("$(0,3,0)$", B, dir(300), black);
dot("$(0,0,2)$", C, dir(135), black);
dot("$(0.753, 0.618, 1.337)$", D, dir(270), black);
