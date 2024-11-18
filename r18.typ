#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 18],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [18 November 2024],
)


#quote(attribution: [Sneakers (1992)])[
  Mary: Wait a second. You can have anything you want, and you're asking for my phone number? \
  Carl: Yes. \
  Mary: 273-9164. Area code 415.
  ]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Triple integrals

You probably already saw me do some triple integrals in this class already.
They're the same as double integrals with one extra integral,
and so you shouldn't have to do much differently than before.

You can also do _change of variables_ with three variables totally fine, in principle.
But your Jacobian is $3 times 3$, so evaluating it is annoying.
Hence here are two examples whose Jacobian determinants you should just remember,
because they come up often (like how we just remembered $dif A = dif r dif theta$ in polar).

== Cylindrical coordinates

There's actually nothing new happening here --- it's just polar coordinates
with $z$ tacked on.
$
  x &= r cos theta \
  y &= r sin theta \
  z &= z.
$
The volume scaling factor is unsurprisingly the same as the one for 2D polar coordinates,
and you may have used it implicitly on some previous problem sets already:
#memo[
  $ dif V := dif x dif y dif z = r dif r dif theta dif z. $
]
If you want to see this fully explicitly, you could compute the Jacobian
$
  det mat(
    (partial x) / (partial r), (partial x) / (partial theta), (partial x) / (partial z);
    (partial y) / (partial r), (partial y) / (partial theta), (partial y) / (partial z);
    (partial z) / (partial r), (partial z) / (partial theta), (partial z) / (partial z);
  )
  = det mat(
    cos theta, - r sin theta, 0;
    sin theta, r cos theta, 0;
    0, 0, 1
  )
  = det mat(cos theta, - r sin theta; sin theta, r cos theta)
  = r.
$

== Spherical coordinates (tomorrow)

I _hope_ we match Poonen's conventions, in @fig-poonen-spherical.
(Mathematicians and physicists use different notations.)
/*
$
  rho &:= "distance to" (0,0,0) \
  phi &:= "angle down" z" axis" \
  theta &:= "same as in polar coordinates".
$
*/
// (Different authors don't always agree. Greek lesson: rho, phi, theta.)
The idea is that the projection of your point $P$ onto the $x y$-plane
will have polar coordinates $(r cos theta, r sin theta)$.
But then rather than using $z$ to lift the point straight up,
you rotate via some angle $phi$, getting a new distance $rho$ such that
$r = rho sin phi$.
#figure(
  image("media/poonen-spherical.png", width: 50%),
  caption: [Spherical coordinates diagram from Poonen's notes.],
) <fig-poonen-spherical>
Explicitly, the transition map $(rho, phi, theta) |-> (x,y,z)$ is defined by
$
  x &= rho sin phi cos theta \
  y &= rho sin phi sin theta \
  z &= rho cos phi.
$
To get the area scaling factor, we would compute the Jacobian
$det mat(
    (partial x) / (partial rho), (partial x) / (partial phi), (partial x) / (partial theta);
    (partial y) / (partial rho), (partial y) / (partial phi), (partial y) / (partial theta);
    (partial z) / (partial rho), (partial z) / (partial phi), (partial z) / (partial theta);
)$.
I'll do this on Wednesday, but spoiler, it turns out to be $rho^2 sin phi$.

= Questions from official recitation

/ 1.: Let $T$ be the region that is bounded by the surface $x = y^2$, and the
  planes $z = 0$ and $x + z = 1$. Sketch $T$ and describe the projections
  of $T$ onto the $x y$, $x z$ and $y z$-plane. Using one of those
  projections (any one!), calculate the volume $integral.triple_T dif V$.

/ 2.: Consider the integral $integral.triple_R (2 - 2 z) dif V$ where $R$ is
  the pyramid with square base $- 1 lt.eq x lt.eq 1$ and
  $- 1 lt.eq y lt.eq 1$ in the $x y$-plane and vertex at $(0 , 0 , 1)$.
  Draw a picture of $R$ and describe the cross sections of $R$ for a fixed
  value of $z$. Use this to evaluate the integral by integrating with
  respect to $x$, then $y$, then $z$.

/ 3.: Using cylindrical coordinates, evaluate $integral.triple_D y^2 dif V$,
  where $D$ is the region of points $(x , y , z)$ such that
  $x^2 + y^2 lt.eq 1$, $z gt.eq 0$, and $z^2 lt.eq 4 x^2 + 4 y^2$.

/ 4.: Evaluate the integral $integral.triple_C dif V$ where $C$ is the region
  bounded below by the cone $z = sqrt(x^2 + y^2)$ and above by the
  paraboloid $z = 2 - x^2 - y^2$.
