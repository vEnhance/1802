import graph;
usepackage("amsmath");
size(10cm);
fill((1,0)..(0,1)..(-1,0)--cycle, opacity(0.4)+paleyellow);

xaxis("$x$", -1.5, 1.5, Ticks(Label(fontsize(9pt)), Step=0.5, begin=false, end=false), Arrows);
yaxis("$y$", -1.5, 1.5, Ticks(Label(fontsize(9pt)), Step=0.5, begin=false, end=false), Arrows);


real eps = 0.05;
for (real x=-1.26; x<=1.26; x+=0.21) {
  for (real y=-1.26; y<=1.26; y+=0.21) {
    pair P = (x,y);
    draw(P -- (P + eps * (2*y,3*x)), rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}
draw(arc((0,0), 1, 0, 180), blue+1.6, EndArrow(6), Margins);
draw((-1,0)--(1,0), deepcyan+1.4, EndArrow(4), Margins);
label("$\mathcal{C}$", dir(40), dir(40), blue);
label("$\mathcal{R}$", (0.5,0.5), red);
label("$\mathcal{C}_{\text{lid}}$", (0.25,0), dir(-90), deepcyan);
