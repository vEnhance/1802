#import "@local/evan:1.0.0":*

= Polar coordinates

== [TEXT] Polar coordinate is a special case of change of variables

Last section one of the transition maps we used was
$ bf(T)_"polar" (r, theta) = (r cos theta, r sin theta). $
This particular  is so common that you should actually memorize its Jacobian determinant
and area scaling factor.
Remember from last section we computed
$ J_(bf(T)) &= mat(
    partial / (partial r) cos theta,
    partial / (partial r) sin theta;
    partial / (partial theta) (r cos theta),
    partial / (partial theta) (r sin theta))
  = mat(cos theta, sin theta; -r sin theta, r cos theta). \
  |det J_(bf(T))| &=
    det mat(cos theta, sin theta; -r sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
You should actually just remember the final result of this calculation
so you don't have to work it out again.
Colloquially, it can be written like so:

#memo(title: [Memorize: The Jacobian for polar coordinates])[
  When converting from Cartesian coordinates $(x,y)$ to polar coordinates $(r,theta)$
  you should replace $dif x dif y$ to $r dif r dif theta$.
  Colloquially, we write
  $ dif x dif y = r dif r dif theta. $
]

Many other sources will write $dif A$ as a shorthand for _both_:
so if you have $(x,y)$ coordinates then $dif A = dif x dif y$,
while if you have polar coordinates then $dif A = r dif r dif theta$.
(They're equal, after all.)
Again, this can be made more precise later on in life once you have access
to a new object called a _differential form_,
but for now just treat it as a mnemonic for one really common change of variables,
rather than a formal statement.

As training wheels, I'm still going to avoid writing $dif A$ for one more section,
so that when you see $dif x dif y$ or $dif y dif x$ you know you're _supposed_
to make a change of variables
(and won't accidentally write $dif r dif theta$ with the factor of $r$ missing).

The upshot is that in practice:
#idea[
  Once you remember that $dif x dif y$ turns into $r dif r dif theta$,
  you can jump into problems directly in polar coordinates,
  skipping the $x$ and $y$ altogether.
]

For example, if you want to find the area of the unit disk,
you know in polar coordinates the unit disk is $0 <= r <= 1$ and $0 <= theta <= 2pi$,
so you can just directly think via the integral
$ int_(r=0)^1 int_(theta=0)^(2 pi) r dif theta dif r $
and not even bother writing the $x y$-version $iint_(x^2+y^2<=1) dif x dif y$.
Compared to back in @sec-chvar-polar, it's the same thing;
it's just a shift in mindset where you go from
"take an $x y$-picture and translate into polar coordinates"
to "take a picture and write it directly in polar coordinates".

== [TEXT] Example: the offset circle

There's one particularly famous exercise that's often used when teaching this stuff.
I'm actually going to split it into two parts.

#sample[
  Let $cal(R)$ denote the disk of radius $1$ centered at $(1,0)$.
  Express the region $cal(R)$ in polar coordinates.
]
#soln[
  Initially we have $(x,y)$ such that
  $ (x - 1)^2 + y^2 <= 1. $
  Expanding this equation gives
  $ x^2 - 2 x + 1 + y^2 <= 1 ==> x^2 + y^2 <= 2 x . $
  In polar coordinates, $x = r cos theta$ and $y = r sin theta$, so we substitute to get
  $ r^2 <= 2 r cos theta . $
  We need $cos theta >= 0$ to be nonnegative for this to be feasible,
  and we take $-pi/2 <= theta <= pi/2$ as a result.
  In that case the condition ends up becoming $ 0 <= r <= 2 cos theta. $

  In conclusion, the answer is $cal(R)$ in polar coordinates
  is exactly $-pi/2 <= theta <= pi/2$, and $r <= 2 cos theta$.
]
In other words, the graph of $r = 2 cos theta$ is actually just an offset circle.
This is a bit of a surprise to people who are seeing it for the first time, and even a bit to me now.
But you can actually see it from the geometry too.
See @fig-polar-offset: if one lets $O=(0,0)$, $P$ be a point on the boundary of the circle,
and then let $A = (2,0)$, then you do in fact get a right triangle $triangle O P A$
with $angle P = 90 degree$, $O A = 2$, and $angle A O P = theta$.
So the geometric picture matches the calculation we just did.

#figure(
  image("figures/polar-offset.png", width: auto),
  caption: [A sketch of $(x-1)^2 + y^2 <= 1$.
    One might expect this to be nasty when converted to polar,
    but it turns out to be $r <= 2 cos theta$ for $-pi/2 <= theta <= pi/2$, which is much better than expected.],
) <fig-polar-offset>

