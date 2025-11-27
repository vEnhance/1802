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

= Definition of flux and accompanying shorthand

#definition(title: [Definition of flux])[
  Let $bf(r)(u,v) : cal(R) -> RR^3$ parametrize a surface $cal(S)$ in $RR^3$.
  The flux of a vector field $bf(F) : RR^3 -> RR^3$ through $cal(S)$ is defined by
  $ iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
]

We abbreviate $bf(n) dif S := ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v$,
so the flux integral becomes just $iint_(cal(S)) bf(F) dot bf(n) dif S$.
In fact, people often split the shorthand $bf(n) dif S$ into two parts:
$ bf(n) := frac((partial bf(r))/(partial u) times (partial bf(r))/(partial v),
  lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|))
  quad " and " quad
  dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
(So that $bf(n) dif S$ is indeed the full cross product, as the two absolute value things cancel.)
That is, $bf(n)$ is the unit vector in the _direction_ of the cross product,
while $dif S$ represents the _absolute value_ of the cross product with $dif u dif v$ tacked on.

= Cross products are annoying, so we pre-compute them all

The cross product is so annoying to compute that in practice
it's actually easier to just remember what it works out to in all the "common" 18.02 cases.
That data is summarized below in the following table.

Derivations are written in Section 28.4 of my notes.
Notice that you _only need the fifth column_ for calculation.
(And the third and fourth column can be deduced from the fifth one easily.)
I think the only purpose of the third and fourth column is that
for cylinder and sphere, it might be easier to remember
both the third and fourth column and multiply them together.

#figure(
  table(
    columns: 5,
    align: center + horizon,
    table.header([Surface],
      [Param's],
      [$bf(n)$ (unit vec)],
      [$dif S$],
      [$bf(n) dif S \ = (partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$frac(
        lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r),
        sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2))$],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) \ dif x dif y$],
      [$lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r) \ dif x dif y$],
    [$g(x,y,z) = c$],
      [$(x,y)$],
      [$ (nabla g) / (|nabla g|) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
      [$ (nabla g) / (partial g slash partial z) dif x dif y $],
    [Cylindrical coords with fixed $R$],
      [$(theta, z)$],
      [$chevron.l cos theta, sin theta, 0 chevron.r$],
      [$R dif theta dif z$],
      [$chevron.l R cos theta, R sin theta, 0 chevron.r \ dif theta dif z$],
    [Spherical coords with fixed $R$],
      [$(phi, theta)$],
      [$1/R dot bf(r)(phi, theta)$\ (if $0 <= phi <= pi$)],
      [$R^2 sin phi dif phi dif theta$ \ (if $0 <= phi <= pi$)],
      [$R sin phi dot bf(r)(phi, theta) \ dif phi dif theta$],
  ),
  kind: table
)

= Recipe (see LAMV 33.5 for slightly longer version)

#recipe(title: [Recipe for computing flux integrals with bare-hands parametrization (abridged)])[
  To compute the flux of $bf(F)$ over a surface $cal(S)$:

  1. Get the cross product $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$.
    - If you are using $(x,y)$-coordinates to parametrize,
      use rows 1 or 2 of the table.
    - If $cal(S)$ is specifically a cylinder or sphere, use rows 3 or 4 of the table.
    - Otherwise, parametrize $bf(r)(u,v) : cal(R) -> RR^3$
      of the surface $cal(S)$ and manually evaluate.
  2. Look at which way the cross product points (via right-hand rule).
    Does it point "outward"?
    If not, negate the cross product (equivalently, swap the order of $u$ and $v$) before going on.
  3. Compute the dot product $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    This gives you a number at every point on the parametrizing region $cal(R)$.
  4. Integrate the entire thing over $cal(R)$ using any of the methods for double integrals
    (such as horizontal/vertical slicing, polar coordinates, change of variables, etc.).
]

= Recitation questions from official course

In this recitation, we do some examples of flux calculations for graphs,
cylinders, and spheres. In each case, review the formula (and meaning)
of $upright(bold(n)) dif S$ before applying to the example at hand.

/ 1.: Let $S$ be the portion of the cone $z = sqrt(x^2 + y^2)$ lying in the
  region $1 lt.eq z lt.eq 2$. Compute the upward flux of
  $upright(bold(V)) = chevron.l x , y , 2 z chevron.r$ through $S$.

/ 2.: Find the flux of $upright(bold(V)) = chevron.l z , x , y chevron.r$ outward through the
  portion of the cylinder $x^2 + y^2 = 100$ in the first octant and below
  the plane $z = h .$

/ 3.: Find the outward flux of the vector field
  $upright(bold(V)) = x z upright(bold(i)) + y z upright(bold(j)) + z^2 upright(bold(k))$
  through that part of the sphere $x^2 + y^2 + z^2 = a^2$ lying in the
  first octant ($x , y , z gt.eq 0$).

/ 4.: Let $S$ be the portion of the cylinder $x^2 + y^2 = 1$ in the octant
  $x , y , z gt.eq 0$ that lies below $z = 1$. Compute the outward flux of
  $upright(bold(V)) = (x^3 z^2 + y^2 z) upright(bold(i)) + (x^2 y z^2 - x y z) upright(bold(j)) + (x z^4 - y^5) upright(bold(k))$
  through $S$.
