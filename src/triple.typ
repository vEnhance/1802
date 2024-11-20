#import "@local/evan:1.0.0":*

= Triple integrals <sec-triple>

We're going to now consider integrals with three variables, rather than two.
If you understood double integrals, then triple integrals is more of the same:
#idea[
  All the two-variable stuff ports over to three-variable stuff in the obvious way.
]

== [RECAP] Recap of triple integrals

I'm cheekily calling this section a "recap" to emphasize that there's nothing new to learn here.
Everything in the below list corresponds to a double integral thing you learned
except with two variables rather than three.

- Over a rectangular prism,
  we still integrate $int_(x = a_1)^(b_1) int_(y = a_2)^(b_2) int_(z = a_3)^(b_3) f(x,y,z) dif z dif y dif x$
  one variable at a time.
- You can use $ dif V := dif x dif y dif z $ as a shorthand if you want;
  this is the last row of @table-shorthand.
- Instead of $x y$ integration we have $x y z$-integration.
  Whereas for double integrations you had two choices ($x$ outer and $y$ inner vs. $y$ outer and $x$ inner),
  now you have $3! = 6$ choices for the order to do things in:
  - $x$ outermost, $y$ middle, $z$ inner
  - $x$ outermost, $z$ middle, $y$ inner
  - $y$ outermost, $x$ middle, $z$ inner
  - $y$ outermost, $z$ middle, $x$ inner
  - $z$ outermost, $x$ middle, $y$ inner
  - $z$ outermost, $y$ middle, $x$ inner.
  The idea is the same if you have a region that isn't a rectangular prism:
  write your region as inequalities.
- The change of variables formula is exactly the same, where the Jacobian is now a $3 times 3$ matrix:
  if $bf(T) : cal(S) -> cal(R)$ is a transition map of 3D regions, sending $(u,v,w)$ to $(x,y,z)$,
  then the Jacobian is
  $ J_(bf(T)) = mat(
      (partial u) / (partial x), (partial v) / (partial x), (partial w) / (partial x);
      (partial u) / (partial y), (partial v) / (partial y), (partial w) / (partial y);
      (partial u) / (partial z), (partial v) / (partial z), (partial w) / (partial z);
    ). $
- Volume is $ op("Vol")(cal(R)) := iiint_(cal(R)) dif x dif y dif z. $
  You can take this as a _definition_ of volume for this class.
- If $delta : cal(R) -> RR$ is a density function for a 3D space, then
  $ op("Mass")(cal(R)) := iiint_(cal(R)) delta(x,y,z) dif x dif y dif z $ is the total mass.
  The center of mass is given by three coordinates now:
  $ (
    (iiint_(cal(R)) x dot delta(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R))),
    (iiint_(cal(R)) y dot delta(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R))),
    (iiint_(cal(R)) z dot delta(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R)))
  ). $
  (We use $delta$ instead of $rho$ for 3D typically,
  because $rho$ gets used in spherical coordinates.)

== [TEXT] Examples of triple integrals

#sample[
  Compute the volume of the region bounded by $x^2 + y^2 <= 1$ and $x^2 + z^2 <= 1$.
]

#sample[
  Compute the volume of the region bounded by the surfaces
  $z = 3(x^2+y^2)$ and $z = 72 - 5(x^2+y^2)$.
]

#sample[
  Compute the volume and center of mass of the cone
  defined by $z^2 <= 9(x^2 + y^2)$ and $0 <= z <= 5$,
  assuming uniform density distribution.
]

== [TEXT] Cylindrical coordinates

There's actually nothing new happening here --- it's just polar coordinates with $z$ tacked on.
The transition map
$ (r, theta, z) |-> (x, y, z)$ is given by
$
  x &= r cos theta \
  y &= r sin theta \
  z &= z.
$
Technically, we maybe should use a different letter for the new $z$,
but since they're equal we just use the same letter in both places.
In principle, I could also introduce a notation $(r, theta, z)_"cyl"$
analogous to $(r, theta)_"pol"$,
but I don't think I'll have a need to do so.

