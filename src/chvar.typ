#import "@local/evan:1.0.0":*

= Change of variables <sec-chvar>

We'll do just two variables for now;
the 3D situation is exactly the same and we cover it later.

== [TEXT] Interval notation

One quick notational thing if you haven't seen this before:

#definition(title: [Definition: Interval notation])[
  Suppose $[a,b]$ and $[c,d]$ are closed intervals in $RR$ (so $a <= b$ and $c <= d$).
  By $[a,b] times [c,d]$ we mean the rectangle consisting of points
  $(x,y)$ such that $a <= x <= b$ and $c <= y <= d$.
  (So the four corners of the rectangle are $(a,c)$, $(a,d)$, $(b,c)$, $(b,d)$.)
]
#example[
  For example $[0,1] times [0,1]$ would be a unit square whose southwest
  corner is at the origin.
  Similarly, $[0,5] times [0,3]$ would be a rectangle of width $5$ and height $3$.
]
#figure(
  image("figures/chvar-rect.svg", width: auto),
  caption: [A picture of $[0,5] times [0,3]$. This is just the set of points where $x$ is in
  the interval $[0,5]$ and $y$ is in the closed interval $[0,3]$.],
)


== [TEXT] Transition maps

As it turns out $x y$-integration (or $x y z$-integration in 3D) isn't always
going to be nice, even if you try both horizontal and vertical slicing.

The standard example that's given looks something like this:
suppose you want to integrate the region bounded by the four lines
$ x y = 16/9, #h(1em) x y = 16/25, #h(1em) x = 4 y, #h(1em) y = 4 x. $
This region is sketched in @fig-chvar-ex.
As I promised you, I think it's better for your thinking if you write these as inequalities:
#eqn[
  $ 16/25 <= x y <= 16 / 9 \
  1/4 <= y / x <= 4. $
]
#figure(
  image("figures/chvar-region.svg", width: auto),
  caption: [A cursed region bounded by four curves.
  Trying to do $x y$-integration in either direction will be annoying as heck.],
) <fig-chvar-ex>

This section introduces a technique called "change of variables" that will
allow us to handle this annoying-looking yellow region for when we don't want to do $x y$-integration.
The idea is to make a new map of the yellow region with a different coordinate system.
To do this, I need to tell you a new term:

#definition(title: [Definition of transition map])[
  Suppose $cal(R)$ is a region.
  Let $cal(S)$ be another region, often a rectangle.
  A *transition map* for $cal(R)$ is a function $bf(T) : cal(S) -> cal(R)$ that transforms $cal(S)$ to $cal(R)$.

  In 18.02 we always require that all the points except possibly the boundaries of $cal(S)$
  get mapped to different points in $cal(R)$.
  Thus, writing the inverse $bf(T)^(-1)$ usually also makes sense.
]

If $cal(S)$ is a rectangle --- and again, that's quite common ---
then sometimes $bf(T)$ is also called a cell
(e.g. my Napkin does this when discussing differential forms).

#remark(title: [Remark: An analogy to the world map])[
  Cartography or geography enthusiasts will find that the word "map" gives them the right instincts.
  If you print a world map on an $8.5 times 11$ or A4 sheet of paper,
  it gives you a coordinate system for the world with longitude and latitude.
  So $cal(R)$ can be thought of as the surface of the Earth,
  while $cal(S)$ is the rectangular sheet of paper.

  The map is always distorted in some places, because the Earth is not flat:
  the north and south pole will often get stretched a ton, for example.
  But that's okay --- *as long as each longitude and latitude gives you a different point on
  Earth, we're satisfied*. Technically there are exceptions at the north and south poles,
  but those are on the boundary and we let it slide.

  This corresponds to the idea that a cell can capture a complicated area with two coordinates.
  See @fig-xkcd-charts.
]

#figure(
  box(image("media/xkcd-977.png", width: 60%), stroke: 1pt),
  caption: [One of the map projections from #link("https://xkcd.com/977/")[XKCD 977],
  a chart titled _What your favorite map projection says about you_.
  There's several more if you're curious.],
) <fig-xkcd-charts>

Now how does a transition map help us?
Well, first, let's show how we can do cartography on the region we just saw,
and then worry about the integration later.

The key idea is that we need to rig our transition function such that
$ u = y / x, #h(2em) v = x y $
so that our two inequalities we saw earlier are just
$  1/4 <= v <= 4, #h(2em)  16/25 <= v <= 16/9. $
This lets us make a portrayal of the yellow region as a sheet of paper.
See @fig-chvar-trans, which is really important to us!

#figure(
  image("figures/chvar-trans.svg", width: auto),
  caption: [We use a $(u,v)$ rectangle as a transition map to
  do cartography on the region $cal(R)$.],
) <fig-chvar-trans>

