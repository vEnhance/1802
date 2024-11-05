size(8cm);
defaultpen(linewidth(0.9)+fontsize(13pt));
pair O = (0,0);

filldraw(circle((0,1.5),0.5), palered, red);
filldraw(unitcircle, palecyan, blue);

path arrow = O--(-0.13,-0.35)--(-0.06,-0.35)--(-0.06,-0.7)--(0.06,-0.7)--(0.06,-0.35)--(0.13,-0.35)--cycle;
filldraw(shift((0,1.87))*arrow, paleyellow, red);

for(int i=1; i<=12; ++i) {
  real t = 90 - 30 * i;
  draw(0.9*dir(t)--dir(t), blue);
  label("$"+(string) i+"$",0.75*dir(t), blue);
}
dot(O);
draw(arc(O,1.5,68,20),EndArrow(size=12));
