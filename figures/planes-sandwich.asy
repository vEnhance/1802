size(14cm);
real H = 17;
draw((0,0)--(0,20), grey + dashed);

filldraw((-H-1, -1)--(H-1,-1)--(H+1,1)--(-H+1,1)--cycle, palecyan, blue);
filldraw((-H-1, 19)--(H-1,19)--(H+1,21)--(-H+1,21)--cycle, palecyan, blue);

dot((8,0), purple);
dot((8,20), purple);

draw((8,0)--(8,12), purple, EndArrow(TeXHead), Margins);
draw((8,20)--(8,12), purple, EndArrow(TeXHead), Margins);
label("$\frac{38}{\sqrt{14}}$", (8,6), dir(0), purple);
label("$\frac{-22}{\sqrt{14}}$", (8,16), dir(0), purple);

dot((8,12), deepgreen);
draw((0,0)--(8,12), deepgreen, EndArrow, Margins);
label("$x+2y+3z=0$", (H,0), dir(0), blue);
label("$x+2y+3z=60$", (H,20), dir(0), blue);
label("$(7,8,9)$", (8,12), dir(0), deepgreen);

draw((0,0)--(0,3), red, EndArrow);
draw((0,20)--(0,23), red, EndArrow);
label("$\langle 1,2,3 \rangle$", (0,3), dir(135), red);
label("$\langle 1,2,3 \rangle$", (0,23), dir(135), red);
dot((0,0));
dot((0,20));
label("$(0,0,0)$", (0,0), dir(180), black);