How do we actually express the transition map of $bf(T)$?
It's actually easier to write the _inverse_;
in this context it's actually more natural to write
$ bf(T)^(-1)(x,y) = (y/x, x y). $
If you really need $bf(T)$ itself,
you would solve for $u$ and $v$ in terms of $x$ and $y$ to get
$ x &= sqrt(v / u) \
  y &= sqrt(u v) $
so that our transition map is given exactly by
$ bf(T)(u,v) = (sqrt(v/u), sqrt(u v)). $
However, actually for integration purposes (we'll see this next section)
you can actually get away with only the formula for $bf(T)^(-1)$ instead.

== [TEXT] Integration once you have a transition map

If you remember change-of-variables from 18.01,
the 18.02 is the grown-up version where you have a transition map instead.

#definition(title: [Definition: Jacobian determinant])[
  Let $bf(T)$ be a transition map defined from a region in $RR^n$ to $RR^n$.
  The *Jacobian matrix* is the matrix
  whose rows are the gradients of each component written as row vectors;
  the *Jacobian determinant* is its determinant.
  In these notes we denote the matrix my $J_(bf(T))$
  (and the determinant by $det J_(bf(T))$.
]

For example in a $2 times 2$ case, if the transition map $bf(T)(u,v)$
is written as $bf(T)(u,v) = (p(u,v), q(u,v))$, then
$ J_(bf(T)) = mat(
  (partial p)/(partial u), (partial p)/(partial v);
  (partial q)/(partial u), (partial q)/(partial v)
). $

#example[
  Let's consider the transition map $bf(T)(u,v)$ we saw earlier, that is
  $ bf(T)(u,v) = (sqrt(v/u), sqrt(u v)). $
  We compute the gradient of $(u,v) |-> sqrt(v/u)$ by taking the two partials:
  $ partial / (partial u) sqrt(v/u) &= -1/2 u^(-3/2) v^(1/2) \
    partial / (partial v) sqrt(v/u) &= 1/2 u^(-1/2) v^(-1/2). $
  The other component $(u,v) |-> sqrt(u v)$ has the following gradient:
  $ partial / (partial u) sqrt(u v) &= 1/2 u^(-1/2) v^(1/2) \
    partial / (partial v) sqrt(u v) &= 1/2 u^(1/2) v^(-1/2). $
  So the Jacobian matrix for $bf(T)$ is
  $ J_(bf(T)) = mat(1/2 u^(-3/2) v^(1/2), 1/2 u^(-1/2) v^(-1/2);
     1/2 u^(-1/2) v^(1/2), 1/2 u^(1/2) v^(-1/2)). $
]
#example[
  We can also find the Jacobian matrix of the _inverse_ map too,
  that is, the transition map $bf(T)^(-1) : cal(R) -> cal(S)$ defined by
  $ bf(T)^(-1)(x,y) = (y/x, x y). $
  In other words, this is the map that transforms $(x,y)$ into $(u,v)$.
  This is actually less painful because you don't have to deal with the square roots everywhere.
  $ partial / (partial x) (y/x) &= -y/x^2, &#h(2em) partial / (partial y) (y/x) &= 1/x \
    partial / (partial x) (x y) &= y, &#h(2em) partial / (partial y) (x y) &= x. $
  So the Jacobian matrix for $bf(T)^(-1)$ is
  $ J_(bf(T)^(-1)) = mat(-y/x^2, 1/x; y, x). $
]

Okay, now for the result.
We'll postpone giving a justification for this theorem until @sec-jacobian-picture,
since I want to have done a few concrete examples before drawing the right picture.

#memo(title: [Memorize: Change of variables])[
  Suppose you need to integrate $iint_(cal(R)) f(x,y) dif x dif y$
  and you have a transition map $bf(T)(u,v) : cal(S) -> cal(R)$.
  Then the transition map lets you change the integral as follows:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v) lr(|det J_(bf(T))|) dif u dif v $
  Alternatively, if it's easier to compute $J_(bf(T)^(-1))$, the following formula also works:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v) / (lr(|det J_(bf(T)^(-1))|)) dif u dif v $
  However, in the latter case your Jacobian determinant will have $x$ and $y$
  in it that you need to translate back into $u$ and $v$.
]
Here $|det J_(bf(T))|$ is called the *area scaling factor*:
it's the absolute value of the determinant of the Jacobian matrix.
It's indeed true that $ det J_(bf(T)^(-1)) = 1 / det(J_(bf(T))) $
which means that if your transition map has a nicer inverse than the original,
you might prefer to use that instead.

#typesig[
  The area scaling is always a _nonnegative_ real number.
]

#tip[
  You might find it easier to remember both formulas if you write
  $ dif u dif v = |det J_(bf(T))| dif x dif y $
  so it looks more like $dif u = (partial u) / (partial x) dif x$ from 18.01.
  (Indeed the 18.01 formula is the special case of a $1 times 1$ matrix!)
]

