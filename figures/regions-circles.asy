size(12cm);

real w = 1.7;
picture axes;
draw(axes, (-w,0)--(w,0), Arrows);
draw(axes, (0,-w)--(0,w), Arrows);
label(axes, "$x$", (w,0), dir(90));
label(axes, "$y$", (0,w), dir(0));

picture one, two, three;

draw(one, unitcircle, blue+1.2);
filldraw(two, unitcircle, lightcyan, blue+dashed);
filldraw(three, unitcircle, lightcyan, blue+1.2);

label(one, "1D: $x^2+y^2=1$", w*dir(90), 2*dir(90), blue);
label(two, "2D: $x^2+y^2<1$", w*dir(90), 2*dir(90), blue);
label(three, "2D: $x^2+y^2 \le 1$", w*dir(90), 2*dir(90), blue);

label(one, "No boundary or limit", w*dir(270), dir(270), deepgreen+fontsize(10pt));
label(two, "Limit $x^2+y^2 \to 1^-$", w*dir(270), dir(270), deepgreen+fontsize(10pt));
label(two, "No boundary", w*dir(270), 5*dir(270), deepgreen+fontsize(10pt));
label(three, "No limit", w*dir(270), dir(270), deepgreen+fontsize(10pt));
label(three, "Boundary $x^2+y^2=1$", w*dir(270), 5*dir(270), deepgreen+fontsize(10pt));

add(one, axes);
add(two, axes);
add(three, axes);

add(one);
add(shift(4,0)*two);
add(shift(8,0)*three);
