#import "@local/evan:1.0.0":*

= Solutions to Part Charlie <ch-sol-charlie>

== Solution to @exer-complex-101-401-901 ($101 dot 401 dot 901$)

#recall-thm(<exer-complex-101-401-901>)

The idea is to consider the complex number
$ (10+i)(20+i)(30+i) = (199 + 30i)(30+i) = 5940 + 1099 i. $
Hence one possible choice is $ #boxed[$ (a,b) = (5940, 1099). $] $

== Solution to @exer-mt1p1 (projection onto plane)

#recall-thm(<exer-mt1p1>)

*Answer*: $vec(1/2, 3/2, -1)$.

#figure(
  image("figures/bonus1p1.svg", width: 70%),
  caption: [Projection onto a plane.],
) <fig-bonus1p1>

#h3[First approach using vector projection]

Previously you had to calculate the distance from a vector to a plane.
This problem only requires one step on top of that:
you need to then translate by that multiple of the normal vector.
See @fig-bonus1p1, where $bf(a)$ denotes the answer.
To execute the calculation, let $bf(v) = vec(4,5,6)$ and $bf(n) = vec(1,1,2)$.
The scalar projection is
$ op("comp")_(bf(n)) (bf(v)) = (bf(v) dot bf(n)) / (|bf(n)|) = (21) / sqrt(6). $
The vector projection is then
$ (op("comp")_(bf(n)) (bf(v))) (bf(n))/(|bf(n)|)
  = 21/sqrt(6) vec(1,1,2)/sqrt(6)
  = vec(7/2,7/2,7). $
Then the desired projection is
$ bf(v) - op("proj")_(bf(n)) (bf(v)) = vec(1/2, 3/2, -1). $

#h3[Second approach using normal vectors only (no projection stuff)]

A lot of you don't find vector projection natural (I certainly don't).
So it might be easier to imagine shifting $bf(v)$ by _some_ multiple of $bf(n) = vec(1,1,2)$
and then work out which multiple it is.

Specifically, we're looking for#footnote[In comparison to the first solution,
  the value of $t$ is exactly
  $ t = (op("comp")_(bf(n)) (bf(v))) /(|bf(n)|). $
  But the idea behind the second solution is that you don't _need to know_
  what the geometric formula of $t$ is.
  You can just solve for $t$ indirectly by asserting that $bf(a)$ lies on $x+y+2z=0$.]
a real number $t in RR$ such that the vector
$ bf(a) = bf(v) - t bf(n) = vec(4-t, 5-t, 6-2t) $
lies on the plane $x+y+2z = 0$.
But we can actually solve for $t$ just by plugging this $bf(a)$ into the equation of the plane:
$ (4-t) + (5-t) + 2(6-2t) = 0 ==> 21 - 6t = 0 ==> t = 7/2. $
Hence the answer
$ bf(a) = vec(4-7/2, 5-7/2, 6-2(7/2)) = vec(1/2, 3/2, -1). $

== Solution to @exer-mt1p2 (geometric interpretation)

#recall-thm(<exer-mt1p2>)

*Answer*: The quantity
$ 1/6 |arrow(D A) dot (arrow(D B) times arrow(D C))|. $
equals the volume of the tetrahedron $A B C D$.

In general, the volume of the tetrahedron is $1/6$ the area of the
parallelepiped formed by $arrow(D A)$, $arrow(D B)$, $arrow(D C)$.
Se we will prove that
$ |arrow(D A) dot (arrow(D B) times arrow(D C))| $
gives the volume of that parallelepiped.
Here are two approaches for proving it.

#h3[First approach using coordinates]

Let $D = (0,0,0)$, $A = (x_A, y_A, b_A)$, $B = (x_B, y_B, z_B)$, $C = (x_C, y_C, z_C)$.
Then expanding the cross product gives

$ (x_A ee_1 + y_A ee_2 + z_A bf(e_3)) dot
  detmat(ee_1, ee_2, ee_3; x_B, y_B, z_B; x_C, y_C, z_C). $

If you think about what evaluating the determinant using the formula
together with the dot product would give, you should find it's actually just
$ detmat(x_A, y_A, z_A; x_B, y_B, z_B; x_C, y_C, z_C) $
which is the volume of the parallelepiped.

#h3[Second approach using geometric picture]

The cross product $arrow(D B) times arrow(D C)$ is a vector whose area is
equal to the parallelogram formed by $arrow(D B)$ and $arrow(D C)$.
The dot product of that cross product against $arrow(D A)$ is equal to
the _height_ of $A$ to plane $B C D$ times this area,
and the volume is the height times the area.
See the following picture from #url("https://en.wikipedia.org/wiki/Triple_product")
(in the Wikipedia figure, $bf(a)$ denotes our $arrow(D A)$, etc.).

