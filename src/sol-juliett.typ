#import "@local/evan:1.0.0":*

= Solutions to Part Juliett

== Solution to @exer-flux-xy-ez (flux through a surface)

#recall-thm(<exer-flux-xy-ez>)

We parametrize the surface by $bf(r)(x,y) = chevron.l x, y, log(x^3+y^4) chevron.r$.
Rather than deal with log, we use the second row of @table-surfcross-2
and define the function $ g (x , y , z) = x^3 + y^4 - e^z . $
The surface is given implicitly by $g (x , y , z) = 0$, so we compute its gradient:
$ nabla g = lr(chevron.l (partial g) / (partial x) , (partial g) / (partial y) , (partial g) / (partial z) chevron.r)
  = (3 x^2 , 4 y^3 , - e^z) . $
Hence,
$ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
  = (nabla g) / ((partial g) / (partial z))
  = (chevron.l 3x^2, 4y^3, -e^z chevron.r)/(-e^z)
  = vec( - 3x^2 e^(-z), - 4y^3 e^(-z), 1 ). $
This normal vector is oriented upwards because its $z$-component is positive,
so we take this as our $bf(n) dif S$.

Hence, the flux of $bf(F)$ through $S$ is given by
$ iint_(cal(S)) bf(F) dot bf(n) dif S
  &= int_(x=0)^5 int_(y=0)^5 vec( x/3, y/4, 1/5 ) dot vec( - 3x^2 e^(-z), - 4y^3 e^(-z), 1 ) dif y dif x  \
  &= int_(x=0)^5 int_(y=0)^5 ((-x^3 - y^4) / e^z + 1/5)  dif y dif x \
  &= int_(x=0)^5 int_(y=0)^5 ((-e^z) / e^z + 1/5) dif y dif x \
  &= int_(x=0)^5 int_(y=0)^5 -4/5 dif y dif x \
  &= 25 dot -4/5 = #boxed[$ -20 $]. $

== Solution to @exer-flux-sealing (sealing a surface)

#recall-thm(<exer-flux-sealing>)

The divergence of $bf(F)$ is
$ nabla dot bf(F) = (partial) / (partial x) (cos (z^2) - x)
  + (partial) / (partial y) (sin (z^2) - y) + (partial) / (partial z) (2 z) = (- 1) + (- 1) + 2 = 0 . $

We seal the region $cal(S)$ by adding $cal(S)_"lid"$,
the surface of points with $z = e$ and $x^2+y^2 <= 1$.
This encloses a closed volume $cal(T)$.
We orient the normal vector pointing upward (away from $cal(T)$).
Note $cal(S)$ also has normal vector pointing away from $cal(T)$.

The divergence theorem on $cal(S)$ and $cal(S)_"lid"$, enclosing $cal(T)$, now gives
$ iint_(cal(S)) bf(F) dot dif bf(S) + iint_(cal(S)_"lid") bf(F) dot dif bf(S) =
  iiint_(cal(T)) nabla dot bf(F) dif V = 0. $
Thus, we compute the flux through the disk and use it to determine the flux through $cal(S)$.

We can take $bf(n) dif S = chevron.l 0,0,1 chevron.r$ for the flat surface $cal(S)_"lid"$, so
$ iint_(cal(S)_"lid") bf(F) dot dif bf(S) = iint_(cal(S)_"lid") bf(F) dot chevron.l 0 , 0 , 1 chevron.r dif A
  &= iint_(cal(S)_"lid") 2z dif A \
  &= iint_(x^2+y^2 <= 1) 2e dif A \
  &= 2e op("Area")(x^2+y^2 <= 1) = 2 e pi. $
Hence the answer:
$ iint_(cal(S)) bf(F) dot dif bf(S)
  = - iint_(cal(S)_"lid") bf(F) dot dif bf(S)
  = #boxed[$ - 2 pi e $]. $

== Solution to @exer-gravity-div2 (gravity)

#recall-thm(<exer-gravity-div2>)

This basically follows from @exer-gravity-div1 which told us $bf(G)$ has divergence $0$.
See the cartoon in @fig-sol-india-gravity.

We consider the solid volume $cal(T)$ contained between $cal(S)_1$ and $cal(S)_2$.
Since $cal(S)_2$ has normal vector oriented toward $cal(T)$
while $cal(S)_1$ has normal vector oriented away from $cal(T)$,
the divergence theorem says that
$ iint_(cal(S)_2) bf(G) dot bf(n) dif S
  - iint_(cal(S)_1) bf(G) dot bf(n) dif S
  = iiint_(cal(T)) nabla dot bf(G) dif V. $

#figure(
  image("figures/sol-india-gravity.svg", width: auto),
  caption: [Cartoon of @exer-gravity-div2.],
) <fig-sol-india-gravity>

However, $cal(T)$ does not contain the point $O$.
Therefore, applying @exer-gravity-div1, we have
$ iiint_(cal(T)) nabla dot bf(G) dif V = iiint_(cal(T)) 0 dif V = 0. $
The proof is complete.

== Solution to @exer-div-to-green (divergence to Green for flux)

#recall-thm(<exer-div-to-green>)

This is covered in Section 20.2 of Poonen's notes.
We give the same solution here.

