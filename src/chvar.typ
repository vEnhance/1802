#import "@local/evan:1.0.0":*

= Change of variables

To make this section easier to read, we'll do just the 2-D stuff;
the 3-D situation is actually exactly the same, but the notation is hideous.

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
  image("figures/chvar-region.png", width: auto),
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
  A *transition map* for $cal(R)$ is a function $bf(T) : cal(S) -> cal(R)$
  that transforms $cal(S)$ to $cal(R)$.
  (If $cal(S)$ is a rectangle, we also call $bf(T)$ a *cell*.)

  In 18.02 we always require that all the points except possibly the boundaries of $cal(S)$
  get mapped to different points in $cal(R)$.
  Thus, writing the inverse $bf(T)^(-1)$ usually also makes sense.
]

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
  box(image("media/xkcd-977.png", width: 40%), stroke: 1pt),
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
  image("figures/chvar-trans.png", width: auto),
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
  The *Jacobian matrix* is the determinant of the matrix
  whose rows are the gradients of each component written as row vectors.
  In these notes we denote it my $J_(bf(T))$.
]
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
  We can also find the Jacobian of the _inverse_ map too, that is
  $ bf(T)^(-1)(x,y) = (y/x, x y). $
  This is actually less painful because you don't have to deal with the square roots everywhere.
  $ partial / (partial x) (y/x) &= -y/x^2 \
    partial / (partial y) (y/x) &= 1/x $
  and
  $ partial / (partial x) (x y) &= y \
    partial / (partial y) (x y) &= x. $
  So the Jacobian matrix for $bf(T)$ is
  $ J_(bf(T)^(-1)) = mat(-y/x^2, 1/x; y, x). $
]

Okay, now for the result.

#memo(title: [Memorize: Change of variables])[
  Suppose you need to integrate $iint_(cal(R)) f(x,y) dif x dif y$
  and you have a transition map $bf(T)(u,v) : cal(S) -> cal(R)$.
  Then the transition map lets you change the integral as follows:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v) |det J_(bf(T))| dif u dif v $
  Alternatively, if it's easier to compute $J_(bf(T)^(-1))$, the following formula also works:
  $ iint_(cal(R)) f(x,y) dif x dif y = iint_(cal(S)) f(u,v) 1/(|det J_(bf(T)^(-1))|) dif u dif v $
]
Here $|det J_(bf(T))|$ is called the *area scaling factor*:
it's the absolute value of the determinant of the Jacobian matrix.
#typesig[
  The area scaling is always a _nonnegative_ real number.
]

This is the analog in 18.01 when you did change of variables from $x$ to $u$
(called $u$-substitution sometimes), and you changed $dif x$ to $(dif x)/(dif u) dif u$.
In 18.02, the derivative from 18.01 is replaced by the enormous Jacobian determinant.


#pagebreak()
