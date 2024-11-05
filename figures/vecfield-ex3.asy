import vecfield_base;

pair F6(pair P) { return (1, 1); }
add(shift(0,0)*vf("$\mathbf{F} = \begin{pmatrix} 1 \\ 1 \end{pmatrix}$", F6));
pair F7(pair P) { return ((P.x+P.y)/2, (P.x-P.y)/2); }
add(shift(11,0)*vf("$\mathbf{F} = \begin{pmatrix} \frac{x+y}{2} \\ \frac{x-y}{2} \end{pmatrix}$", F7));
pair F8(pair P) { return (P.x, P.x); }
add(shift(0,-11)*vf("$\mathbf{F} = \begin{pmatrix} x \\ x \end{pmatrix}$", F8));
pair F9(pair P) { return (sin(pi/2*P.x), sin(pi/2*P.y)); }
add(shift(11,-11)*vf("$\mathbf{F} = \begin{pmatrix} \sin(\frac\pi2 x) \\ \sin(\frac\pi2 y) \end{pmatrix}$", F9));
