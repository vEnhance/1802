#import "@local/evan:1.0.0":*

= Regions

In 18.02, you'll be asked to find global minimums or maximums over a *constraint region* $cal(R)$,
which is only a subregion of $RR^n$.
For example, if you have a three-variable function $f(x,y,z)$ given to you,
you may be asked questions like

- What is the global maximum of $f$ (if any) across all of $RR^3$?
- What is the global maximum of $f$ (if any) across the octant#footnote[
    Like "quadrant" with $x y$-graphs. If you've never seen this word before, ignore it.
  ] $x,y,z > 0$?
- What is the global maximum of $f$ (if any) across the cube given by $-1 <= x,y,z <= 1$?
- What is the global maximum of $f$ (if any) across the sphere $x^2+y^2+z^2 = 1$?
- ... and so on.

It turns out that thinking about constraint regions is actually half the problem.
In 18.01 you usually didn't have to think much about it,
because the regions you got were always intervals, and that made things easy.
But in 18.02, you will need to pay much more attention.

#warning(title: [Warning: if you are proof-capable, read the grown-up version])[
  This entire section is going to be a lot of wishy-washy terms
  that I don't actually give definitions for.
  If you are a high-school student preparing for a math olympiad,
  or you are someone who can read proofs,
  read the version at #url("https://web.evanchen.cc/handouts/LM/LM.pdf") instead.
  We use open/closed sets and compactness there to do things correctly.
]

== [TEXT] Constraint regions

#digression(title: [Digression: An English lesson on circle vs disk, sphere vs ball])[
  To be careful about some words that are confused in English,
  I will use the following conventions:

  - The word *circle* refers to a one-dimensional object with no inside, like $x^2+y^2=1$.
    It has no area.
  - The word *open disk* refers to points strictly inside a circle, like $x^2+y^2 < 1$
  - The word *closed disk* refers to a circle and all the points inside it, like $x^2+y^2=1$ or $x^2+y^2<1$.
  - The word *disk* refers to either an open disk or a closed disk.

  Similarly, a *sphere* refers only to the surface, not the volume, like $x^2+y^2+z^2=1$.
  Then we have *open ball*, *closed ball*, and *ball* defined in the analogous way.
]

In 18.02, all the constraint regions we encounter will be made out of some number
(possibly zero) of equalities and inequalities.
We provide several examples.

#example(title: [Examples of regions in $RR$])[
  In $RR$:
  - All of $RR$, with no further conditions.
  - An open interval like $-1 < x < 1$ in $RR$.
  - A closed interval like $-1 <= x <= 1$ in $RR$.
]
#example(title: [Examples of two-dimensional regions in $RR^2$])[
  In $RR^2$, some two-dimensional regions:
  - All of $RR^2$, with no further conditions.
  - The first quadrant $x, y > 0$, not including the axes
  - The first quadrant $x, y >= 0$, including the positive $x$ and $y$ axes.
  - The square $-1 < x < 1$ and $-1 < y < 1$, not including the four sides of the square.
  - The square $-1 <= x <= 1$ and $-1 <= y <= 1$, including the four sides.
  - The open disk $x^2 + y^2 < 1$, filled-in unit disk without its circumference.
  - The closed disk $x^2 + y^2 <= 1$, filled-in unit disk including its circumference.
]
#example(title: [Examples of one-dimensional regions in $RR^2$])[
  In $RR^2$, some one-dimensional regions:
  - The unit circle $x^2 + y^2 = 1$, which is a circle of radius $1$, not filled.
  - Both $x^2+y^2=1$ and $x,y > 0$, a quarter-arc, not including $(1,0)$ and $(0,1)$.
  - Both $x^2+y^2=1$ and $x,y >= 0$, a quarter-arc, including $(1,0)$ and $(0,1$).
  - The equation $x + y = 1$ is a line.
  - Both $x + y = 1$ and $x,y > 0$: a line segment not containing the endpoints $(1,0)$ and $(0,1)$.
  - Both $x + y = 1$ and $x,y >= 0$: a line segment containing the endpoints $(1,0)$ and $(0,1)$.
]

I could have generated plenty more examples for $RR^2$,
and I haven't even gotten to $RR^3$ yet.
That's why the situation of constraint regions requires more thought in 18.02 than 18.01,
(whereas in 18.01 there were pretty much only a few examples that happened).

In order to talk about the regions further, I have to introduce some new words.
The three that you should care about for this class are the following:
"boundary", "limit cases", and "dimension".