#figure(
  image("figures/triple-cylinder.svg", width: auto),
  caption: [Picture of cylindrical coordinates.
    The $x y$-plane (now drawn as "flat" is just polar coordinates,
    as suggested by the blue circle.
    And then we tack on a height $z$.],
)

The volume scaling factor is unsurprisingly the same as the one for 2D polar coordinates,
and you may have used it implicitly on some previous problem sets already:
#memo(title: [Memorize: Scaling factor for cylindrical coordinates])[
  $ dif V := dif x dif y dif z = r dif r dif theta dif z. $
]
If you want to see this fully explicitly, you could compute the Jacobian
$
  det J_("polar") &=
  det mat(
    (partial x) / (partial r), (partial x) / (partial theta), (partial x) / (partial z);
    (partial y) / (partial r), (partial y) / (partial theta), (partial y) / (partial z);
    (partial z) / (partial r), (partial z) / (partial theta), (partial z) / (partial z);
  ) \
  &= det mat(
    cos theta, - r sin theta, 0;
    sin theta, r cos theta, 0;
    0, 0, 1
  )
  = det mat(cos theta, - r sin theta; sin theta, r cos theta) \
  &= r.
$

== [TEXT] Spherical coordinates

#warning(title: [Warning: There are competing standards, check your book])[
  Note that mathematicians and physicists use different notations;
  check the book you're using for your class.
  For us, the letter names are going to mean
  $
    rho &:= "distance to" (0,0,0) \
    phi &:= "angle down" z" axis" \
    theta &:= "same as in polar coordinates".
  $
  Greek letter names: rho, phi, theta.
  Also note that the Greek letter $phi$ may be written as $phi.alt$ in different fonts.
  (If you use LaTeX, these are `\varphi` and `\phi`.
]

The idea behind spherical coordinates is that the projection of your point $P$ onto the $x y$-plane
will have polar coordinates $(r cos theta, r sin theta)$.
But then rather than using $z$ to lift the point straight up,
you rotate via some angle $phi$, getting a new distance $rho$ such that $r = rho sin phi$.
See the figure below.
#figure(
  image("figures/triple-sphere.svg", width: auto),
  caption: [Spherical coordinates],
)

Because of the right triangle with angle $phi$, hypotenuse $rho$,
and legs $r$ and $z$, we have
$ r &= rho sin phi \
  z &= rho cos phi. $
So unwinding everything, the transition map $(rho, phi, theta) |-> (x,y,z)$
is given by
$
  x &= rho sin phi cos theta \
  y &= rho sin phi sin theta \
  z &= rho cos phi.
$
Just like how I wrote $(r, theta)_"pol"$ for polar if I needed to be more concise,
we'll have the analogous shorthand here:
#definition(title: [Definition of spherical coordinates])[
  We define spherical coordinates by
  $ (rho, phi, theta)_"sph" := (rho sin phi cos theta, rho sin phi sin theta, rho cos phi). $
]
Now, in order to integrate over this, there's supposed to be a change of variables
with some Jacobian.
To get the area scaling factor, we would compute the Jacobian
$
  det J_("spherical") = det mat(
    (partial x) / (partial rho), (partial x) / (partial phi), (partial x) / (partial theta);
    (partial y) / (partial rho), (partial y) / (partial phi), (partial y) / (partial theta);
    (partial z) / (partial rho), (partial z) / (partial phi), (partial z) / (partial theta);
  ).
$
This takes some effort,
so you probably should only do this once in your life and then remember the result.
It works out to
$
  det J_("spherical")
  &=
  det mat(
    sin phi cos theta, rho cos phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho cos phi sin theta, rho sin phi cos theta;
    cos phi, - rho sin phi, 0
  ) \
  &=
  cos phi
  det mat( rho cos phi cos theta, - rho sin phi sin theta;
    rho cos phi sin theta, rho sin phi cos theta;)
  + rho sin phi
  det mat(
    sin phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho sin phi cos theta;
  ) \
  &=
  cos phi (rho^2 cos phi sin phi) (cos^2 theta + sin^2 theta)
  + rho sin phi (sin^2 phi) (cos^2 theta + sin^2 theta) \
  &= rho^2 sin phi (cos^2 phi + sin^2 phi) \
  &= rho^2 sin phi.