#digression(title: [Digression on what $dif u dif v$ means])[
  For 18.02, the equation $dif u dif v = |det J_(bf(T))| dif x dif y$
  is more of a mnemonic right now than an actual equation;
  that's because in 18.02 we don't give a definition of what $dif x$ or $dif y$ mean.
  It can be made into a precise statement using something called a _differential form_.
  This is out of scope for 18.02, which has the unfortunate consequence
  that I can't give a formal explanation why the change-of-variable formula works.
]

This is the analog in 18.01 when you did change of variables from $x$ to $u$
(called $u$-substitution sometimes), and you changed $dif x$ to $(dif x)/(dif u) dif u$.
In 18.02, the derivative from 18.01 is replaced by the enormous Jacobian determinant.

Let's see an example of how to carry out this integration.

#sample[
  Find the area of the region $cal(R)$ bounded by the curves
  $ x y = 16/9, #h(1em) x y = 16/25, #h(1em) x = 4 y, #h(1em) y = 4 x. $
]
#soln[
  In the previous sections we introduced variables $u = y/x$ and $v = x y$,
  and considered the region $ cal(S) = [1/4, 4] times [16/25, 16/9] $
  which were the pairs of points $(u,v)$ in that rectangle we described earlier.
  We made a transition map $bf(T) : cal(S) -> cal(R)$ written as either
  $ bf(T)(u,v) &= (sqrt(v/u), sqrt(u v)) \
    bf(T)^(-1)(x,y) &= (y/x, x y). $
  We don't like square roots, so we'll the determinant of the Jacobian matrix for $bf(T)^(-1)$, which is
  $ det (J_(bf(T)^(-1))) = det mat(-y/x^2, 1/x; y, x)
    = (- y / x^2) dot x - 1 / x dot y = - y / x - y / x = - (2 y) / (x) . $
  Since we used the upside-down version of the formula, we need to translate
  this back into $u$ and $v$ through the given formula.
  In this case since $u = y / x$, you can do it just by looking:
  $ det (J_(bf(T)^(-1))) = - 2 u. $
  $
    op("Area")(cal(R))
    &= int_(u = 1 / 4)^4 int_(v = 16 / 25)^(16 / 9) 1/lr(|det (J_(bf(T)^(-1)))|) dif v dif u \
    &= int_(u = 1 / 4)^4 int_(v = 16 / 25)^(16 / 9) 1/(2u) dif v dif u \
    &= int_(u = 1 / 4)^4 1/(2u) dot (16/9-16/25) dif u \
    &= 128/225 int_(u = 1 / 4)^4 1/(u) dif u \
    &= 128/225 (log 4 - log (1/4)) = #boxed[$ (512 log 2) / 225 $]. #qedhere
  $
]

== [TEXT] Another example: the area of a unit disk <sec-chvar-polar>

#sample[
  Show that the area of the unit disk $x^2 + y^2 <= 1$ is $pi$.
]

#soln[
  For reasons that will soon be obvious,
  we use the letters $r$ and $theta$ rather than $u$ and $v$ for this problem.
  This time our cartographer's transition map is going to be given by
  $ bf(T) : [0,1] times [0, 2pi] &-> RR^2 \
    bf(T)(r, theta) &:= (r cos theta, r sin theta). $
  You might recognize this as polar coordinates.
  This gives us a way to plot the unit disk as a rectangular map; see the figure.
  #todo[figure]
  (Careful students might notice that the points on the line segment from $(0,0)$ to $(1,0)$
  are repeated more than once under the transition map;
  again, in 18.02 we allow this repetition on the boundary.)

  We calculate the Jacobian of $bf(T)$:
  $ J_(bf(T)) = mat(
      partial / (partial r) (r cos theta),
      partial / (partial r) (r sin theta);
      partial / (partial theta) (r cos theta),
      partial / (partial theta) (r sin theta))
    = mat(cos theta, sin theta; -r sin theta, r cos theta). $
  The area scaling factor is then
  $ |det J_(bf(T))| =
    det mat(cos theta, sin theta; -r sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
  Hence, the transition map gives us the following change of variables:
  $ iint_(x^2+y^2=1) 1 dif x dif y
    = int_(r=0)^1 int_(theta=0)^(2 pi) r dif theta dif r. $
  This is easy to integrate:
  $
    int_(r=0)^1 ( int_(theta=0)^(2 pi) r dif theta) dif r
    &= int_(r=0)^1 ( 2 pi r ) dif r \
    &= 2 pi int_(r=0)^1 ( r ) dif r \
    &= 2 pi [r^2/2]_(r=0)^(r=1) = #boxed[$ pi $]. #qedhere
  $
]

