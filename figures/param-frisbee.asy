size(10cm);
import graph;
usepackage("amsmath");

xaxis("$x$", -3, 7, Ticks(format=" ", Step=1, begin=false, end=false), Arrows);
yaxis("$y$", -3, 6, Ticks(format=" ", Step=1, begin=false, end=false), Arrows);

// Parameters
real r = 2; // Radius of the frisbee
pair center = (0,0); // Initial center position
pair P_initial = (0, r); // Initial position of point P
pair v = (3, 1.5); // Translational velocity vector (v_x, v_y)
real omega = 0.8; // Angular velocity (radians per unit time)

// Time parameter (for illustration purposes, assume t=1)
real t = 1.4;

// Compute new center position after time t
pair center_new = center + v * t;

// Compute rotation angle
real theta = degrees(omega) * t;

// Compute new position of point P after rotation
pair P_rotated = rotate(theta) * P_initial;

// New position of P considering both translation and rotation
pair P_new = center_new + P_rotated;

// Draw the frisbee at the new position
draw(Circle(center_new, r), blue+1.5bp);

// Draw the initial frisbee position (optional for reference)
draw(Circle(center, r), dashed+blue);

// Mark the initial point P
dot("$P_{\text{start}}$", center + P_initial, dir(135), red);

// Mark the new point P
dot("$P$", P_new, dir(theta+90+30), red);

// Draw translational velocity vector
draw(center_new -- (center_new + v), deepgreen+1.5bp, Arrow(6), Margins);
label("$\mathbf{v}$", center_new + v, E, deepgreen);

// Draw angular velocity indicator (counterclockwise arrow)
path angArrow = arc(center_new, r + 0.5, 90, 90 + theta);
draw(angArrow, orange+1.5bp, EndArrow(4));
label("$\omega$", center_new + rotate(theta/2)*(0, r + 0.5), N, orange);

// Optional: Draw the path of the center (for visualization)
draw((0,0)--(center_new), deepgreen + dashed);
dot(center_new, blue);
label("Center", center_new, dir(315), blue);
