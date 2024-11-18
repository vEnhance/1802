#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 19],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [20 November 2024],
)

#quote[
  Alice: I'm going to start moving towards the door to start people moving by gravity. \
  Bob: Must be nice to be attractive. \
  Alice: I think you just called me massive. \
  Bob: Some people can't take a compliment.
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Spherical coordinates

In the mathematical notation, the spherical coordinate
transition map $(rho, phi, theta) |-> (x,y,z)$ is defined by
$
  x &= rho sin phi cos theta \
  y &= rho sin phi sin theta \
  z &= rho cos phi.
$
(Again, different books have different conventions.)
See LAMV §26.4 for a full derivation of this and figure
and the corresponding Jacobian:
$ dif V := dif x dif y dif z = rho^2 sin phi dif rho dif phi dif theta. $

= Volume

Integrate $1 dif x dif y dif z$.

= Center of mass

Note we use $delta$ instead of $rho$ to avoid conflicting with spherical coordinates.

Same deal: for a region $cal(R)$ the center of mass is the point $(dash(x), dash(y), dash(z))$ where
$
  dash(x) &:= 1/(op("mass")(cal(R))) iiint_(cal(R)) x delta(x,y,z) dif x dif y dif z \
  dash(y) &:= 1/(op("mass")(cal(R))) iiint_(cal(R)) y delta(x,y,z) dif x dif y dif z \
  dash(z) &:= 1/(op("mass")(cal(R))) iiint_(cal(R)) z delta(x,y,z) dif x dif y dif z \
  op("mass")(cal(R)) &:= iiint_(cal(R)) delta(x,y,z) dif x dif y dif z.
$

Unsurprisingly, when $delta = 1$ is constant unit density, then mass equals volume.

= Gravity

Suppose a mass of point $m$ is located at the origin $O = (0,0,0)$,
In general, given a mass $m$ at a point $O$ and a point of mass $M$ at a point $P$,
Newton's law says the gravitational force exerted by $P$ on $O$ is
$ bf(F)_("gravity") = (G m M) / (|O P|^2) dot underbrace(arrow(O P) / (|O P|), "unit vector from" O "to" P) $
where $G approx 6.6743 10^(-11) "N" "m"^2 "kg"^(-2)$ is the gravitational constant.

But in real life, we usually want our mass $M$ to be take up a whole region $cal(R)$,
with some density $delta$.
(Point masses don't occur in real life unless you count black holes.)
So let's suppose we have a solid mass taking up the region $cal(R)$.
In that case, each individual point $P=(x,y,z)$ can be thought of as contributing
$ (G m dot (delta(x,y,z) dif V))/(x^2+y^2+z^2) dot
  underbrace((angle.l x,y,z angle.r) / (sqrt(x^2+y^2+z^2)), "unit vector from" O "to" P). $
Integrating over all of $cal(R)$ gives
a gravitational vector $bf(G) = angle.l G_1, G_2, G_3 angle.r$ defined by
$
  G_1 &:= G m iiint_(cal(R)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_2 &:= G m iiint_(cal(R)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_3 &:= G m iiint_(cal(R)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
$
That is, $bf(G) = G_1 bf(e)_1 + G_2 bf(e)_2 + G_3 bf(e)_3$.
Because the $(x^2+y^2+z^2)^(3/2)$ is so awkward to work with,
you will commonly switch to spherical coordinates
so that $ (x^2 + y^2 + z^2)^(3/2) = rho^3. $
For example, the integrand for $G_3$ would be
$ (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z
  &= ((rho cos phi) delta(x,y,z))/(rho^3) (rho^2 sin phi dif rho dif phi dif theta) \
  &= delta(x,y,z) sin phi cos phi  dif rho dif phi dif theta. $



(Note the total mass $M$ of the region $cal(R)$ does not appear in these formulas!)


= Recitation questions from the official course

/ 1.: Express the triple integral $integral.triple_R f d V$ as iterated
  integrals for the region $R$ below the upper hemisphere of radius $2$:
  $z^2 lt.eq 4 - x^2 - y^2$ and above the cone $z = sqrt(x^2 + y^2)$ in
  (a) spherical coordinates; (b) cylindrical coordinates

/ 2.: Find the center of mass of a hemisphere of radius $a$, using spherical
  coordinates. Assume the density $delta = 1$.

/ 3.: Find the gravitational attraction of the region $R$ bounded above by the
  plane $z = 2$ and below by the cone $z^2 = 4 (x^2 + y^2)$,on a unit mass
  at the origin. Assume $R$ has constant density $delta = 1$.
