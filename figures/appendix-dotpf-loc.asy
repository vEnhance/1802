import geometry;
size(7cm);
pair A = (4,1);
pair B = (2,5);
pair C = (0,0);

fill(A--B--C--cycle, opacity(0.3)+paleyellow);

dot("$A$", A, dir(A));
dot("$B$", B, dir(B));
dot("$C$", C, dir(225));
draw(C--A, blue, EndArrow, Margins);
draw(C--B, purple, EndArrow, Margins);
draw(A--B, red, EndArrow, Margins);

markangle("$\theta$", A, C, B, deepgreen);

label("$\mathbf{u}$", midpoint(C--A), dir(90), blue);
label(rotate(degrees(A))*"$|\mathbf{u}| = C A$", midpoint(C--A), dir(-90), blue);

label("$\mathbf{v}$", midpoint(C--B), dir(-20), purple);
label(rotate(degrees(B))*"$|\mathbf{v}| = C B$", midpoint(C--B), dir(160), purple);

label("$\mathbf{v}-\mathbf{u}$", midpoint(A--B), dir(230), red);
label(rotate(degrees(A-B))*"$|\mathbf{v}-\mathbf{u}| = A B$", midpoint(A--B), dir(10), red);
