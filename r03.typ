#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 3],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [11 September 2024],
)

#quote(attribution: [Monokuma in _Danganropa_])[
  Every human has regrets, has things they'd like to go back and change.
  But I don't! 'Cause I'm a bear!
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").


= Housekeeping

- Office hours is *2-136 now* at Monday 10am or by appointment.
- I'm also going to try and request to have the same room Wednesday 10am, right afterwards.

= You can now check recitation answers on phone/laptop/etc.

After the disaster that was the end of R02,
I asked ChatGPT to prepare an answer key for R03 and uploaded it to
#url("https://web.evanchen.cc/1802.html").
So, now you can check your answer on your phone or whatever
even if I'm not running around trying to help other people.

I'll try to also yap less today and give you time to actually talk to people more 1:1.
(Though Wednesday recitation is nicer than Monday, half as much stuff to cover.)

= Follow-ups from R02

- Errata from R02:
  Last week in R02 I mistakenly claimed that $arrow(A B) times arrow(A C)$
  is the area of the triangle $A B C$,
  but this is off by a factor of $2$;
  the magnitude of the cross product is the area of the parallelogram.
  Divide by $2$ to get the area of the triangle instead.

- Maulik says any drawing of $x$, $y$, $z$ axes that satisfies right-hand rule is OK.
  I'll try to follow Maulik's pictures.

- Remember that every vector has both a *direction* and a *magnitude*,
  which both have geometric meaning (or insignificance); see table below.

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
  it's given that
  $ T( vec(3,4) ) = vec(pi, sqrt(2)) " and " T( vec(100, 100) ) = vec(sqrt(7), sqrt(5)) $
  what are the vectors for $T( vec(103,104) )$ and $T( vec(203, 204) )$?
- More generally, if you know the values of $T( vec(1,0) )$ and $T( vec(0,1) )$,
  that gives you enough information to figure out all other values of $T$.

So two important general principles I want to emphasize:

- A matrix *encodes* a linear transformation $T$
  by *writing the values* of $T(bf(e)_1)$, ..., $T(bf(e)_n)$ as *columns*.
  This compresses the transformation into a small array of numbers.
- Matrix multiplication actually corresponds to function composition.
  (Challenge question: after reading the previous sentence,
  you should be able to explain why the matrix multiplication rule is defined as it is.)

= Recitation problems

== Q1

Consider the $2 times 2$ matrices $A = mat(2, 1; 1, 2)$ and $B = mat(- 3, 1; 2, 0)$.

- Calculate $A B$ and $B A$.

- Calculate the matrix $A^(- 1)$.

- Check directly that $A A^(- 1) = A^(- 1) A = I$.

- Consider the linear system of equations: $2 x + y = 7$ and $x + 2 y = 11$.
  Write this system of equations as a single matrix equation and solve it
  using $A^(- 1)$ from the previous question.
  Check that your solution satisfies the original equations.

== Q2

- Viewed as a linear transformation, how does the matrix
  $mat(2, 3; 0, 1)$ transform the unit square with vertices
  $(0 , 0)$, $(0 , 1)$, $(1 , 0)$, $(1 , 1)$?

- What is the $2 times 2$ matrix $A$ associated with reflection across the line $y = - x$?

- Find the $3 times 3$ matrix corresponding to the linear transformation
  $f$: $vec(x, y, z) arrow.r.bar vec(3 x - 2 z, x + y + z, 4 y + z)$.

- Consider the linear transformation $f : bb(R)^2 arrow.r bb(R)^2$ where
  $f (v)$ is the vector projection of $v$ in the direction
  $w = vec(1, 2)$. What is the $2 times 2$ matrix $A$ associated with
  this linear transformation?
