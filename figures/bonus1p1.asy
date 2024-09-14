size(8cm);
usepackage("amsmath");
fill((-0.4,-2.7)--(0.4,-2.1)--(0.4,5.3)--(-0.4,4.7)--cycle, palecyan);
label("$x+y+2z=0$", (0,5), dir(90), deepcyan);
draw((0,0)--(2,0), blue, EndArrow );

label("$\mathbf{n} = \langle 1,1,2 \rangle$", (2,0), dir(0), blue);
draw((0,0)--(7,4), red, EndArrow);
label("$\mathbf{v} = \langle 4,5,6 \rangle$", (7,4), dir(90), red);
draw((0,0)--(0,4), deepgreen, EndArrow);
label("$\mathbf{a}$", (0,4), dir(90), deepgreen);
draw((7,4)--(0,4), dashed, EndArrow, Margins);
label("$-\operatorname{comp}_{\mathbf{n}}(\mathbf{v}) \frac{\mathbf{n}}{|\mathbf{n}|}$", (3.5,4), dir(90));
