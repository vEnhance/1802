#import "@local/evan:1.0.0":*

= Parametrizing surfaces <ch-psurf>

== [TEXT] Parametrizing surfaces

We now move on to parametrizing surfaces.
This will require a bit more to get used to compared to parametrizing curves,
because now there are two variables instead of one.

To draw a contrast, remember that back when we were parametrizing curves
all the way back in @ch-param, you wrote the notation $bf(r)(t)$
and usually thought of the parameter $t$ as a "time".
So you could imagine that a curve in $RR^2$ or $RR^3$ lets you carve out a 1D curve
$bf(r) : RR -> RR^n$ by considering a _timeline_ as the input variable.
See @fig-param-timeline again.

In contrast, for 2D surfaces in $RR^3$, we are going to need two variables:
#idea[
  We will describe surfaces as images of some function
  $bf(r)(u,v) : cal(R) -> RR^3$
  where $cal(R)$ is some region in $RR^2$; see @fig-psurf-mesh.
]
The time analogy breaks down, so I'm going to use a different analogy:
gridlines from a map, like longitude and latitude.
This is actually going to be the same analogy we used in @sec-chvar-transition,
when we presented transition maps from change of variables.
The only difference is that in @sec-chvar-transition,
we used 2D paper to plot out a weird region that also lived in 2D space.
But when parametrizing a surface, we're going to use 2D paper, represented as region $cal(R)$,
to draw a 2D surface that lives in 3D space, which we denote by $cal(S)$.

#typesig[
  To emphasize the types going on here, suppose $cal(S)$ is a surface in 3D space.
  Then to parametrize a 2D surface you need to specify a 2D region $cal(R)$ in $RR^2$
  and then write down a function $bf(r) : cal(R) -> RR^3$
  in two variables $bf(r)(u,v)$ for $(u,v)$ in the region $cal(R)$
  which covers all the points in $cal(S)$.
]

#warning[
  Here $cal(R)$ is a region in $RR^2$ used for the parametrization, often a rectangle.
  It is _not_ the surface $cal(S)$ whose surface area is being calculated;
  (and for 2D surfaces in 3D space we'll usually prefer the letter $cal(S)$
  so that it doesn't look like a region).
]

A cartoon of the situation is shown in @fig-psurf-mesh.
This picture is really important to understand, so take a while to let it sink in.

#figure(
  image("figures/psurf-mesh.svg", width: auto),
  caption: [
    Illustration of how to think of a parametrization conceptually, using cartography.
    Imagine a piece of paper $cal(R)$ showing the surface $cal(S)$ as it lives in space.
    (In this cartoon, $cal(S)$ might be described as a mountain range.)
    A pair $(u,v)$ on the paper could be thought of like longitude and latitude;
    it should mark some point $bf(r)(u,v)$ on the surface $cal(S)$.
    Hence we write parametrizations as $bf(r) : cal(R) -> RR^3$
    and identify $cal(S)$ with $bf(r)$.
  ],
) <fig-psurf-mesh>

== [TEXT] Examples of parametrized surfaces

In fact, the Earth is another good example because spherical coordinates gives you
a parametrization that uses a rectangular sheet of paper.

#example(title: [Example of a parametrization: the spherical Earth])[
  Consider the surface of the unit sphere, say $x^2 + y^2 + z^2 = 1$.
  One parametrization $bf(r)$ is given from the spherical coordinate system by
  $ bf(r) (phi, theta) = (sin phi cos theta , phi sin theta , cos phi) $
  across the range $0 <= phi <= pi$ and $0 <= theta < 2 pi$.
  That is, as $theta$ and $phi$ vary across these ranges,
  we get every point on the sphere exactly once.
  See @fig-psurf-lonlat.
]

#figure(
  [
    #image("figures/psurf-lonlat1.svg", width: auto)
    #image("figures/psurf-lonlat2.svg", width: auto)
  ],
  caption: [
    Consider a unit sphere; then the parametrization
    $bf(r) (phi, theta) = (sin phi cos theta , phi sin theta , cos phi)$
    corresponds to longitude and latitude.
    In this cartoon, one should imagine the yellow sheet of paper being a map of the Earth,
    drawn in green.
    The blue and red gridlines on the sheet of paper trace out
    longitude and latitude lines on the Earth.
    (The piece of paper is rotated to have $theta$ on the bottom and $phi$ on the left,
    to make it look a bit more natural.)
  ],
) <fig-psurf-lonlat>

If this feels familiar, it's because we used more or less
the same analogy for change of variables --- cartography.
The Earth is round, but you can still draw a rectangular world map.
So what we call $bf(r)(u,v)$ here is playing the same role
that our transition map $bf(T)$ did back when we did change-of-variables.
The only difference is that in change of variables, we had $bf(T) : RR^2 -> RR^2$
in the 2D case and $bf(T) : RR^3 -> RR^3$ in the 3D case.
But for parametrizing a surface in $RR^3$, we have $bf(r) : RR^2 -> RR^3$ instead.
(That is, in change-of-variables we make a $n$-dimensional map of an $n$-dimensional region,
but here we make a $2$-dimensional map of a surface living in $RR^3$.)