Okay, here's the famous exercise I promised you.
#sample[
  Let $cal(R)$ denote the disk of radius $1$ centered at $(1,0)$.
  Calculate $iint_(cal(R)) sqrt(x^2+y^2) dif x dif y$.
]
#soln[
  If you try to use $x y$ integration, it's a disaster.
  But we just saw the polar coordinates for $cal(R)$ are surprisingly good.
  So of course let
  $ x = r cos theta , quad y = r sin theta . $
  In these coordinates, $sqrt(x^2 + y^2) = r$, so the integrand becomes $r$.

  As we just saw, the region $cal(R)$ consists of $-pi/2 <= theta <= pi/2$ and $0 <= r <= 2 cos(theta)$, so
  $ iint_(cal(R)) sqrt(x^2 + y^2) dif x dif y
    = int_(theta = - pi / 2)^(pi / 2) int_(r = 0)^(2 cos theta) r dot underbrace(r dif r dif theta, = dif x dif y)
    = int_(theta = - pi / 2)^(pi / 2) int_(r = 0)^(2 cos theta) r^2 dif r dif theta . $

  First, integrate with respect to $r$:
  $ int_(r = 0)^(2 cos theta) r^2 dif r = [r^3 / 3]_(r = 0)^(2 cos theta) = (2 cos theta)^3 / 3
    = (8 cos^3 theta) / (3) . $
  Now, substitute this result into the outer integral:
  $ int_(theta = - pi / 2)^(pi / 2) (8 cos^3 theta) / (3) dif theta = 8 / 3 int_(theta = - pi / 2)^(pi / 2) cos^3 theta dif theta . $

  To evaluate $int_(theta = - pi/2)^(pi / 2) cos^3 theta dif theta$,
  we need to find an antiderivative of $cos^3 theta$.
  That will require a bit of trigonometry acrobatics: the idea is to use
  $ cos^3 theta = cos theta (1 - sin^2 theta). $
  Then, set $u = sin theta$, so $dif u = cos theta dif theta$:
  $ int_(theta = -pi/2)^(pi / 2) cos^3 theta dif theta = int_(u=-1)^1 (1 - u^2) dif u = [u - u^3 / 3]_(-1)^1 = (1-1/3) - (-1+1/3) = 4/3. $

  Substitute this result back into the integral:
  $ 8 / 3 int_(theta = -pi/2)^(pi / 2) cos^3 theta dif theta = 8 / 3 dot 4 / 3 = 32 / 9 . #qedhere $
]

== [TEXT] Example: ugly square roots or $x^2+y^2$ everywhere

One other way to generate exam questions to force students to use polar coordinates
is to dump a bunch of square roots everywhere that make $x y$-integration infeasible,
thus requiring the use of polar coordinates instead.
Here's an example of what that could look like.

#sample[
  Compute the double integral
  $ int_(y=0)^3 int_(x=-sqrt(9-y^2))^(x=sqrt(9-y^2)) (x^2+y^2)^(5/2) dif x dif y. $
]
#soln[
  Because of the presence of $sqrt(9-y^2)$ and the $(x^2+y^2)^(5/2)$,
  we're practically forced to use polar coordinates.
  Indeed, the right way to think of the region we're integrating over is that it consists of
  $ 0 <= y <= 3 " and " x^2 + y^2 <= 9 $
  which is just the upper half a circle of radius $3$.
  So using polar coordinates is just obviously the right thing to do,
  because the limits of integration are amazing:
  - The region is defined by $0 <= r <= 3$ and $0 <= theta <= pi$.
  - The integrand $x^2 + y^2 = r^2$, so $(x^2 + y^2)^(5 \/ 2) = r^5$.

  Thus, the integral in polar coordinates becomes:
  $ int_(theta = 0)^pi int_(r = 0)^3 r^5 dot underbrace(r dif r dif theta, = dif x dif y)
    = int_(theta = 0)^pi int_(r = 0)^3 r^6 dif r dif theta . $

  Now, integrate with respect to $r$:
  $ int_(r = 0)^3 r^6 dif r = [r^7 / 7]_(r = 0)^3 = 3^7 / 7 = 2187 / 7 . $

  Now, integrate with respect to $theta$:
  $ int_(theta = 0)^pi 2187 / 7 dif theta = 2187 / 7 dot pi = (2187 pi) / (7) . #qedhere $
]