#warning(title: [Warning: This is all going to be waving hands furiously])[
  As far as I know, in 18.02 it's not possible to give precise definitions for these words.
  So you have to play it by ear.
  All the items below are rules of thumb that work okay for 18.02,
  but won't hold up in 18.100/18.900.
]

- The *boundary* is usually the points you get when you choose any one of the $<=$ and $>=$
  constraints and turn it into and $=$ constraint.
  For example, the boundary of the region cut out by $-1 <= x <= 1$ and $-1 <= y <= 1$
  (which is a square of side length $2$)
  are the four sides of the square, where either $x = pm 1$ or $y = pm 1$.

- The *limit cases* come in two forms:
  - If any of the variables can go to $pm oo$, all those cases are usually limit cases.
  - If you have any $<$ and $>$ inequalities,
    the cases where the variables approach those strict bounds are usually limit cases.

- The *dimension* of $cal(R)$ is the hardest to define in words but easiest to guess.
  I'll give you two ways to guess it:

  - Geometric guess:
    pick a point $P$ in $cal(R)$ that's not on the boundary.
    Look at all the points of $cal(R)$ that are close to $P$, i.e.~a small neighborhood.

    - Say $cal(R)$ is one-dimensional if the small neighborhood could be given a _length_.
    - Say $cal(R)$ is two-dimensional if the small neighborhood could be given an _area_.
    - Say $cal(R)$ is three-dimensional if the small neighborhood could be given a _volume_.

  - Algebraic guess:
    the dimension of a region in $RR^n$ is usually equal to $n$ minus the number of $=$ in constraints.

  Overall, trust your instinct on dimension; you'll usually be right.

The table below summarizes how each constraint affects each of the three words above.
#figure(
  table(
    columns: 4,
    align: left,
    table.header([Constraint], [Boundary], [Limit case], [Dimension]),
    [$<=$ or $>=$], [Change to $=$ to get boundary], [No effect], [No effect],
    [$<$ or $>$], [No effect], [Approach for limit case], [No effect],
    [$=$], [No effect], [No effect], [Reduces dim by one],
  ),
  kind: table,
  caption: [Effects of the rules of thumb.]
) <table-rule-thumb>

Let's use some examples.
#example(title: [Example: the circle, open disk, and closed disk])[
  - The circle $x^2 + y^2 = 1$ is a *one-dimensional* shape.
    Again, we consider this region to be _one-dimensional_
    even though the points live in $RR^2$.
    The rule of thumb is that with $2$ variables and $1$ equality, the dimension should be $2-1=1$.

    Because there are no inequality constraints at all,
    and because $x$ and $y$ can't be larger than $1$ in absolute value,
    there is no *boundary* and there are no *limit cases*.

  - The open disk $x^2 + y^2 < 1$ is *two-dimensional* now,
    since it's something that makes sense to assign an area.
    (Or the rule of thumb that with $2$ variables and $0$ equalities,
    the dimension should be $2-0=2$.)

    There is one family of *limit cases: when $x^2+y^2$ approaches $1^-$*.
    But there is no boundary.

  - The closed disk $x^2 + y^2 <= 1$ is also *two-dimensional*.
    Because $x$ and $y$ can't be larger than $1$ in absolute value,
    and there were no $<$ or $>$ constraints, there are no limit cases to consider.
    But there is a *boundary of $x^2 + y^2 = 1$*.
]

#todo[Draw a figure for this]

