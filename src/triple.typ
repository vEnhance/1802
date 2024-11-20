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

#soln[
  Both inequalities must be satisfied simultaneously. Notice that for a
  fixed $x$, both $y$ and $z$ are bounded by:
  $ y^2 <= 1 - x^2 ==> - sqrt(1 - x^2) <= y <= sqrt(1 - x^2) , $
  $ z^2 <= 1 - x^2 ==> - sqrt(1 - x^2) <= z <= sqrt(1 - x^2) . $
  The variable $x$ ranges from $- 1$ to $1$.

  Hence, we will write this as a triple integral
  $ op("Vol")(cal(R))
    &= int_(x=-1)^1
      int_(y=-sqrt(1-x^2))^(sqrt(1-x^2))
      int_(z=-sqrt(1-x^2))^(sqrt(1-x^2)) 1 dif z dif y dif x \
    &= int_(x=-1)^1
      int_(y=-sqrt(1-x^2))^(sqrt(1-x^2))
      2sqrt(1-x^2) dif y dif x \
    &= int_(x=-1)^1
      2sqrt(1-x^2)
      int_(y=-sqrt(1-x^2))^(sqrt(1-x^2)) 1 dif y dif x \
    &= int_(x=-1)^1
      2sqrt(1-x^2) dot 2sqrt(1-x^2) dif x \
    &= int_(x=-1)^1 4(1-x^2) dif x \
    &= 4[x - x^3 / 3]_(x=-1)^1 = 4[(1 - 1 / 3) - (-1 + 1/3)] = #boxed[$ 16 /3 $]. $
]
#digression(title: [Digression on picture])[
  If you draw a picture of the region,
  you get the intersection of these two cylinders
  which forms something apparently called a _Steinmetz solid_.

  Surprisingly, you actually _don't_ want to use polar (or cylindrical) coordinates
  on this example.
  If you try to do so, I think you'll actually get stuck.
  Straight $x y z$-integration turns out to work because of the magical
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

There's actually nothing new happening here ---
it's just polar coordinates with $z$ tacked on.#footnote[
  Technically, we maybe should use a different letter for the new $z$,
  but since they're equal we just use the same letter in both places.
  Also, in principle, I could also introduce a notation $(r, theta, z)_"cyl"$
  analogous to $(r, theta)_"pol"$,
  but I don't think I'll have a need to do so.
]
The transition map
$ (r, theta, z) |-> (x, y, z)$ is given by
$
  x &= r cos theta \
  y &= r sin theta \
  z &= z.
$
This is illustrated in @fig-triple-cylinder.

#figure(
  image("figures/triple-cylinder.svg", width: auto),
  caption: [Picture of cylindrical coordinates.
    The $x y$-plane (now drawn as "flat" is just polar coordinates,
    as suggested by the blue circle.
    And then we tack on a height $z$.],
) <fig-triple-cylinder>

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
you will commonly do a certain change-of-variables called _spherical coordinates_.
We'll explain this in the next section, @sec-sph.


== [EXER] Exercises