Instead of working in two dimensions, we extend $cal(R)$ into a
three-dimensional region $cal(T)$ that consists of a slab of height $1$:
$ cal(T) = { (x , y , z) divides (x , y) "in" cal(R) , 0 <= z <= 1 } . $
To put this in words,
imagine if we had one of those cool printers that schools use that can make a stack
of hundreds of copies of the same image in a moment.
Then we print a bunch of copies of $cal(R)$ until the stack of photocopies has height $1$;
then $cal(T)$ denotes the part of the papers that has ink within it.
See @fig-sol-india-div-to-green.

Now the boundary of $cal(T)$ consists of three parts in its surface:

- The top lid $cal(S)_"top"$, which looks like a copy of $cal(R)$ at height $z=1$.
- The bottom lid $cal(S)_"bottom"$, which looks like a copy of $cal(R)$ at height $z=0$;
- The curved part $cal(S)$ which look like walls of $cal(T)$.

We orient all three away from $cal(T)$.

#figure(
  image("figures/sol-india-div-to-green.svg", width: auto),
  caption: [We make a stack of copies of $cal(R)$ of height $1$.
  This produces a solid volume $cal(T)$.],
) <fig-sol-india-div-to-green>

Next, we define a new three-dimensional vector field based on our 2D field $bf(F)$:
$ bf(F)^(*) = chevron.l p , q , 0 chevron.r. $
The divergence of $bf(F)^(*)$ is:
$ nabla dot bf(F)^(*) = (partial p) / (partial x) + (partial q) / (partial y) . $
Applying the divergence theorem to $cal(T)$, we obtain:
$ iint_(cal(S)_"top") bf(F)^(*) dot bf(n) dif S
  + iint_(cal(S)_"bottom") bf(F)^(*) dot bf(n) dif S
  + iint_(cal(S)) bf(F)^(*) dot bf(n) dif S
  = iiint_(cal(T)) nabla dot bf(F)^(*) dif V . $

Since $cal(T)$ has height 1, the volume integral simplifies to:
$ iiint_(cal(T)) nabla dot bf(F)^(*) dif V
  &= int_(z=0)^1 iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A dif z \
  &= iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $

Now let's look at the three parts of the boundary of $cal(T)$:

- On the top face at $z = 1$, the outward normal is $bf(n) = chevron.l 0 , 0 , 1 chevron.r$,
  and since $bf(F)^(*) = chevron.l p , q , 0 chevron.r$, we have:
  $ bf(F)^(*) dot chevron.l 0,0,1 chevron.r = 0 . $
  Thus, there is no contribution from the top face.
- Similarly the bottom face $z = 0$ gives no contribution.
- The vertical sidewalls project exactly onto $cal(C)$, the boundary of $cal(R)$.
  The normal to these walls is $bf(n)$ in the $x y$-plane,
  so the surface element is $bf(n) dif S = bf(n) dif s dif z$.
  The flux contribution from these sidewalls is:
  $ oint_(cal(C)) int_(z=0)^1 bf(F)^(*) dot bf(n) dif z dif s . $
  Since $bf(F)^(*)$ does not depend on $z$, this simplifies to:
  $ oint_(cal(C)) bf(F) dot bf(n) dif s . $

Putting this all together we get
$ oint_(cal(C)) bf(F) dot bf(n) dif s = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A . $
This completes the proof of Green's theorem for flux using the divergence theorem.


== Solution to @exer-stokes-to-green (Stokes to Green for work)

#recall-thm(<exer-stokes-to-green>)

This is covered in Section 20.1 of Poonen's notes.
It's actually easier than @exer-div-to-green,
because one doesn't need to print a whole bunch of copies of $cal(R)$ --- just one.

Specifically, we'll just take a single copy of $cal(C)$ on the plane $z = 0$.
That's all --- it's completely flat.
Then we take our surface $cal(S)$ to be just the flat $cal(R)$, again, still contained in $z = 0$.
And we take the force field to be
$ bf(F)^(*) = chevron.l p , q , 0 chevron.r  $
as before.

The classical Stokes' theorem now states that for a surface $cal(S)$ with boundary $cal(C)$,
$ oint_(cal(C)) bf(F)^(*) dot dif bf(r) = iint_(cal(S)) nabla times bf(F)^(*) dot bf(n) dif S . $
The left-hand side is the same as $oint_(cal(C)) bf(F) dot dif bf(r)$ in 2D:
the work doesn't change if we add an extra dimension.
So we just evaluate the curl on the right-hand side:
$ nabla times bf(F)^(*) = detmat(bf(e)_1, bf(e)_2, bf(e)_3;
  (partial) / (partial x), (partial) / (partial y), (partial) / (partial z);
  p, q, 0)
  = vec(0 , 0 , (partial q) / (partial x) - (partial p) / (partial y)) . $
As the surface $cal(S)$ lies in the plane $z = 0$, so the unit normal to
$cal(S)$ is $bf(n) = chevron.l 0 , 0 , 1 chevron.r$.
So, the dot product is
$ (nabla times bf(F)^(*)) dot bf(n)
  = vec(0 , 0 , (partial q) / (partial x) - (partial p) / (partial y)) dot vec(0,0,1)
  = (partial q) / (partial x) - (partial p) / (partial y). $
Plugging this into the right-hand side of our Stokes' theorem application ends the proof.