In compensation for the fact that I'm not giving you true definitions,
I will instead give you a pile of examples, their dimensions, boundaries, and limit cases.
See @table-1d-regions, @table-2d-regions, @table-3d-regions.

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([Region], [Dim.], [Boundary], [Limit cases]),
    [All of $RR$], [1-D], [No boundary], [$x -> pm oo$],
    [$-1 < x < 1$], [1-D], [No boundary], [$x -> pm 1$],
    [$-1 <= x <= 1$], [1-D], [$x = pm 1$], [No limit cases],
  ),
  kind: table,
  caption: [Examples of regions inside $RR$ and their properties.]
) <table-1d-regions>

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([Region], [Dim.], [Boundary], [Limit cases]),
    [All of $RR^2$], [2-D], [No boundary], [$x -> pm oo$ or $y -> pm oo$],
    [$x,y > 0$], [2-D], [No boundary], [$x -> 0^+$ or $y -> 0^+$ \ or $x -> +oo$ or $y -> +oo$],
    [$x,y >= 0$], [2-D], [$x=0$ or $y=0$], [$x -> +oo$ or $y -> +oo$],
    [$-1 < x < 1 \ -1 < y < 1$], [2-D], [No boundary], [$x,y -> pm 1$],
    [$-1 <= x <= 1 \ -1 <= y <= 1$], [2-D], [$x=pm 1$ or $y=pm 1$], [No limit cases],
    [$x^2 + y^2 < 1$], [2-D], [No boundary], [$x^2+y^2 -> 1^-$],
    [$x^2 + y^2 <= 1$], [2-D], [$x^2 + y^2 = 1$], [No limit cases],
    [$x^2 + y^2 = 1$], [1-D], [No boundary], [No limit cases],
    [$x^2 + y^2 = 1 \ x,y > 0$], [1-D], [No boundary], [$x -> 0^+$ or $y -> 0^+$],
    [$x^2 + y^2 = 1 \ x,y >= 0$], [1-D], [$(1,0)$ and $(0,1)$], [No limit cases],
    [$x + y = 1$], [1-D], [No boundary], [$x -> pm oo$ or $y -> pm oo$],
    [$x + y = 1 \ x, y > 0$], [1-D], [No boundary], [$x -> 0^+$ or $y -> 0^+$],
    [$x + y = 1 \ x, y >= 0$], [1-D], [$(1,0)$ and $(0,1)$], [No limit cases]
  ),
  kind: table,
  caption: [Examples of regions inside $RR^2$ and their properties],
) <table-2d-regions>

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([Region], [Dim.], [Boundary], [Limit cases]),
    [All of $RR^3$], [3-D], [No boundary], [Any var to $pm oo$],
    [$x,y,z > 0$], [3-D], [No boundary], [Any var to $0$ or $oo$],
    [$x,y,z >= 0$], [3-D], [$x=0$ or $y=0$ or $z=0$], [Any var to $oo$],
    [$x^2 + y^2 + z^2 < 1$], [3-D], [No boundary], [$x^2 + y^2 + z^2 -> 1^-$],
    [$x^2 + y^2 + z^2 <= 1$], [3-D], [$x^2 + y^2 + z^2 = 1$], [No limit cases],
    [$x^2 + y^2 + z^2 = 1$], [2-D], [No boundary], [No limit cases],
    [$x^2 + y^2 + z^2 = 1 \ x,y,z > 0$], [2-D], [No boundary], [$(1,0)$ and $(0,1)$],
    [$x^2 + y^2 + z^2 = 1 \ x,y,z >= 0$], [2-D], [Three quarter-circle arcs#footnote[
      To be explicit, the first quarter circle is $x^2+y^2=1$, $x,y >=0$ and $z = 0$.
      The other two quarter-circle arcs are similar.
    ]], [No limit cases],
    [$x + y + z = 1$], [2-D], [No boundary], [Any var to $pm oo$],
    [$x + y + z = 1 \ x, y, z > 0$], [2-D], [No boundary], [Any var to $0^+$],
    [$x + y + z = 1 \ x, y, z >= 0$], [2-D], [$x=0$ or $y=0$ or $z=0$], [No limit cases],
  ),
  kind: table,
  caption: [Examples of regions inside $RR^3$ and their properties],
) <table-3d-regions>


#digression(title: [Digression on intentionally misleading constraints that break the rule of thumb])[
  I hesitate to show these, but here are some examples where the rules of thumb fail:

  - An unusually cruel exam-writer might rewrite the unit circle as
    $ x^2 + y^2 <= 1 " and " x^2 + y^2 >= 1 $
    instead of the more natural $x^2 + y^2 = 1$.
    Then if you were blindly following the rules of thumb, you'd get the wrong answer.
  - In $RR^3$ the region cut out by the single equation
    $ x^2 + y^2 + z^2 = 0 $
    is actually $0$-dimensional, because there's only one point in it: $(0,0,0)$.

  That said, intentionally misleading constraints like this are likely off-syllabus for 18.02.
]

== [RECIPE] Working with regions

This is going to be an unsatisfying recipe, because it's just the rules of thumb.
But again, for 18.02, the rules of thumb should work on all the exam questions.

#recipe(title: [Recipe: The rule of thumb for regions defined by equations and inequalities])[
  Given a region $cal(R)$ contained in $RR^n$, to guess its dimension, limit cases, and boundary:

  - The dimension is probably $n$ minus the number of $=$ constraints.
  - The limit cases are obtained by turning $<$ and $>$ into limits,
    and considering when any of the variables can go to $pm oo$.
  - The boundary is obtained when any $<=$ and $>=$ becomes $=$.

  See @table-rule-thumb.
]

#todo[Add some more examples here]

== [TEXT] Examples of regions described in words rather than equations

#todo[Add examples that aren't triangles]
