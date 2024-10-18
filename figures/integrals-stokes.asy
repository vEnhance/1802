size(16cm);
usepackage("amsmath");
usepackage("amssymb");
usepackage("derivative");
label("$\boxed{f \colon \mathbb R^1 \to \mathbb R}$", (-0.5,8), dir(180), blue);
label("$\boxed{f \colon \mathbb R^2 \to \mathbb R}$", (-0.5,3.5), dir(180), blue);
label("$\boxed{f \colon \mathbb R^3 \to \mathbb R}$", (-0.5,0), dir(180), blue);
label("$\boxed{\mathbf F \colon \mathbb R^2 \to \mathbb R^2}$", (-0.5,6.5), dir(180), purple);
label("$\boxed{\mathbf F \colon \mathbb R^3 \to \mathbb R^3}$", (-0.5,-3), dir(180), purple);

real w = 0.7; // axis length
pair O = (0,0);
defaultpen(fontsize(11pt));
pen intfont = fontsize(9pt);

picture vector_field;
for (int i=0; i<5; ++i) {
  for (int j=0; j<4; ++j) {
    draw(vector_field,
    shift(-0.9*w,-0.6*w)*((0.4*i*w,0.45*j*w)--(0.4*i*w+0.2,0.45*j*w-0.15)),
    rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}

picture axis1;
picture axis2;
picture axis3;
draw(axis1, (-w,0)--(w,0), grey, Arrows(TeXHead));
draw(axis2, (-w,0)--(w,0), grey, Arrows(TeXHead));
draw(axis2, (0,-w)--(0,w), grey, Arrows(TeXHead));
draw(axis3, (-w,0)--(w,0), grey, Arrows(TeXHead));
draw(axis3, (0,-w)--(0,w), grey, Arrows(TeXHead));
draw(axis3, (-w/1.6,-w/1.6)--(w/1.6,w/1.6), grey, Arrows(TeXHead));

transform t;

/* 0-D integrals */
label("\fbox{0-D integral}", (1,9.5), deepblue);
string s = "Eval $f$ at point";

t = shift(1,8);
add(t*axis1);
dot("$f(x_0)$", t*O, dir(-90));
label(s, t*(dir(90)/2), deepgreen);

t = shift(1,3.5);
add(t*axis2);
dot("$f(x_0, y_0)$", t*(-w/2,-w/2), dir(-75));
label(s, t*dir(90), deepgreen);

t = shift(1,0);
add(t*axis3);
dot("$f(x_0, y_0, z_0)$", t*(-w/3,-2*w/3), dir(-75));
label(s, t*dir(90), deepgreen);

/* 1-D integrals */
label("\fbox{1-D integral}", (4,9.5), deepblue);

t = shift(4,8);
add(t*axis1);
draw(t*((-0.3,0)--(0.3,0)), black+1.4);
dot(t*(-0.3,0), black);
dot(t*( 0.3,0), black);
label("$\int\limits_a^b f(x) \odif x$", t*O, dir(-90));
label("18.01 integral", t*(dir(90)/2), deepgreen);

t = shift(4,3.5);
add(t*axis2);
draw("$\int\limits_{t_0}^{t_1} f(\mathbf r(t)) |\mathbf r'(t)| \odif t$", t*(0,-w), dir(-90), intfont);
draw(t*((-0.7*w,-0.4*w)..(-0.2*w,0.5*w)..(0.6*w,0.55*w)), black+1.4);
dot(t*(-0.7*w, -0.4*w));
dot(t*(0.6*w, 0.55*w));
label("Line integral", t*dir(90), deepgreen);

t = shift(4,0);
add(t*axis3);
draw("$\int\limits_{t_0}^{t_1} f(\mathbf r(t)) |\mathbf r'(t)| \odif t$", t*(0,-w), dir(-90), intfont);
draw(t*((-0.8*w,-0.3*w)..(0.2*w,-0.1*w)..(0.6*w,0.3*w)), black+1.4);
dot(t*(-0.8*w, -0.3*w));
dot(t*(0.6*w, 0.3*w));
label("Line integral", t*dir(90), deepgreen);

/* 2-D integrals */
label("\fbox{2-D integral}", (8,9.5), deepblue);

t = shift(8,3.5);
path square = box((-0.6*w,-0.6*w), (0.6*w,0.6*w));
filldraw(t*square, lightgrey, black+1.4);
draw("$\int\limits_{a_1}^{b_1} \int\limits_{a_2}^{b_2} f(x,y) \odif x \odif y$", t*(0,-w), dir(-90), intfont);
label("Double/area integral", t*dir(90), deepgreen);
add(t*axis2);

t = shift(8,0);
path surface = (-0.8*w,-0.1*w)..(-0.2*w,-0.3*w)..(0.6*w,-0.6*w)..(0.7*w,-0.1*w)..(0.3*w,0.4*w)..(-0.5*w,0.3*w)..cycle;
filldraw(t*surface, lightgrey, black+1.4);
draw("$\int\limits_{u_0}^{u_1} \int\limits_{v_0}^{v_1} f(\mathbf r(u,v)) |\pdv{\bf{r}}{u} \times \pdv{\bf{r}}{v}| \odif u \odif v$", t*(0,-w), dir(-90), intfont);
label("Surface integral", t*dir(90), deepgreen);
add(t*axis3);

/* 3-D integrals */
label("\fbox{3-D integral}", (12.5,9.5), deepblue);

t = shift(12.5,0);
pair A = (-0.4, -0.25);
pair C = (0.1, 0.25);
pair B = (A.x, C.y);
pair D = (C.x, A.y);
transform s = shift(0.17,0.13);
fill(t*(A--B--s*B--s*C--s*D--D--cycle), lightgrey);
draw(t*s*(A--B--C--D--cycle), black+1.4);
draw(t*(A--B--C--D--cycle), black+1.4);
draw(t*(A--s*A), black+1.4);
draw(t*(B--s*B), black+1.4);
draw(t*(C--s*C), black+1.4);
draw(t*(D--s*D), black+1.4);
draw("$\int\limits_{a_1}^{b_1} \int\limits_{a_2}^{b_2} \int\limits_{a_3}^{b_3} f(x,y,z) \odif x \odif y \odif z$", t*(0,-w), dir(-90), intfont);
label("Triple/volume integral", t*dir(90), deepgreen);
add(t*axis3);

/* Work */
t = shift(4,5.5);
add(t*axis2);
draw("$\int\limits_{t_0}^{t_1} \mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t) \odif{t}$", t*(-w,w), dir(180), intfont+purple);
add(t*vector_field);
draw(t*((-0.7*w,-0.4*w)..(-0.2*w,0.5*w)..(0.6*w,0.55*w)), purple+1.4);
dot(t*(-0.7*w, -0.4*w), purple);
dot(t*(0.6*w, 0.55*w), purple);
label("Work", t*dir(90), purple);

t = shift(4,-3);
add(t*axis3);
draw("$\int\limits_{t_0}^{t_1} \mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t) \odif{t}$", t*(-w,-w), dir(180), intfont+purple);
add(t*vector_field);
draw(t*((-0.8*w,-0.3*w)..(0.2*w,-0.1*w)..(0.6*w,0.3*w)), purple+1.4);
dot(t*(-0.8*w, -0.3*w), purple);
dot(t*(0.6*w, 0.3*w), purple);
label("Work", t*dir(90), purple);

/* Flux */
t = shift(8,-3);
draw("$\int\limits_{u_0}^{u_1} \int\limits_{v_0}^{v_1} \mathbf{F}(\mathbf{r}(u,v)) \cdot \left( \pdv{\mathbf{r}}{u} \times \pdv{\mathbf{r}}{v} \right) \odif{u} \odif{v}$", t*(w,-w), dir(0), intfont+purple);
filldraw(t*surface, pink, purple+1.4);
add(t*axis3);
add(t*vector_field);
label("Flux", t*dir(90), purple);

/* Arrows */
draw("$\frac{df}{dx}$", (2,8)--(3,8), red, EndArrow);

draw((1,5)--(1,5.5)--(3,5.5), red, EndArrow);
label("$\nabla f$ (grad)", (1,5.5), dir(180), red);
draw((5,5.5)--(8,5.5)--(8,5), red, EndArrow);
label("$\pdv{g}{x}-\pdv{f}{y}$ (2d scalar curl)", (8,5.5), dir(0), red);

draw((1,-1.5)--(1,-3)--(3,-3), red, EndArrow);
label("$\nabla f$ (grad)", (1,-2.25), dir(180), red);
draw((5,-3)--(7,-3), red, EndArrow);
label("$\nabla \times \mathbf{F}$ (curl)", (6,-3), dir(270), red);
draw((9,-3)--(12.5,-3)--(12.5,-1.5), red, EndArrow);
label("$\nabla \cdot \mathbf{F}$ (div)", (12.5,-2.25), dir(0), red);

/* Include advertisement */
label(minipage("\centering \fbox{\copyright{} 2024 Evan Chen} \\ \texttt{https://web.evanchen.cc/}", 4cm), (12.5,7.5), grey + fontsize(9pt));
