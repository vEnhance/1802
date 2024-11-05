import graph;
size(14cm);

// Set up the range of the plot
real xmin = -4.8, xmax = 4.8;
real ymin = -2.8, ymax = 2.8;

// Draw axes
xaxis("$x$", xmin, xmax, Ticks(Label(fontsize(9pt)), Step=1), Arrows);
yaxis("$y$", ymin, ymax, Ticks(Label(fontsize(9pt)), Step=1), Arrows);

dotfactor *= 1.5;
for (int x = -4; x <= 4; ++x) {
  dot((x,2), red);
  dot((x,0), red);
  dot((x,-1), red);
}
