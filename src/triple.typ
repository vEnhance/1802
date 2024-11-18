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
- If $rho : cal(R) -> RR$ is a density function for a 3D space, then
  $ op("Mass")(cal(R)) := iiint_(cal(R)) rho(x,y,z) dif x dif y dif z $ is the total mass.
- The center of mass is given by three coordinates now:
  $ (
    (iiint_(cal(R)) x dot rho(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R))),
    (iiint_(cal(R)) y dot rho(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R))),
    (iiint_(cal(R)) z dot rho(x,y,z) dif x dif y dif z) / (op("Mass")(cal(R)))
  ). $

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
(Technically, we maybe should use a different letter for the new $z$,
but since they're equal we just use the same letter in both places.)

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

Note that mathematicians and physicists use different notations;
check the book you're using for your class.
For us,
$
  rho &:= "distance to" (0,0,0) \
  phi &:= "angle down" z" axis" \
  theta &:= "same as in polar coordinates".
$
Greek letter names: rho, phi, theta.
And $phi$, which is `\varphi` in LaTeX, can also be written as $phi.alt$,
which is `\phi` in LaTeX.

The idea is that the projection of your point $P$ onto the $x y$-plane
will have polar coordinates $(r cos theta, r sin theta)$.
But then rather than using $z$ to lift the point straight up,
you rotate via some angle $phi$, getting a new distance $rho$ such that $r = rho sin phi$.
See the figure #todo[figure]

Because of the right triangle with angle $phi$, hypotenuse $rho$,
and legs $r$ and $z$, we have
$ r &= rho sin phi \
  z &= rho cos phi. $
So unwinding everything, the transition map $(rho, phi, theta) |-> (x,y,z)$ is defined by
$
  x &= rho sin phi cos theta \
  y &= rho sin phi sin theta \
  z &= rho cos phi.
$
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
