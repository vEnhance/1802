import three;
import graph3;
import fontsize;

settings.render = 0;
settings.prc = false;

size(9cm);

currentprojection = perspective(3,2,1);

triple A = (-1, -1, 0);
triple B = (1, -1, 0);
triple C = (1, 1, 0);
triple D = (-1, 1, 0);

for (int i=1; i<10; ++i) {
  real p = i / 10;
  real q = 1 - p;
  draw((p*A+q*B)--(p*D+q*C), lightcyan);
  draw((p*A+q*D)--(p*B+q*C), lightcyan);
}
draw(surface(A--B--C--D--cycle), opacity(0.3)+cyan);
draw(A--B--C--D--cycle, blue+1.2);


triple P = 0.09*A+0.21*B+0.21*D+0.49*C;

triple v = (0, 0, 1);
label("$\mathbf{v}$", P+v, dir(90), red);

real markSize = 0.1;
triple A_mark = P + (-markSize, 0, 0);
triple B_mark = P + (-markSize, 0, markSize);
triple C_mark = P + (0, 0, markSize);
draw(A_mark--B_mark--C_mark, grey);

draw(P--(P+v), red, Arrow3(6));
dot("$P$", P, dir(280), black);