#figure(
  image("media/parallelepiped.png", width: 40%),
  caption: [Triple product image taken from Wikipedia.],
)

== Solution to @exer-mt1p3 (determinant of projection)

#recall-thm(<exer-mt1p3>)

*Answer*: 0, no matter which plane $cal(P)$ is picked.

#h3[First approach using basis vectors]

Let $ee_1$, $ee_2$, $ee_3$ be the three basis vectors. Then:

- The matrix $M$ is formed by gluing $f(ee_1)$, $f(ee_2)$, $f(ee_3)$ together.
- I claim the vectors $f(ee_1)$, $f(ee_2)$, $f(ee_3)$ are linearly dependent.
  After all, they are all contained in the two-dimensional plane $cal(P)$ by definition,
  and so three vectors in a plane can't be linearly independent.
- So the determinant is equal to zero (this theorem is one of the criteria we use
  to check whether vectors are linearly independent or not).

#h3[Second approach using eigenvectors]

Let $bf(n)$ be any nonzero normal vector to $cal(P)$.
Then $f(bf(n)) = bf(0)$, so $bf(n)$ is an eigenvector with eigenvalue $0$.
Since the determinant is the product of the eigenvalues, the determinant must be $0$ too.

#h3[Third approach using coordinate change]

This approach requires you to know the fact that the determinant doesn't change
if you rewrite the matrices in a new basis.

Let $bf(n)$ be any nonzero normal vector to $cal(P)$.
Pick two more unit vectors $bf(b)_1$ and $bf(b)_2$ perpendicular to $bf(n)$ that span $cal(P)$.
Then $bf(b)_1$, $bf(b)_2$ and $bf(n)$ are linearly independent and spanning, i.e. a basis of $RR^3$.
So we can change coordinates to use these instead.

We know that
$
  M(bf(b)_1) &= bf(b)_1 \
  M(bf(b)_2) &= bf(b)_2 \
  M(bf(n)_2) &= bf(0).
$

If we wrote $M$ as a matrix _in this new basis_ $angle.l bf(b)_1, bf(b)_2, bf(n) angle.r$
(rather than the usual basis), we would get
the matrix
$ M = mat(1,0,0;0,1,0;0,0,0) $
which has determinant $0$.

#remark[
  In fact, if you also know that the trace doesn't change
  when you rewrite $M$ in a different basis,
  this approach shows the trace $M$ is always exactly $1+1+0 = 2$ as well,
  no matter which plane $cal(P)$ is picked.
]

== Solution to @exer-mt1p4 (perpendicular unit vectors)

#recall-thm(<exer-mt1p4>)

*Answer*: $|bf(a) times bf(v)| = 3$ and $|bf(b) times bf(v)| = 2$.

Since $bf(v)$ is contained in the span of $bf(a)$ and $bf(b)$,
we can just pay attention to the plane spanned by these two perpendicular unit vectors.
So the geometric picture is that $bf(v)$ can be drawn in a rectangle with $bf(a)$ and $bf(b)$
as a basis, as shown.
Because $bf(v) dot bf(a) = 2$ and $bf(v) dot bf(b) = 3$, this rectangle is $2$ by $3$.

#figure(
  image("figures/bonus1p4.svg", width: 30%),
  caption: [Plotting $bf(v)$ in the span of $bf(a)$ and $bf(b)$.],
)

Now the magnitude of the cross product $bf(a) times bf(v)$ is supposed to be equal to
the area of the parallelogram formed by $bf(a)$ and $bf(v)$, which is $3$
(because this parallelogram has base $|bf(a)|=1$ and height $|bf(v) dot bf(b)|=3$).
Similarly, $bf(b) times bf(v)$ has magnitude $2$.

== Solution to @exer-mt1p5 (trace of matrix)

#recall-thm(<exer-mt1p5>)

*Answer*: $0$.

There are several approaches possible.
The first two show how to find the four entries of the matrix $M$.
The latter sidestep this entirely and show that the matrix is actually always trace $0$.

#h3[First approach: brute force]

Like in the pop quiz in my R04 notes, we will try to work out $M vec(1,0)$ and $M vec(0,1)$.
We're looking for constants $c_1$ and $c_2$ such that
$c_1 vec(4,7) + c_2 vec(5,9) = vec(1,0)$.

