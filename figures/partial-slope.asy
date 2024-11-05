import graph;
size(6cm);

real f(real x) {return 3-2/(x+2.5);}
graph.xaxis("$x$");
graph.yaxis();
draw(graph(f,-2,2,operator ..), blue, Arrows);

real p = -1;
real h = 1000 * (f(p+0.001)-f(p));
real r = 0.9;
draw( (p+r,f(p)+r*h)--(p-r,f(p)-r*h), red);
dot( (p, f(p)), red );
draw( (p, f(p))--(p,0), dashed);
dot("$p$", (p, 0), dir(-90));
label("$f'(p)$", (p+r/2, f(p) + h*r/2), dir(115), red);