#example(title: [Example: A hemisphere whose map is printed on circular paper])[
  In both @fig-psurf-mesh and @fig-psurf-lonlat we used rectangular paper.
  But we could easily use non-rectangular paper as well.
  For example, suppose $cal(R)$ is the region $x^2+y^2 <= 1$ and we consider the surface
  $ bf(r)(x,y) = ( x, y, sqrt(1-(x^2+y^2)) ). $
  Then this would give us a parametrization of a _hemisphere_:
  the part of the sphere $x^2+y^2+z^2=1$ with $z >= 0$.
  Pictorially, this corresponds to drawing a circular map of the Northern hemisphere
  by taking a birds-eye view from the North pole.
  See @fig-north-hemisphere.
]

#figure(
  image("media/north-hemisphere.svg", width: 11cm),
  caption: [
    The northern hemisphere of the Earth, drawn on a 2D piece of paper.
    Image adapted from #link("https://w.wiki/CWcn")[the public domain].
  ],
) <fig-north-hemisphere>


#remark(title: [Remark: Graphs of functions are a common kind of surface])[
  Note in the example we just did in @fig-north-hemisphere,
  we chose the variable names $x$ and $y$ rather than $u$ and $v$
  since they match the $x$-component and $y$-component of $bf(r)(x,y)$,
  giving us fewer different letters to juggle.
  And we'll do this in general: if our parametrization would _a priori_ be written as
  $ bf(r)(u,v) = angle.l u, v, f(u,v) angle.r $
  for $(u,v)$ in some region $cal(R)$, then we'll usually prefer to use the variable names
  $ bf(r)(x,y) = angle.l x, y, f(x,y) angle.r $
  instead.

  This happens quite often.
  Such surfaces are sometimes called *graphs* of the function $f$,
  because you think of them as the portions of the plots of $z = f(x,y)$
  for some function $f : cal(R) -> RR$.
  We'll give two more examples in a moment.
]

#example(title: [Another example of a graph: the plane $x + 2 y + 3 z = 6$ with $x,y,z >= 0$])[
  As another example, let's consider the part of the plane $x + 2 y + 3 z = 6$
  that lies in the first octant $x,y,z >= 0$.
  It's drawn in the right half of @fig-psurf-plane.

  To parametrize it, we'll again use the "graph" idea again:
  we imagine projecting our surface directly down to the $x y$-plane (where $z = 0$)
  and then our piece of paper is whatever points are in the shadow.
  In this case, our region $cal(R)$ is the part of the $x y$-plane
  cut out by $x,y >= 0$ and $x + 2y <= 6$, shown in the left half of @fig-psurf-plane.
  The equation parametrization is then given exactly by
  $ bf(r)(x,y) = (x, y, (6-x-2y)/3). $
  Optionally, one can draw the region $cal(R)$ into the 3D sketch too;
  this is the shaded bottom triangle in the right half of @fig-psurf-plane.
]

#figure(
  image("figures/psurf-plane.svg", width: auto),
  caption: [
    The part of the plane $x+2y+3z=6$ being parametrized by its projection to the $x y$-plane.
    Because we're viewing the plane as a graph,
    we opt to use the letters $bf(r)(x,y)$ rather than $bf(r)(u,v)$.
  ],
) <fig-psurf-plane>


#example(title: [Example: $y z$-plane])[
  Consider the entire $y z$ plane in $RR^3$ (that is, the points with $x = 0$).
  Then one can parametrize it by $bf(r) : RR^2 -> RR^3$
  (so our paper $cal(R) = RR^2$ is infinite!) defined by the equation
  $ bf(r)(u,v) = (0,u,v). $
  (I suppose it would've made sense to rename the variables to $bf(r)(y,z) = (0,y,z)$,
  but it doesn't matter.)
]

== [TEXT] Parametrizations are still flexible

Like in @ch-param, the parametrization of a surface is not unique,
and you get flexibility in how you parametrize it.
For example, for the simple $y z$-plane we just did,
we give an example of an overly complicated parametrization.

Our piece of paper will be $cal(R) = (-pi/2, pi/2) times (-pi/2, pi/2)$
(that is, a square if side length $pi$)
and our parametrization $bf(r) : cal(R) -> RR^3$ will be defined by
$ bf(r)(u,v) = (0, (tan u)^3, log(e^u+5) + tan v). $
This is really a valid parametrization:
you can verify every point in the $y z$-plane appears exactly once on our map.
It even has a region $cal(R)$ with finite area.
But it's so ugly you would never want to use it.

== [EXER] Exercises

#exer[
  Consider a surface $cal(S)$ given by the parametrization $bf(r) : RR^2 -> RR^3$ defined by
  $ bf(r)(u,v) = angle.l u-v, u+v, u v angle.r $
  for all $(u,v)$ in $RR^2$.
  Compute the real number $k$ for which the point $P = (1, 3, k)$ lies on $cal(S)$.
]
