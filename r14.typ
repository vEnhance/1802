#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 14],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [26 October 2024],
)

#quote(attribution: [Hobbes from Calvin and Hobbes])[The real fun of living wisely is that you get to be smug about it.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- You can vote on times for review session 3 at #url("https://forms.gle/Xh8B5C2tPVtD5xDU6").
  - I'm amazed so many people check their email minute-ly on a Sunday morning.
- LAMV had a wrong version of change of formulas for a week-ish. Fair warning.
- Wednesday's recitation will have Lichen as a guest instructor.
  (I'll be in the audience.)

= From last time

If you missed Wednesday's recitation, some advice:

- For this class, take $dif A$ as a shorthand for $dif x dif y$. (See LAMV 25.1.)
- The result $dif x dif y = r dif r dif theta$ is a special case of _change of variables_,
  covered in tomorrow's lecture and recitation on Wednesday (led by Lichen).
- Write regions as inequalities, e.g. if you have the region cut out by $y=x^2$ and $y=x+2$,
  I would prefer to write $y >= x^2$ (above parabola) and $y <= x+2$ (below line).
- I suggest writing the variables into the integration signs, e.g.,
  rather than $int_0^2 int_(y/2)^1 e^(-x^2) dif x dif y$
  I think this is clearer as $int_(y=0)^2 int_(x=y/2)^1 e^(-x^2) dif x dif y$.
  This prevents you from having to read the $dif x dif y$ at the end backwards,
  and lets you get away with just writing $dif A$ for shorthand.

= Polar coordinates is a special case of change of variables (tmrw)

The map
$ bf(T)_"polar" (r, theta) = (r cos theta, r sin theta). $
is so common you may as well memorize its Jacobian:
$ J_(bf(T)) &= mat(
    partial / (partial r) cos theta,
    partial / (partial r) sin theta;
    partial / (partial theta) (r cos theta),
    partial / (partial theta) (r sin theta))
  = mat(cos theta, sin theta; -r sin theta, r cos theta). \
  |det J_(bf(T))| &=
    det mat(cos theta, sin theta; -r sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
So by change-of-variables (covered tomorrow), we get the following.
This particular change is so common you should memorize it so you don't have
to re-compute the Jacobian above all the time.
#memo(title: [Memorize: Change-of-variables Jacobian for polar coordinates])[
  $ dif x dif y = r dif r dif theta. $
]

Many other sources will write $dif A$ as a shorthand for _both_:
so if you have Cartesian $(x,y)$ coordinates then $dif A := dif x dif y$,
while if you have polar coordinates then $dif A = r dif r dif theta$.
(They're equal, after all.)
If you are worried about forgetting the factor of $r$,
you can write $dif x dif y$ or $dif y dif x$ you know you're _supposed_ to make a change of variables
(and won't accidentally write $dif r dif theta$ with the factor of $r$ missing).
See LAMV §25 for more on shorthand.

= Recipes (see LAMV §22 for details)

#recipe(title: [Recipe for total mass and center of mass])[
  Suppose $cal(R)$ is a region and $rho$ is a density function for the region.
  The total mass is given by $op("mass")(cal(R)) = iint_(cal(R)) rho(x,y) dif x dif y. $
  The center of mass is given by the point
  $ (dash(x), dash(y)) := lr(( (iint_(cal(R)) x dot rho(x,y) dif x dif y) / (op("mass")(cal(R))),
    (iint_(cal(R)) y dot rho(x,y) dif x dif y) / (op("mass")(cal(R))))). $
]

#recipe(title: [Recipe for swapping the order of integration])[
  Given $int_(x=?)^? int_(y=?)^? f(x,y) dif y dif x$,
  to switch the order of integration the other way:

  1. Convert the limits of integration _back_ into inequality format,
    writing the region $cal(R)$.
  2. Re-apply the recipe from last recitation using the other variable as the outer one now.
]

Also, check §24.2 LAMV (example on offset circle) for one common shape
that shows up a lot in problem sets / exams (e.g. in Q3/Q4 below and at least one pset question, albeit rotated).

= Recitation questions from official course

/ 1.: Evaluate#footnote[Note the real course will probably say $int_0^2 int_(y \/ 2)^1 e^(- x^2) dif x dif y$ and make you read backwards.]
   the iterated integral
  $int_(y=0)^2 int_(x=y \/ 2)^1 e^(- x^2) dif A$.
/ 2.: Evaluate the integral $ iint_D (d A) / (3 + x^2 + y^2) $
  where $D$ is the region such that $x >= 0$, $y >= 0$ and
  $x^2 + y^2 <= 9$.
/ 3.: A shape has a density given by $delta (x , y) = sqrt(x^2 + y^2)$. What
  is the mass of the shape defined by $x^2 + (y - 1)^2 <= 1$?
/ 4.: Evaluate the integral
  $ iint_D frac(d A, sqrt(1 - x^2 - y^2)) $ where $D$ is the
  region such that $x >= 0$ and $x^2 + (y - 1 \/ 2)^2 <= 1 \/ 4$.
