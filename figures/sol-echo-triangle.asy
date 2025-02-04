size(6cm);

pair A = (0,12);
pair B = (-5,0);
pair C = (9,0);

pair P = (A+B+C)/3;

draw(P--A, red);
draw(P--B, red);
draw(P--C, red);

dot("$A = (0,12)$", A, dir(90));
dot("$B = (-5,0)$", B, dir(-90));
dot("$C = (9,0)$", C, dir(-90));
dot("$P = (x,y)$", P, dir(10));
