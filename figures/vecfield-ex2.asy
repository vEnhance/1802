import vecfield_base;

pair F2(pair P) { return (P.x, 0); }
add(shift(0,0)*vf("$\mathbf{F} = \begin{pmatrix} x \\ 0 \end{pmatrix}$", F2));
pair F3(pair P) { return (0, P.x); }
add(shift(11,0)*vf("$\mathbf{F} = \begin{pmatrix} 0 \\ x \end{pmatrix}$", F3));
pair F4(pair P) { return (P.y, -P.x); }
add(shift(0,-11)*vf("$\mathbf{F} = \begin{pmatrix} y \\ -x \end{pmatrix}$", F4));
pair F5(pair P) { return (P.x, P.y/4); }
add(shift(11,-11)*vf("$\mathbf{F} = \begin{pmatrix} x \\ y/3 \end{pmatrix}$", F5));
