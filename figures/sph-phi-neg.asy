import geometry;
usepackage("amsmath");

size(14cm);
draw((-5,0)--(5,0), grey, Arrows);
draw(5*dir(30)--5*dir(210), grey, Arrows);
draw((0,-4)--(0,4), grey, Arrows);
label("$+x$", 5*dir(210), dir(-90), grey);
label("$+y$", (5,0), dir(0), grey);
label("$+z$", (0,4), dir(90), grey);

real r1 = 3 * 1.36602540378444;
real r2 = 3 * 0.366025403784439;
real theta = 90/pi * 0.261799387799149;

path g = rotate(theta)*ellipse((0,0),r1,r2);
draw(g, blue);

pair O = (0,0);
pair K = arcpoint(g, -2);
label("$x^2+y^2=r^2$", arcpoint(g,1), dir(30), blue);
draw("$r$", O--K, dir(-90), lightblue);
draw("$\theta$", scale(0.2)*subpath(g,2.64,3.38), dir(-70), deepgreen);
pair K1 = 0.9*K;
pair K2 = K + 0.1 * dir(90) * abs(K);
draw(K1--(K1+K2-K)--K2, grey);

// right angle mark at K
pair K1 = 0.9*K;
pair K2 = K + 0.1 * dir(90) * abs(K);
draw(K1--(K1+K2-K)--K2, grey);

pair P = K + 5.3 * dir(90);
draw("$+z$", K--P, dir(0), lightred+dashed, EndArrow, EndMargin);

draw("$\rho$", O--P, dir(110), red, EndArrow, EndMargin);
markangle(radius=15,n=2,"$\varphi$", P, O, (0,1), deepgreen);
markangle(radius=15,n=2,"$\varphi$", O, P, K, deepgreen);

pair L = -K;
pair Q = 2*L+P - (0,2*L.y);
draw("$\rho$", O--Q, dir(40), brown, EndArrow, EndMargin);
draw(O--L, brown, EndArrow, EndMargin);
draw(L--Q, brown, EndArrow, EndMargin);
label("$r$", O--L, dir(90), brown);

dot("$(r \cos \theta, r \sin \theta, 0)$", K, dir(310), lightblue);
dot("$P = (r, \varphi, \theta)_{\text{sph}}$", P, dir(40), black);
dot("$O$", O, dir(135));
dot(L, brown);
dot("$(r \cos (\theta \pm \pi), r \sin (\theta \pm \pi), 0)$", L, 3*dir(140), brown);
dot("$(r, -\varphi, \theta)_{\text{sph}} = (r, \varphi, \theta \pm \pi)_{\text{sph}}$", Q, dir(90), brown);
