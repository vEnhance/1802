size(8cm);
usepackage("amsmath");

filldraw(box((0,0),(6,3)), paleyellow, black+1.2);

for (int i=1; i<=5; ++i) {
  draw((i,0)--(i,3), red);
}


for (int i=1; i<=4; ++i) {
  draw((0,3*i/5)--(6,3*i/5), blue);
}
label("$\varphi$", (0,1.5), dir(180));
label("$\theta$", (3,0), dir(-90));
label("$0$", (0,0), dir(225), grey);
label("$\pi$", (0,3), dir(180), grey);
label("$2\pi$", (6,0), dir(-90), grey);

label("$(\varphi, \theta) \in [0,\pi] \times [0,2\pi]$", (3,3), dir(90));

draw("$\mathbf{r}$", (3,-1)--(3,-4), darkblue+1.5, EndArrow(6));
