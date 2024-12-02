#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 21],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [2 December 2024],
)

#quote(attribution: [Sneakers (1992)])[
  Mary: Wait a second. You can have anything you want, and you're asking for my phone number? \
  Carl: Yes. \
  Mary: 273-9164. Area code 415.
  ]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").


= Recitation questions from official course

In this recitation, we do some examples of flux calculations for graphs,
cylinders, and spheres. In each case, review the formula (and meaning)
of $upright(bold(n)) d S$ before applying to the example at hand.

/ 1.: Let $S$ be the portion of the cone $z = sqrt(x^2 + y^2)$ lying in the
  region $1 lt.eq z lt.eq 2$. Compute the upward flux of
  $upright(bold(V)) = < x , y , 2 z >$ through $S$.

/ 2.: Find the flux of $upright(bold(V)) = < z , x , y >$ outward through the
  portion of the cylinder $x^2 + y^2 = 100$ in the first octant and below
  the plane $z = h .$

/ 3.: Find the outward flux of the vector field
  $upright(bold(V)) = x z upright(bold(i)) + y z upright(bold(j)) + z^2 upright(bold(k))$
  through that part of the sphere $x^2 + y^2 + z^2 = a^2$ lying in the
  first octant $(x , y , z gt.eq 0)$.

/ 4.: Let $S$ be the portion of the cylinder $x^2 + y^2 = 1$ in the octant
  $x , y , z gt.eq 0$ that lies below $z = 1$. Compute the outward flux of
  $upright(bold(V)) = (x^3 z^2 + y^2 z) upright(bold(i)) + (x^2 y z^2 - x y z) upright(bold(j)) + (x z^4 - y^5) upright(bold(k))$
  through $S$.