== [TEXT] Example: the area of an ellipse <sec-ex-ellipse>

Once we know the area of a circle, we can also compute the area of an ellipse
by _reducing_ to the area of a circle, as follows.

#sample[
  Let $a,b > 0$ be positive real numbers
  Compute that the area inside the ellipse
  $ x^2/a^2 + y^2/b^2 = 1. $
]
#soln[
  Let $cal(R)$ be the interior of the ellipse.
  Consider the transformation $bf(T)$ defined by
  $ x = a u \ y = b v. $
  That is, $bf(T)(u,v) = (a u, b v)$.
  The Jacobian of this matrix is easy to calculate:
  $ J_(bf(T)) = mat(
    partial/(partial u) (a u), partial/(partial v) (a u);
    partial/(partial u) (b u), partial/(partial v) (b u))
    = mat(a, 0; 0, b) $
  which has determinant $a b$.

  This transformation provides a mapping between the regions
  $ bf(T) : {u^2 + v^2 <= 1} -> cal(R) = {x^2/a^2 + y^2/b^2 <= 1}. $

  Hence, via change of variables the area of $cal(R)$ is related by
  $ op("Area")(cal(R)) &= iint_(cal(R)) 1 dif x dif y \
    &= iint_(u^2+v^2 <= 1) det J_(bf(T)) dif u dif v \
    &= a b  iint_(u^2+v^2 <= 1) dif u dif v. \
    &= a b  op("Area")({u^2+v^2<=1}) = a b pi. $
]

To put this example into a picture,
the idea is that we use a change of variables to map the ellipse into a _circle_,
where the Jacobian determinant is the constant function $a b$.
That determinant factors out, and we get the result above.

== [SIDENOTE] Tip: Factoring integrals over rectangles

Especially with polar coordinates, you will often find you get an integral of the shape
$ int_(u="number")^("number") int_(v="number")^("number")
  f(u) g(v) dif v dif u $
that is, the part inside splits cleanly as the product of stuff involving $u$
and stuff involving $v$.
In that case, if you imagine actually doing the integration,
you'll find that this actually just equals
$ (int_(u="number")^("number") f(u) v dif u)
  ( int_(v="number")^("number") g(v) dif v). $

For example, consider the following easy question and solution.
#sample[
  Evaluate $ int_(x=0)^1 int_(y=0)^pi e^x sin(y) dif y dif x. $
]
#soln[
  The integral can be written as:
  $ int_(x = 0)^1 e^x (int_(y = 0)^pi sin (y) dif y) dif x . $
  The inner integral is
  $ int_(y = 0)^pi sin (y) dif y = [- cos (y)]_(y = 0)^pi = (- cos (pi)) - (- cos (0)) = (- (- 1)) - (- 1) = 1 + 1 = 2 . $
  Substitute the result back into the integral:
  $ int_(x = 0)^1 e^x dot 2 dif x = 2 int_(x = 0)^1 e^x dif x . $
  Compute the integral:
  $ int_(x = 0)^1 e^x dif x = [e^x]_(x = 0)^1 = e^1 - e^0 = e - 1 . $
  Multiply the result by 2 to get the answer $#boxed[$2(e-1)$]$.
]
If you pay attention to the solution above,
you'll notice that in fact $int_(y=0)^pi sin(y) dif y = 2$ is just a number,
and it gets pulled out of the integral right away.
So in effect, we actually have
$ int_(x=0)^1 int_(y=0)^pi e^x sin(y) dif y dif x
  = (int_(x=0)^1 e^x dif x) (int_(y=0)^pi sin(y) dif y). $
This is a bit of a convenience feature that might save a bit of headspace.
It's a tiny optimization, but it's worth pointing out.
#tip[
  Look for the common pattern
  $ int_(u="number")^("number") int_(v="number")^("number")
    f(u) g(v) dif v dif u
    = (int_(u="number")^("number") f(u) v dif u)
      ( int_(v="number")^("number") g(v) dif v). $
]
Remember, this doesn't work if either the integrand doesn't factor,
or the limits of integration aren't just numbers
(i.e. the limit of $v$ depends on $u$).

As another example of a use case, in the polar integration we just did, we have
$ int_(r=0)^1 int_(theta=0)^(2 pi) r dif theta dif r
  = (int_(r=0)^1 r dif r)(int_(theta=0)^(2 pi) theta dif theta)
  = [r^2/2]_(r=0)^(r=1) dot (2 pi) = pi. $
Polar coordinates in particular have this particular pattern a lot.

== [EXER] Exercises

#exer[
  Let $cal(R)$ be all the points on or inside the triangle
  with vertices $(0,0)$, $(1,2)$ and $(2,1)$.
  Compute $iint_(cal(R)) x y dif x dif y$.
]
