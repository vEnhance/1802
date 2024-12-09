size(13cm);

int N = 11;
for (int i=1; i<N; ++i) {
  draw((i,0)--(i,N), grey);
  draw((0,i)--(N,i), grey);
}
draw((0,N)--(0,0)--(N,0)--(N,N)--cycle, purple+1.3, EndArrow, Margins);
label("$\mathcal{C}$", (N/2,N), dir(90), purple);

pen outer = deepgreen + 0.9;
pen inner = mediumgreen;

for (int i=0; i<N; ++i) {
  for (int j=0; j<N; ++j) {
    draw(shift(i,j)*((0.5,0.4)--(0.5,0.1)), (j==0) ? outer : inner, EndArrow(TeXHead));
    draw(shift(i,j)*((0.6,0.5)--(0.9,0.5)), (i==N-1) ? outer : inner, EndArrow(TeXHead));
    draw(shift(i,j)*((0.5,0.6)--(0.5,0.9)), (j==N-1) ? outer : inner, EndArrow(TeXHead));
    draw(shift(i,j)*((0.4,0.5)--(0.1,0.5)), (i==0) ? outer : inner, EndArrow(TeXHead));
  }
}
