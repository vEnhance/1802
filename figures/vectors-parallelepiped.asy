// Asymptote code to draw a 2D representation of a parallelepiped

size(9cm);

// Define the vectors for the edges of the parallelepiped
pair A = (0, 0);         // Origin
pair B = (5, 0);         // Vector along one axis
pair C = (2, 2);         // Vector along another axis
pair D = B + C;          // Diagonal from the origin (opposite corner)

// Draw the edges
draw(A -- B, blue+1bp, EndArrow); // Base edge
draw(A -- C, blue+dashed, EndArrow); // Side edge
draw(B -- D, black+1bp); // Diagonal top edge
draw(C -- D, dashed); // Diagonal side edge

// Draw the dashed edges for the parallelepiped's depth
pair E = (1, 4);         // Vector for depth along one side
pair F = B + E;          // Top edge from B
pair G = C + E;          // Side depth from C
pair H = D + E;          // Opposite corner depth

// Draw the visible depth edges
draw(A -- E, blue+1bp, EndArrow);    // Depth from origin
draw(B -- F, black+1bp);    // Depth from B
draw(C -- G, dashed);    // Depth from C
draw(D -- H, black+1bp);    // Depth from D

// Draw the remaining edges connecting the depths
draw(E -- F, black+1bp);
draw(E -- G, black+1bp);
draw(F -- H, black+1bp);
draw(G -- H, black+1bp);
draw(A--H, deepgreen, EndArrow);

// Label the vertices
dot("$\mathbf{0}$", A, SW);
label("$\mathbf{v}_1$", B, SE, blue);
label("$\mathbf{v}_2$", C, dir(135), blue);
label("$\mathbf{v}_3$", E, W, blue);
label("$\mathbf{v}_1+\mathbf{v}_2+\mathbf{v}_3$", H, dir(45), deepgreen);
