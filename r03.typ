#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 3],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [11 September 2024],
)

#quote[
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Housekeeping

- Office hours is *2-136 now* at Monday 10am or by appointment.
- I'm also going to try and request to have the same room Wednesday 10am, right afterwards.
- Errata from R02:
  Last week in R02 I mistakenly claimed that $arrow(A B) times arrow(A C)$
  is the area of the triangle $A B C$,
  but this is off by a factor of $2$;
  the magnitude of the cross product is the area of the parallelogram.
  Divide by $2$ to get the area of the triangle instead.

= Another table for some R02 concepts

Remember that every vector has both a *direction* and a *magnitude*,
which both have geometric meaning (or insignificance).
Often the direction is more "important" than the magnitude.

#align(center)[
  #table(
    columns: 3,
    table.header([*Object*], [*Direction*], [*Magnitude*]),
    [Normal vector to plane], [Perpendicular to plane], [_Irrelevant!_],
    [Vector projection of $bf(v)$ to $bf(w)$], [Along $bf(w)$], [$abs(bf(w))$ times scalar projection],
    [Cross product $bf(a) times bf(b)$], [Perpendicular to both $bf(a)$ and $bf(b)$], [Area of parallelogram]
  )
]


= Some abstraction on linear maps

Matrices are super confusing because they're actually the "wrong" way to think about things.
Again, take 18.700 or 18.701 or
#link("https://web.evanchen.cc/napkin.html")[read my book], or come to office hours.
For now, here's a few small hints.

- A _linear transform_ $T : RR^n -> RR^m$ is _any_ map obeying $T(c bf(v)) = c T(bf(v))$
  and $T(v + w) = T(v) + T(w)$.
  It's a "big" object, and has a lot of geometric information.
  A _matrix_ is a way of _encoding_ the information using as few numbers as possible.
- Pop quiz: if $T : RR^2 -> RR^2$ is a linear transform and
  it's given that $T( vec(3,4) ) = vec(pi, sqrt(2))$
  and $T( vec(10, 10) ) = vec(sqrt(7), sqrt(5))$, what are the vectors for
  $T( vec(13,14) )$ and $T( vec(23, 24) )$?
- More generally, if you know $T( vec(1,0) )$ and $T( vec(0,1) )$,
  that gives you enough information to figure out all other values of $T$.

So two important general principles I want to emphasize:

- A matrix *encodes* a linear transformation $T$
  by *writing the values* of $T(bf(e)_1)$, ..., $T(bf(e)_n)$ as *columns*.
  This compresses the transformation into a small array of data.
- Matrix multiplication corresponds to function composition.
