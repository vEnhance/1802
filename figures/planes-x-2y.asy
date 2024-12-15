size(16cm);

picture left;
picture right;

draw(left, (-3,0)--(3,0), Arrows);
draw(left, (0,-3)--(0,3), Arrows);
label(left, "$x$", (3,0), dir(-90));
label(left, "$y$", (0,3), dir(180));
draw(left, (0,0)--(1,2), red+0.8, EndArrow);
label(left, "$\langle 1,2 \rangle$", (1,2), dir((1,2)), red);
draw(left, (-2.8,1.4)--(2.8,-1.4), blue, Arrows(TeXHead));
label(left, "$x+2y=0$", (-2.8,1.4), dir(90), blue);
dot(left, "$(0,0)$", (0,0), dir(225));

// psst it's not to scale don't tell anyone
draw(right, (-3,0)--(3,0), Arrows);
draw(right, (0,-3)--(0,3), Arrows);
label(right, "$x$", (3,0), dir(-90));
label(right, "$y$", (0,3), dir(180));
draw(right, (0,1.2)--(1,3.2), red+0.8, EndArrow);
draw(right, (2.4,0)--(3.4,2), red+0.8, EndArrow);
draw(right, (-2.8,2.6)--(2.8,-0.2), blue, Arrows(TeXHead));
label(right, "$x+2y=\pi$", (-2.8,2.6), dir(90), blue);
dot(right, "$(0,\frac{\pi}{2})$", (0,1.2), dir(225));
dot(right, "$(\pi,0)$", (2.4,0), dir(225));

add(left);
add(shift(7,0)*right);