$
I tried to do this calculation during recitation and got stuck at the board;
not the kind of thing I'm good at.
You really don't want to redo this calculation on an exam, so just remember the result.
#memo(title: [Memorize: Scaling factor for spherical coordinates])[
  $ dif V := dif x dif y dif z = rho^2 sin phi dif rho dif phi dif theta. $
]

== [TEXT] Gravity

#typesig[
  Gravitational force is a vector.
]

Suppose a mass of point $m$ is located at the origin $O = (0,0,0)$,
In general, given a mass $m$ at a point $O$ and a point of mass $M$ at a point $P$,
Newton's law says the gravitational force exerted by $P$ on $O$ is
$ bf(F)_("gravity") = (G dot m dot M)
  / (|O P|^2) dot underbrace(arrow(O P) / (|O P|), "unit vector from" O "to" P) $
where $G approx 6.67408 dot 10^(-11) dot upright("N") dot upright("m")^2 dot "kg"^(-2)$ is the gravitational constant.

But in real life, we usually want our mass $M$ to be take up a whole region $cal(R)$,
with some density $delta$.
(Point masses don't occur in real life unless you count black holes.)
So let's suppose we have a solid mass occupying region $cal(R)$.
In that case, each individual point $P=(x,y,z)$ in $cal(R)$ can be thought of a _vector_
$ "Gravity exerted by" (x,y,z) "on" (0,0,0) = (G m dot (delta(x,y,z) dif V))/(x^2+y^2+z^2) dot
  underbrace((angle.l x,y,z angle.r) / (sqrt(x^2+y^2+z^2)), "unit vector from" O "to" P). $
The total gravitational force is then the integral of this over the entire mass $cal(R)$.
#figure(
  image("figures/triple-gravity.svg", width: auto),
  caption: [
    The force of gravity exerted by a large mass $cal(R)$ such as the sun on a point mass of mass $m$.
    Each individual point like $P$ or $Q$ in the region $cal(R)$ exerts a tiny force on the point mass of mass $m$.
    The total gravitational force is the sum (integral) across the whole region $cal(R)$.
  ],
)

So the total gravitational force is nominally
#eqn[
  $ bf(G) = int_(cal(R)) (G m dot (delta(x,y,z) dif V))/(x^2+y^2+z^2) dot (angle.l x,y,z angle.r) / (sqrt(x^2+y^2+z^2)). $
  <eqn-gravity>
]

Now, if you have been following my advice to always audit type safety,
then you should stop me right here.
This is the first time in the entire notes that I've had an integral
where the integrand is a _vector_ rather than the number.
What's going on?

The general answer is that you should just do everything component wise.
But to keep things simple for the course, I will never use @eqn-gravity in that form,
so that our integrands always have type number rather than type vector.
To do this, I'll rewrite @eqn-gravity as follows:
#memo(title: [Memorize: Gravitational attraction of a region on the origin])[
  Suppose $cal(R)$ is a region with density function $delta$.
  The gravitational vector $bf(G) = angle.l G_1, G_2, G_3 angle.r$
  on the origin is defined by
  $
    G_1 &:= G m iiint_(cal(R)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    G_2 &:= G m iiint_(cal(R)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    G_3 &:= G m iiint_(cal(R)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
  $
  That is, $bf(G) = G_1 bf(e)_1 + G_2 bf(e)_2 + G_3 bf(e)_3$.
]
Now $G_1$, $G_2$, $G_3$ are integrals of numbers again, so we're fine.

Because the $(x^2+y^2+z^2)^(3/2)$ is so awkward to work with,
you will commonly switch to spherical coordinates
so that $ (x^2 + y^2 + z^2)^(3/2) = rho^3. $
For example, the integrand for $G_3$ would be
$ (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z
  &= ((rho cos phi) delta(x,y,z))/(rho^3) (rho^2 sin phi dif rho dif phi dif theta) \
  &= delta(x,y,z) sin phi cos phi  dif rho dif phi dif theta. $

== [EXER] Exercises