- Solving the system of equations $4c_1 + 5c_2 = 1$ and $7c_1 + 9c_2 = 0$
  using your favorite method gives coefficients $c_1 = 9$ and $c_2 = -7$, i.e.

  $ 9 vec(4,7) - 7 vec(5,9) = vec(1,0). $

  This lets us get

  $ M( vec(1,0) ) = 9 M( vec(4,7) ) - 7 M( vec(5,9) ) = 9 vec(5,9) - 7 vec(4,7) = vec(17, 32). $

- By solving the analogous system we can find the identity
  $ -5 vec(4,7) + 4 vec(5,9) = vec(0,1), $
  and hence:

  $ M( vec(0,1) ) = -5 M( vec(4,7) ) + 4 M( vec(5,9) ) = -5 vec(5,9) + 4 vec(4,7) = vec(-9, -17). $

Gluing these together $ M = mat(17,-9;32,-17). $
The trace is thus $17 + (-17) = 0$.

#h3[Second approach: inverse matrices]

We can collate the two given equations into saying that
$ M mat(4,5;7,9) = mat(5,4;9,7). $
Hence one could also recover $M$ by multiplying by the inverse matrix:
$ M = mat(5,4;9,7) mat(4,5;7,9)^(-1)
  = mat(5,4;9,7) 1/(4 dot 9-7 dot 5) mat(9,-5;-7,4) = mat(17,-9;32,-17). $
(Of course, we get the same entries for $M$ as the last approach.)
Again the trace is $17 + (-17) = 0$.

#h3[Third approach: Guessing eigenvectors and eigenvalues]

Let $bf(b)_1 = vec(4,7)$ and $bf(b)_2 = vec(5,9)$.
Adding and subtracting the given equations gives
$
  M(bf(b)_1 + bf(b)_2) &= bf(b)_1 + bf(b)_2 \
  M(bf(b)_1 - bf(b)_2) &= -(bf(b)_1 - bf(b)_2).
$

So $bf(b)_1 pm bf(b)_2$ are eigenvectors with eigenvalues $pm 1$.
Since $M$ is a $2 times 2$ matrix there are at most two eigenvalues: we found them all!

The trace of $M$ is the sum of the eigenvalues.
Call in the answer $1 + (-1) = 0$.

#h3[Fourth approach: Change coordinates]

This approach requires you to know the fact that the trace doesn't change
if you rewrite the matrices in a new basis.

Since $bf(b)_1 = vec(4,7)$ and $bf(b)_2 = vec(5,9)$ are a basis of $RR^2$,
we can change coordinates to use the $bf(b)_i$.
In that case,
$ M(bf(b)_1) = bf(b)_2 " and " M(bf(b)_2) = bf(b)_1. $

If we wrote $M$ as a matrix _in this new basis_ $angle.l bf(b)_1, bf(b)_2 angle.r$
(rather than the usual basis), we would get the matrix
$ M = mat(0,1;1,0) $
which has trace $0+0=0$.

== Solution to @exer-mt1p6 (complex triangle)

#recall-thm(<exer-mt1p6>)

*Answer*: $(3 sqrt(3))/4 root(3, 61)$.

#figure(
  image("figures/bonus1p6.svg", width: 60%),
  caption: [Three solutions to $z^3 = 5+6i$],
) <fig-bonus1p6>

We start by converting the complex number $5 + 6 i$ into polar form.
The modulus $r$ of $5 + 6 i$ is:
$ r = lr(|5 + 6 i|) = sqrt(5^2 + 6^2) = sqrt(25 + 36) = sqrt(61). $

The argument $theta$ is some random angle we won't use the exact value of:
$theta = arg (5 + 6 i) = tan^(- 1) (6 / 5)$.

Now to find the cube roots of $z^3 = 5 + 6 i$, we use the polar form:
$ z = root(6, 61) (cos (frac(theta + 2 k pi, 3)) + i sin (frac(theta + 2 k pi, 3))) $
for $k = 0 , 1 , 2$.
This gives us three roots corresponding to the different values of $k$.

This looks like an equilateral triangle centered around the origin,
where each spoke coming from the origin has magnitude $s$, where
$ s = root(6, 61). $
See @fig-bonus1p6.

If we cut up the equilateral triangle by the three arrows above,
we get three small isosceles triangles with a $120 degree$ angle at the apex.
The area of each triangle is going to be $s^2/2 sin(120 degree)$.

So this gives a final answer of
$ 3 dot root(3,61)/2 dot sin(120 degree) = (3 sqrt(3))/4 root(3, 61). $