You could easily imagine doing something similar
with some different artificial function involving $x^2+y^2$ in some other way:
#sample[
  Compute the double integral
  $ int_(y=0)^3 int_(x=-sqrt(9-y^2))^(x=sqrt(9-y^2)) 1/(x^2+y^2+17) dif x dif y. $
]
#soln[
  The region is the same, the only change is what to do with the thing inside:
  $ 1 / (x^2 + y^2 + 17) = 1 / (r^2 + 17). $
  So, the overall integral becomes
  $ int_(theta=0)^pi int_(r=0)^3 int_(r=0)^3 1/(r^2+17) dot underbrace(r dif r dif theta, = dif x dif y). $
  Now, we evaluate the inner integral:
  $ int_(r = 0)^3 (r) / (r^2 + 17) dif r . $
  To integrate this, use the substitution $u = r^2 + 17$, so
  $dif u = 2 r dif r$ or $(d u) / (2) = r dif r$.
  When $r = 0$, $u = 17$; when $r = 3$, $u = 26$.
  The integral becomes:
  $ int_(r = 0)^3 (r) / (r^2 + 17) dif r = int_(u = 17)^26 1 / u dot (d u) / (2) = 1 / 2 int_(u = 17)^26 1 / u dif u . $
  Integrating with respect to $u$:
  $ 1 / 2 int_(u = 17)^26 1 / u dif u = 1 / 2 [log u]_(u=17)^26 = 1 / 2 (log 26 - log 17) = 1 / 2 log 26 / 17 . $

  Now, integrate with respect to $theta$:
  $ int_(theta = 0)^pi 1 / 2 log 26 / 17 dif theta = pi / 2 log 26 / 17 . #qedhere $
]

== [TEXT] Example: region described in circular terms

Another way you can force students to use polar coordinates is to give a region
which is described as a circle to begin with.
Again $x y$-coordinates are either infeasible or at least annoying.

#sample[
  The unit circle centered at $(0,0)$ is divided into four quarters by the $x$ and $y$ axes.
  Find the center of mass of the quarter-circle in the first quadrant,
  assuming a uniform density distribution.
]
#soln[
  To find the center of mass of the quarter-circle in the first quadrant,
  we consider the region bounded by $0 <= r <= 1$ and
  $0 <= theta <= pi / 2$ in polar coordinates. Since the density is
  uniform, we can use symmetry and polar coordinates to find the
  coordinates $(dash(x) , dash(y))$ of the center of mass.

  Call the quarter-circle $cal(R)$.
  The area of the quarter-circle is one-fourth of the area of the unit circle:
  $ op("Area")(cal(R)) = 1 / 4 pi . $

  In polar coordinates, the coordinates $x$ and $y$ are given by:
  $ x = r cos theta , quad y = r sin theta . $ The center of mass
  coordinates $(dash(x) , dash(y))$ are given by
  $ dash(x) = 1 / (op("Area")(cal(R))) iint_cal(R) x dif x dif y ,
    quad dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif x dif y . $

  Since $dif x dif y = r dif r dif theta$, we can express
  $iint_cal(R) x dif x dif y$ and $iint_cal(R) y dif x dif y$ as follows:

  For $dash(x)$, we have:
  $ iint_cal(R) x dif x dif y = int_(theta = 0)^(pi / 2) int_(r = 0)^1 r cos theta dot r dif r dif theta = int_(theta = 0)^(pi / 2) cos theta int_(r = 0)^1 r^2 dif r dif theta . $

  First, integrate with respect to $r$:
  $ int_(r = 0)^1 r^2 dif r = [r^3 / 3]_(r = 0)^1 = 1 / 3 . $

  Thus,
  $ iint_cal(R) x dif x dif y = int_(theta = 0)^(pi / 2) cos theta dot 1 / 3 dif theta = 1 / 3 int_(theta = 0)^(pi / 2) cos theta dif theta . $

  Now, integrate with respect to $theta$:
  $ int_(theta = 0)^(pi / 2) cos theta dif theta = [sin theta]_(theta=0)^(pi / 2) = sin(pi/2) - sin(0) = 1 . $

  So, $ iint_cal(R) x dif x dif y = 1 / 3 . $

  Therefore,
  $ dash(x) = 1 / (op("Area")(cal(R))) iint_cal(R) x dif x dif y = 1 / (pi / 4) dot 1 / 3 = (4) / (3 pi) . $

  By symmetry, the calculation for $dash(y)$ will be identical, since the
  quarter-circle region is symmetric about the line $y = x$:
  $ dash(y) = 1 / (op("Area")(cal(R))) iint_cal(R) y dif x dif y = (4) / (3 pi) . $
  Hence, the final answer is
  $ (dash(x) , dash(y)) = ((4) / (3 pi) , (4) / (3 pi)). #qedhere $
]


== [EXER] Exercises

#exer[
  Compute
  $ int_(x=0)^(1) int_(y=0)^(sqrt(1-x^2)) x y dif y dif x. $
]

#exer[
  Compute
  $ iint_(x^2+(y-1)^2 <= 1) 1/sqrt(x^2+y^2) dif x dif y. $
]

#exerstar[
  Compute $ iint_(x^2+y^2 <= 1) sqrt((x+3/5)^2 + (y+4/5)^2) dif x dif y. $
]