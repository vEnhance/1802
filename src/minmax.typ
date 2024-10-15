#import "@local/evan:1.0.0":*

= Critical points

== [TEXT] Critical points in 18.01

First, a comparison to 18.01.
Way back when you had a differentiable single-variable function $f : RR -> RR$,
and you were trying to minimize it, you used the following terms:

#figure(
  table(
    columns: 2,
    align: left,
    table.header([18.01 term], [Meaning]),
    [Global minimum], [Minimum of the function $f$ across the entire region you're considering],
    [Local minimum], [A point at which $f$ is smaller than any nearby points in a small neighborhood],
    [Critical point], [A point where $f'(x) = 0$],
  ),
  kind: table,
  caption: [18.01 terminology for critical points]
)
Each row includes all the ones below it, but not vice-versa.
Here's a picture of an example showing these for
a random function $f(x) = -1/5 x^6 - 2/7 x^5 + 2/3 x^4 + x^3$.
From left to right in @fig-1801-critical-points, there are four critical points:

- A local maximum (that isn't a global maximum), drawn in blue.
- A local minimum (that isn't a global minimum), draw in green.
- An critical inflection point --- neither a local minimum _nor_ a local maximum. Drawn in orange.
- A global maximum, drawn in purple.

Note there's no global minimum at all, since the function $f$ goes to $-oo$ in both directions
as $x -> -oo$ or $x -> +oo$.

#figure(
  image("figures/minmax-1801graph.png", width: auto),
  caption: [Some examples of critical points in an 18.01 graph of a single variable function.],
) <fig-1801-critical-points>

== [TEXT] Critical points in 18.02 <sec-critical-points>

In 18.02, when we consider $f : RR^n -> RR$ the only change we make is:

#definition[
  For 18.02, we generalize the definition of *critical point* to be a point $P$
  for which $nabla f (P) = bf(0)$ is the zero vector.
  (The other two definitions don't change.)
]

As soon as I say this I need to carry over the analogous warnings from 18.01:
#warning[
  - Keep in mind that each of the implications
    $ "Global minimum" ==> "Local minimum" ==> "Critical point, i.e. " nabla f = bf(0) $
    is true only one way, not conversely.
    So a local minimum may not be a global minimum;
    and a point with gradient zero might not be a minimum, even locally.
    You should still find all the critical points,
    just be aware a lot of them may not actually be min's or max's.
  - There may not be _any_ global minimum or maximum at all, like we just saw.
]

#definition[
  In 18.02, a critical point that isn't a local minimum or maximum is called a *saddle point*.
]

#example[
  The best example of a saddle point to keep in your head is the origin for the function
  $ f(x,y) = x^2 - y^2. $
  Why is this a saddle point? We have $f(0,0) = 0$, and the gradient is zero too, since
  $ nabla f = vec(2x, 2y) ==> nabla f (0,0) = vec(2 dot 0, 2 dot 0) = vec(0, 0). $
  The problem is that the small changes in $x$ and $y$ clash in sign.
  Specifically, if we go a little bit to either the left or right in the $x$-direction,
  then $f$ will _increase_ a little bit, e.g.
  $ f(0.1, 0) = f(-0.1, 0) = 0.01 > 0. $
  But the $-y^2$ term does the opposite: if we go a little bit up or down in the $y$-direction,
  then $f$ will _decrease_ a little bit.
  $ f(0, 0.1) = f(0, -0.1) = -0.01 < 0. $
  So the issue is the clashing signs of small changes in $x$ and $y$ directions.
  This causes $f$ to neither be a local minimum nor local maximum.

  There's actually nothing special about $pm x$ and $pm y$ in particular;
  I only used those to make arithmetic easier.
  You can see @fig-hyperbola-saddle for values of $f$ at other nearby points.
]

#figure(
  image("figures/minmax-hyperbola-saddle.png", width: auto),
  caption: [Values of $f(x,y) = x^2-y^2$ at a distance of $0.1$ from the saddle point $(0,0)$.
    Green values are positive and red ones are negative.
    It's a saddle point because there are both.
  ],
) <fig-hyperbola-saddle>


#remark[
  The name "saddle point" comes from the following picture: if one looks at the surface
  $ z = x^2 - y^2 $
  then near $(0,0)$ you have something that looks like a horse saddle.
  It curves upwards along the $x$-direction, but downwards along the $y$-direction.
]

We'll get to the recipe for distinguishing
between saddle points and local minimums and maximums in a moment;
like in 18.01, there is something called the second derivative test.
First, one digression and a few examples of finding critical points.

== [SIDENOTE] Saddle points are way more common than critical inflection points <sec-saddle-sim>

At first glance, you might be tempted to think that a saddle point
is the 18.02 version of the critical inflection point.
However, that analogy is actually not so good for your instincts,
and *saddle points feel quite different from 18.01 critical inflection points*.
Let me explain why.

In 18.01, it was _possible_ for a critical point to be neither a local minimum or maximum,
and we called these critical inflection points.
However, in 18.01 this was actually really rare.
To put this in perspective, suppose we considered a random 18.01 function of the form
$ f(x) = square x^3 + square x^2 + square x + square $
where each square was a random integer between $-1000000$ and $1000000$ inclusive.
Of the approximately $10^(25)$ functions of this shape,
you will find that while there are plenty of critical points,
the chance of finding a critical inflection point is something like $10^(-15)$ ---
far worse than the lottery.
(Of course, if you _know_ where to look, you can find them:
$f(x) = x^3$ has an inflection point at the origin, for example.)

In 18.02 this is no longer true.
If we picked a random function of a similar form
$ f(x) = square x^3 + square x^2 + square x + square y^3 + square y^2 + square y + square $
where we fill each square with a number from $-1000000$ to $1000000$
then you'll suddenly see saddle points everywhere.
For example, when I ran this simulation $10000$ times,
among the critical points that showed up, I ended up with about

- 24.6% local minimums
- 25.3% local maximums
- 50.1% saddle points.

And the true limits (if one replaces $10^6$ with $N$ and takes the limit as $N -> oo$)
are what you would guess from the above: 25%, 25%, 50%.
(If you want to see the code, it's in the Appendix, section @appendix-saddle-sim.)

Why is the 18.02 situation so different?
It comes down to this: in 18.02, you can have two clashing directions.
For the two experiments I've run here, consider the picture in @fig-whysaddle.
Here $P$ is a critical point,
and we consider walking away from it in one of two directions.
I'll draw a blue $+$ arrow if $f$ increases, and a red $-$ arrow if $f$ decreases.

#figure(
  image("figures/minmax-whysaddle.png", width: auto),
  caption: [Why the 18.01 and 18.02 polynomial experiments have totally different outcomes.],
) <fig-whysaddle>

In the 18.01 experiment, we saw that two arrows pointing _opposite_ directions
almost always have the same color.
So in 18.01, when we could only walk in one direction,
that meant almost every point was either a local minimum or a local maximum.
But the picture for 18.02 is totally different because there's nothing that forces
the north/south pair to have a different direction from the east/west pair.
For a "random" function, if you believe the colors are equally likely,
then half the time the arrows don't match colors and you end up with a saddle point.

This whole section was for two-variable functions $P(x) + Q(y)$, so it's already a simplification.
If you ran an analogous three-variable experiment defined similarly for
polynomials $f(x,y,z) = P(x) + Q(y) + R(z)$:

- 12.5% local minimums
- 12.5% local maximums
- 75.0% saddle points.

If we return to the world of _any_ two-variable function, the truth is even more complicated than this.
In this sidenote I only talked about functions $f(x,y)$
that looked like $P(x) + Q(y)$ where $P$ and $Q$ were polynomials.
The $x$ and $y$ parts of the function were completely unconnected,
so we only looked in the four directions north/south/east/west.
But most two-variable functions have some more dependence between $x$ and $y$,
like $f(x,y) = x^2y^3$ or $f(x) = e^x sin(y)$ or similar.
Then you actually need to think about more directions than just north/south/east/west.
#digression[
  For example, Poonen's lecture notes (see question 9.22) show a weird _monkey saddle_:
  the point $(0,0)$ is a critical point of
  $ f(x,y) = x y (x-y) $
  where the values of $f$ nearby split into six regions, alternating negative and positive,
  in contrast to @fig-hyperbola-saddle where there were only four zones on the circle.
  (See also #link("https://w.wiki/6LLG")[Wikipedia for monkey saddle].)
  Poonen also invites the reader to come up with an _octopus saddle_
  (which sounds like it needs sixteen regions, eight down ones for each leg of the octopus).
]

== [RECIPE] Finding critical points

For finding critical points, on paper you can just follow the definition:

#recipe(title: [Recipe for finding critical points])[
  To find the critical points of $f : RR^n -> RR$

  1. Compute the gradient $nabla f$.
  2. Set it equal to the zero vector and solve the resulting system of $n$ equations in $n$ variables.
]

The thing that might be tricky is that you have to solve a system of equations.
Depending on how difficult your function is to work with, that might require some
creativity in order to get the algebra right.
We'll show some examples where the algebra is really simple,
and examples where the algebra is much more involved.

#sample[
  Find the critical points of $f(x,y,z) = x^2 + 2 y^2 + 3 z^2$.
]
#soln[
  The gradient is
  $ nabla f (x,y,z) = vec(2x, 4y, 6z). $
  In order for this to equal $vec(0,0,0)$, we need to solve the three-variable system of equations
  $
  2x &= 0 \
  4y &= 0 \
  6z &= 0 \
  $
  which is so easy that it's almost insulting: $x=y=z=0$.
  The only critical point is $(0,0,0)$.
]

#sample[
  Find the critical points of $f(x,y) = x y (6 - x - y)$.
]
#soln[
  This example is a lot more annoying than the previous one, despite having fewer variables,
  because casework is forced upon you.
  You need to solve four systems of linear equations, not just one, as you'll see.

  We expand $ f(x,y) = 6 x y - x^2 y - x y^2. $
  So $ nabla f = vec(6 y - 2 x y - y^2, 6 x - x^2 - 2 x y). $
  Hence, the resulting system of equations to solve is
  $
    y (6 - 2 x - y) &= 0 \
    x (6 - 2 y - x) &= 0.
  $
  The bad news is that these are quadratic equations.
  Fortunately, they come in factored form, so we can rewrite them as OR statements:
  $
    y (6 - 2 x - y) &= 0 ==> (y = 0 " OR " 2x + y = 6) \
    x (6 - 2 y - x) &= 0 ==> (x = 0 " OR " x + 2y = 6).
  $
  So actually there are $2^2 = 4$ cases to consider, and we have to manually tackle all four.
  These cases fit into the following $2 times 2$ table; we solve all four systems of equations.
  #align(center)[
    #block(breakable: false)[
      #table(
        columns: 3,
        align: left + horizon,
        stroke: 0.5pt,
        [], [Top eqn.~gives $y=0$], [Top eqn.~gives $2x+y=6$],
        [Bottom eqn.~gives $x=0$], [$cases(y=0, x=0) ==> (x,y) = (0,0)$], [$cases(2x+y=6 \ x=0) ==> (x,y) = (0,6)$],
        [Bottom eqn.~gives $x+2y=6$], [$cases(y=0, x+2y=6) ==> (x,y)=(6,0)$], [$cases(2x+y=6, x+2y=6) ==> (x,y) = (2,2)$]
      ),
    ]
  ]
  So we get there are four critical points, one for each case: $(0,0)$, $(0,6)$, $(6,0)$ and $(2,2)$.
]

== [RECIPE] The second derivative test for two-variable functions

Earlier we classified critical points by looking at nearby points.
Technically speaking, we did not give a precise definition of "nearby", just using
small numbers like $0.01$ or $0.1$ to make a point.
So in 18.02, the exam will want a more systematic theorem for classifying
critical points as local minimum, local maximum, or saddle point.

I thought for a bit about trying to explain why the second derivative test works,
but ultimately I decided to not include it in these notes.
Here's some excuses why:
#digression[
  The issue is that getting the "right" understanding of this would require
  me to talk about _quadratic forms_.
  However, in the prerequisite parts Alfa and Bravo of these notes,
  we only did linear algebra, and didn't cover quadratic forms in this context at all.
  I hesitate to introduce an entire chapter on quadratic forms
  (which are much less intuitive than linear functions) and _then_ tie that to eigenvalues
  of a $2 times 2$ matrix just to justify a single result that most students will just memorize anyway.

  Poonen has some hints on quadratic forms in section 9 of his notes if you want to look there though.

  The other downside is that even if quadratic forms are done correctly,
  the second derivative test doesn't work in all cases anyway,
  if the changes of the function near the critical point are sub-quadratic (e.g. degree three).
  And multivariable Taylor series are not on-syllabus for 18.02.
]

So to get this section over with quickly, I'll just give the result.
I'm sorry this will seem to come out of nowhere.

#recipe(title: [Recipe: the second derivative test])[
  Suppose $f(x,y)$ is a function has a critical point at $P$.
  We want to tell whether it's a local minimum, local maximum, or saddle point.
  Assume that $f$ has a continuous second derivative near $P$.

  1. Let $A = f_(x x) (P)$, $B = f_(x y) (P) = f_(y x) (P)$, $C = f_(y y) (P)$.
    These are the partial derivatives of the partial derivatives of $f$ (yes, I'm sorry),
    evaluated at $P$.
    If you prefer gradients, you could write this instead as
    $ nabla f_x = vec(A,B), #h(1em) nabla f_y = vec(B,C). $

  2. If $A C - B^2 != 0$, output the answer based on the following chart:
    - If $A C - B^2 < 0$, output "saddle point".
    - If $A C - B^2 > 0$ and $A, C >= 0$, output "local minimum".
    - If $A C - B^2 > 0$ and $A, C <= 0$, output "local maximum".
  3. If $A C - B^2 = 0$, the second derivative test is inconclusive.
    Any of the above answers are possible, including weird/rare saddle points like the monkey saddle.
    You have to use a different method instead.
]

#tip[
  It is indeed a theorem that if $f$ is differentiable twice continuously, then $f_(x y) = f_(y x)$.
  That is, if you take a well-behaved function $f$ and differentiate with respect to $x$
  then differentiate with respect to $y$,
  you get the same answer as if you differentiate with respect to $y$ and respect to $x$.
  You'll see this in the literature written sometimes as
  $ (partial)/(partial x) (partial)/(partial y) f = (partial)/(partial y) (partial)/(partial x) f. $
]

#sample[
  Use the second derivative test to classify the critical point $(0,0)$ of
  the function $ f(x,y) = x^3 + x^2 + y^3 - y^2. $
]
#soln[
  Start by computing the partial derivatives:
  $ nabla f = vec(3x^2 + 2x, 3y^2 - 2y) ==> cases(f_x = 3x^2 + 2x, f_y = 3y^2 - 2y). $
  We now do partial differentiation a second time on each of these.
  Depending on your notation, you can write this as either
  $ nabla f_x = vec(6x+2,0) #h(1em) nabla f_y = vec(0,6y-2) $
  or
  $ f_(x x) = 6x+2, #h(1em) f_(x y) = f_(y x) = 0, #h(1em) f_(y y) = 6y-2. $
  Again, the repeated $f_(x y) = f_(y x)$ is either $(partial) / (partial y) (6x+2) = 0$
  or $(partial) / (partial x) (6y-2) = 0$;
  for well-behaved functions, you always get the same answer for $f_(x y)$ and $f_(y x)$.

  At the origin, we get
  $
  A &= 6 dot 0 + 2 = 2 \
  B &= 0 \
  C &= 6 dot 0 - 2 = -2.
  $
  Since $A C - B^2 = -4 < 0$, we output the answer "saddle point".
]

#sample[
  Find the critical points of $f(x,y) = x y + y^2 + 2 y$
  and classify them using the second derivative test.
]
#soln[
  Start by computing the gradient:
  $ nabla f = vec(y, x + 2 y + 2). $
  Solve the system of equations $y = 0$ and $x + 2y + 2 = 0$ to get just $(x,y) = (-2,0)$.
  Hence this is the only critical point.

  We now compute the second derivatives:
  $
  f_(x x) &= (partial)/(partial x) (y) = 0 \
  f_(x y) = f_(y x) &= (partial)/(partial y) (y) = (partial)/(partial x)(x + 2 y + 2) = 1 \
  f_(y y) &= (partial)/(partial y) (x + 2 y + 2) = 2.
  $
  These are all constant functions in this example;
  anyway, we have $A = 0$, $B = 1$, $C = 2$, and $A C - B^2 = -1 < 0$,
  so output "saddle point".
]

== [EXER] Exercises


#exerstar[
  - Give an example of a differentiable function $f : RR^2 -> RR$ with the following property:
    for every point $(x,y)$, the point $(x,y)$ is a saddle point if and only if
    $x$ and $y$ are both integers.
  - Does there exist a differentiable function $f : RR^2 -> RR$
    such that every point is a saddle point?
]

#pagebreak()

= Regions

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

In 18.02, all the constraint regions we encounter will be made out of some number
(possibly zero) of equalities and inequalities.
We provide several examples.

#example(title: [Examples of regions in $RR$])[
  In $RR$:
  - All of $RR$, with no further conditions.
  - An open interval like $-1 < x < 1$ in $RR$.
  - A closed interval like $-1 <= x <= 1$ in $RR$.
]
#example(title: [Examples of two-dimensional regions in $RR$])[
  In $RR^2$, some two-dimensional regions:
  - All of $RR^2$, with no further conditions.
  - The first quadrant $x, y > 0$, not including the axes
  - The first quadrant $x, y >= 0$, including the positive $x$ and $y$ axes.
  - The square $-1 < x < 1$ and $-1 < y < 1$, not including the four sides of the square.
  - The square $-1 <= x <= 1$ and $-1 <= y <= 1$, including the four sides.
]
#example(title: [Examples of one-dimensional regions in $RR$])[
  In $RR^2$, some one-dimensional regions:
  - The open disk $x^2 + y^2 < 1$, filled-in unit disk without its circumference.
  - The closed disk $x^2 + y^2 <= 1$, filled-in unit disk including its circumference.
  - The unit circle $x^2 + y^2 = 1$, which is a circle of radius $1$, not filled. This is 1-D.
  - Both $x^2+y^2=1$ and $x,y > 0$, a quarter-arc, not including $(1,0)$ and $(0,1)$.
  - Both $x^2+y^2=1$ and $x,y >= 0$, a quarter-arc, including $(1,0)$ and $(0,1$).
  - The equation $x + y = 1$ is a line.
  - The equation $x + y = 1$ and $x,y > 0$ is a line segment not containing the endpoints $(1,0)$ and $(0,1)$.
  - The equation $x + y = 1$ and $x,y >= 0$ is a line segment containing the endpoints $(1,0)$ and $(0,1)$.
]

I could have generated plenty more examples for $RR^2$,
and I haven't even gotten to $RR^3$ yet.
That's why the situation of constraint regions requires more thought in 18.02 than 18.01,
(whereas in 18.01 there were pretty much only a few examples that happened).

In order to talk about the regions further, I have to introduce some new words.
The three that you should care about for this class are the following:
"boundary", "limit cases", and "dimension".

#warning[
  As far as I know, in 18.02 it's not possible to give precise definitions for these words.
  So you have to play it by ear.
  All the items below are rules of thumb that work fine for 18.02,
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
)

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
    table.header([Region], [Dimension], [Boundary], [Limit cases]),
    [All of $RR^2$], [2-D], [No boundary], [$x -> pm oo$ or $y -> pm oo$],
    [$x,y > 0$], [2-D], [No boundary], [$x -> 0^+$ or $y -> 0^+$ \ or $x -> +oo$ or $y -> +oo$],
    [$x,y >= 0$], [2-D], [$x=0$ or $y=0$], [$x -> +oo$ or $y -> +oo$],
    [$-1 < x < 1 \ -1 < y < 1$], [2-D], [No boundary], [$x,y -> pm 1$],
    [$-1 <= x <= 1 \ -1 <= y <= 1$], [2-D], [$x=pm 1$ or $y=pm 1$], [No boundary],
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
    [$x^2 + y^2 + z^2 <= 1$], [3-D], [$x^2 + y^2 = 1$], [No limit cases],
    [$x^2 + y^2 + z^2 = 1$], [2-D], [No boundary], [No limit cases],
    [$x^2 + y^2 + z^2 = 1 \ x,y,z > 0$], [2-D], [No boundary], [$(1,0)$ and $(0,1)$],
    [$x^2 + y^2 + z^2 = 1 \ x,y,z >= 0$], [2-D], [$(1,0)$ and $(0,1)$], [No limit cases],
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

  That said, intentionally misleading constraints like this are well off-syllabus for 18.02.
]

== [RECIPE] Working with regions

This is going to be an unsatisfying recipe, because it's just the rules of thumb.
But again, for 18.02, the rules of thumb should work on all the exam questions.

#recipe(title: [Recipe: The rule of thumb for regions])[
  Given a region $cal(R)$ contained in $RR^n$, to guess its dimension, limit cases, and boundary:

  - The dimension is probably $n$ minus the number of $=$ constraints.
  - The limit cases are obtained by turning and $<$ and $>$ into limits,
    and considering when any of the variables can go to $pm oo$.
  - The boundary is obtained when any $<=$ and $>=$ becomes $=$.
]

#todo[Add some more examples here]
#pagebreak()

= Optimization problems

Now that we understand both critical points of $f$ and regions $cal(R)$,
we turn our attention to the problem of finding global minimums and maximums.

== [TEXT] The easy and hard cases

Suppose you have a function $f : RR^n -> RR$ that you can compute $nabla f$ for,
and a region $cal(R)$.
We're going to distinguish between two cases:

- The *easy case* is if $cal(R)$ has dimension $n$ as well;
  for cases where the rule of thumb works, this is the same as having no "=" constraints.
- The *hard case* is if $cal(R)$ has dimension $n-1$,
  which the rule of thumb says means there is one "=" constraint.
  In the hard case, we will use *Lagrange multipliers*.

We won't cover the case where $cal(R)$ has dimension $n-2$ or less in 18.02,
although it can be done.

== [RECIPE] The easy case <sec-recipe-opt-easy>

#recipe(title: [The easy case of optimization])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n$.

  1. Evaluate $f$ on all the *critical points* of $f$ in the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ in the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ in the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).

  If there are any points at which $f$ or $nabla f$ are undefined, you should check those as well.
  However, these seem to be pretty rare for the examples that show up in 18.02.
]

#warning[
  Step 2 might actually require Lagrange multipliers, even in the easy case.
  Don't underestimate the difficulty of the boundary cases.
]

#sample[
  Find the minimum and maximum possible value, if they exist of
  $ f(x,y) = x + y + 8/(x y) $
  over $x,y > 0$.
]
#soln[
  The region $cal(R)$ is the first quadrant
  which is indeed two-dimensional (no $=$ constraints),
  so we're in the easy case and the recipe applies here.
  We check all the points in turn:

  1. To find the critical points, calculate the gradient
    $ nabla f (x,y) = vec(1 - 8 / (x^2 y), 1 - 8 / (x y^2)) $
    and then set it equal to $vec(0,0)$.
    This gives us the simultaneous equations
    $ 1 = 8 / (x^2 y) = 8 / (x y^2). $
    This implies $x^2 y = x y^2$ or $x = y$
    (we have $x,y > 0$ in $cal(R)$, so we're not worried about division by zero)
    and so the only critical point is $(x,y) = (2,2)$.

  2. The region $cal(R)$ has no boundary, so there are no boundary points to check.
  3. The region $cal(R)$ has four different kinds of limit cases:

    - $x -> 0^+$
    - $y -> 0^+$
    - $x -> +oo$
    - $y -> +oo$.

    In fact all four of these cases cause $f -> +oo$.
    In each of the first two cases, the term $8 / (x y)$ in $f$ causes $f -> +oo$.
    In the case $x -> oo$, the term $x$ causes $f -> +oo$.
    In the case $y -> oo$, the term $y$ causes $f -> +oo$.

  Putting these together:

  - The global minimum is $(2,2)$, at which $f(2,2) = 6$.
  - There is no global maximum, since we saw limit cases where $f -> +oo$. #qedhere
]

== [TEXT] Lagrange multipliers

#warning(title: [Warning for high-school math olympiad students])[
  If you are a high-school student preparing for a proof-based math olympiad,
  read the version at #url("https://web.evanchen.cc/handouts/LM/LM.pdf") instead.
  We use compactness there instead of the wishy-washy terms "boundary", "limit case", etc.
]


Let $f : RR^n -> RR$ be a function we're optimizing over some region $cal(R)$.
We now turn to the case where $cal(R)$, is dimension $n-1$,
because of a single constraint of the form $g(x,y) = c$ or $g(x,y,z) = c$.

We need a new definition of critical point.
To motivate it, let's consider a particular example in @fig-lm.
Here $n = 2$, and

- $f(x,y) = x^2 + y^2$, and
- $g(x,y) = c$ is the red level curve shown in the picture below;
- $cal(R)$ is just the level curve $g(x,y) = c$ (no further $<$ or $<=$ constraints).

Trying to optimize $f$ subject to $g(x,y) = c$ in this picture is the same as
finding the points on the level curve which are furthest or closest to the origin.
I've marked those two points as $P$ and $Q$ in the figure.
The trick to understanding how to get them is to _also_ draw the level curves for $f$
that pass through $P$ and $Q$: then we observe that the level curves for $f$
that get those minimums and maximums ought to be tangent to $g(x,y) = c$ at $P$ and $Q$.

#figure(
  image("figures/minmax-lm.png", width: auto),
  caption: [An example of a LM-type optimization problem, where one finds points on $g(x,y) = c$
  which optimize $f$],
) <fig-lm>

Now how can we check whether there's a tangency?
Answer: look at the gradient!
We expect that $nabla f$ and $nabla g$, at the points $P$ and $Q$, should point in the same direction.
So that gives us the strategy: look for the points where $nabla f$ and $nabla g$ point the same way.

I don't think the following term is an official name, but I like it, and I'll use it:

#definition[
  An *LM-critical point* is a point $P$ such that either

  - $nabla f(P) = lambda nabla g(P)$ for some scalar $lambda$; or
  - $nabla g(P) = 0$.
]

Note that there are _two_ hypotheses.
If you want, you can think about this as requiring that $nabla f (P)$ and $nabla g (P)$
are _linearly dependent_, so it's only one item.
However, in practice, people end up usually breaking into cases like this.

#digression[
  The parameter $lambda$ is the reason for the name "Lagrange multipliers";
  it's a scalar multiplier on $nabla g$.
  Personally, I don't think this name makes much sense.
]

Now that we have this, we can describe the recipe for the "hard" case.
The only change is to replace the old critical point definition (where $nabla f (P) = 0$)
with the LM-critical point definition.

== [RECIPE] Lagrange multipliers

#recipe(title: [The hard case of optimization: Lagrange multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n-1$ due to a single constraint $g = c$ for some $g : RR^n -> RR$.

  1. Evaluate $f$ on all the *LM-critical points* of $f$ that lie on the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ of the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ of the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).

  If there are any points at which $f$, $g$, $nabla f$, $nabla g$ are undefined,
  you should check those as well.
  However, these seem to be pretty rare for the examples that show up in 18.02.
]

Again, this is the same recipe as @sec-recipe-opt-easy, except we changed "critical point"
to "LM-critical point".

#tip[
  Remember how finding critical points could lead to systems of equations that
  required quite a bit of algebraic skill to solve?
  The same is true for Lagrange multipliers, but even more so,
  because of the new parameter $lambda$ that you have to care about.
  So the reason this is called the "hard case" isn't because the 18.02 ideas needed are different,
  but because the algebra can become quite involved in finding LM-critical points.

  In fact, in high school math competitions, the algebra can sometimes become so ugly
  that the method of Lagrange multipliers is sometimes jokingly called "Lagrange _murderpliers_"
  to reflect the extreme amount of calculation needed for some problems.
]

#tip[
  When solving the system of equations, one strategy is to start by eliminating $lambda$,
  because we don't usually care about the value of $lambda$.
]

#sample[
  Find the minimum and maximum possible value, if they exist, of
  $ f(x,y,z) = x + y + z $
  over $x,y,z > 0$ satisfying the condition $x y z = 8$.
]
#soln[
  The region $cal(R)$ is two-dimensional, consisting of strict inequalities
  $x, y, z > 0$ and the condition $g(x,y,z) = x y z = 8$.
  We carry out the recipe.

  1. To find the LM-critical points, we need to compute both $nabla f$ and $nabla g$.
    We do so:
    $ nabla f (x,y,z) &= vec(1,1,1) \ nabla g &= (y z, z x, x y). $
    Now, there are no points with $nabla g = vec(0,0,0)$ in the region $cal(R)$,
    because in $cal(R)$ all the variables are constrained to be positive.
    So we now solve the system
    $
      1 &= lambda y z \
      1 &= lambda z x \
      1 &= lambda x y
    $
    and see what values it takes.

    The trick to solving the system of equations is to divide the first two to get
    rid of the parameter $lambda$, which we don't really care about, to get
    $ 1 / 1 = (lambda y z)/(lambda z x) = y / x. $
    So we must have $x = y$.
    Similarly, we find $y = z$ and $z = x$.

    Hence the LM-critical point must have $x = y = z$.
    Since $x y z = 8$, it follows the only LM-critical point is $(2,2,2)$.
    Evaluating $f$ here gives $f(2,2,2) = 8$.

  2. The region $cal(R)$ has no boundary, because no $<=$ or $>=$ constraints are present.
  3. The region $cal(R)$ has limit cases when any of the variables $x,y,z$
    either approach $0$ or $+oo$.
    However, remember that $x y z = 8$.
    So if any variable approaches $0$, some other variable must become very large.
    Consequently, in every limit case, we find that $f -> +oo$.

  Collating all these results:

  - The unique global minimum is $(2,2,2)$ at which $f(2,2,2) = 8$.
  - There is no global maximum. #qedhere
]

#remark[
  If you're paying close enough attention, you might realize this sample question we just did
  is a thin rewriting of the example in @sec-recipe-opt-easy.
  This illustrates something: sometimes you can rewrite a hard-case optimization problem in $3$
  variables to an easy-case one with $2$ variables.
]

The following sample question shows an optimization within an optimization problem.
If you've seen the movie _Inception_, yes, one of those.
#sample[
  Find the minimum and maximum possible value, if they exist, of
  $ f(x,y,z) = x^4 + y^4 + z^4 $
  over the region $x^2 + y^2 + z^2 <= 1$.
]
#soln[
  At first glance, this seems like it should be in the easy case!
  The region $cal(R)$ consisting of the closed ball $x^2 + y^2 + z^2 <= 1$ is indeed three-dimensional.
  But the reason this sample question is in this section is because
  we will find that checking the boundary case requires another application of Lagrange multipliers.

  Let's carry out the easy case recipe.

  1. First let's find the critical points of $f(x,y,z) = x^4 + y^4 + z^4$.
    Write $ nabla f = vec(4x^3, 4y^3, 4z^3). $
    Solving the insultingly easy system of equations $4x^3 = 4y^3 = 4z^3 = 0$
    we see the only critical point is apparently $x=y=z=0$.
    The value there is $f(0,0,0) = 0$.

  2. The boundary of $cal(R)$ is $x^2 + y^2 + z^2 = 1$, the unit sphere;
    we denote this sphere by $cal(S)$.
    So now we have to evaluate $f$ on this boundary.
    The issue is that there are a lot of points on this unit sphere!
    We can't just check them one by one and there is on easy algebraic way to deal with them.
    Therefore, we will use Lagrange multipliers with the constraint function $g(x,y,z) = x^2+y^2+z^2$.

    1. Let's find the LM-critical points for $f$ on $cal(S)$.
      Take the gradient of $g$ to get
      $ nabla g = vec(2x, 2y, 2z) $.
      The only point at which $nabla g = bf(0)$ is $x=y=z=0$ which isn't on the sphere $cal(S)$,
      so we don't have to worry about $nabla g = bf(0)$ the case.
      Now we instead solve
      $ vec(4x^3, 4y^3, 4z^3) = lambda vec(2x, 2y, 2z). $
      This requires some manual labor to solve, because there are lots of cases.
      The equation for $x$ says that
      $ 4x^3 = lambda dot 2 x <==> x = 0 " or " x = pm sqrt(lambda/2) $
      and similarly for $y$ and $z$.

      In other words, *all the nonzero variables* should have the same absolute value.
      (Think about why this sentence is true.)
      So if all three variables are nonzero, then $|x| = |y| = |z| = 1/(sqrt(3))$
      (because $x^2+y^2+z^2=1$ as well).
      If two variables are nonzero, then their absolute values are $1/(sqrt(2))$ by the same token.
      And if only one variable is nonzero, it is $pm 1$.
      (Note of course that $(0,0,0)$ does not lie on $cal(S)$.)

      So in summary, there are *26 LM-critical points* given by the following list:
      - $(pm 1/(sqrt(3)), pm 1/(sqrt(3)), pm 1/(sqrt(3)))$; there are 8 points in this case.
        The $f$-values are all $1/3$.
      - $(pm 1/(sqrt(2)), pm 1/(sqrt(2)), 0)$; there are 4 points in this case.
        The $f$-values are all $1/2$.
      - $(pm 1/(sqrt(2)), 0, pm 1/(sqrt(2)))$; there are 4 points in this case.
        The $f$-values are all $1/2$.
      - $(0, pm 1/(sqrt(2)), pm 1/(sqrt(2)))$; there are 4 points in this case.
        The $f$-values are all $1/2$.
      - $(pm 1, 0, 0)$; there are 2 points in this case.
        The $f$-values are all $1$.
      - $(0, pm 1, 0)$; there are 2 points in this case.
        The $f$-values are all $1$.
      - $(0, 0 pm 1)$; there are 2 points in this case.
        The $f$-values are all $1$.

      Phew! Okay. The other cases are much shorter:

    2. $cal(S)$ has no boundary to consider.
    3. $cal(S)$ has no limit cases to consider.

  3. $cal(R)$ has no limit cases to consider.

  Okay, marathon done. Collate everything together.
  The values of $f$ we saw were $0$, $1/3$, $1/2$ and $1$,
  and there were no limit cases of any sort. So:

  - $f(0,0,0) = 0$ is the global minimum.
  - $f(pm 1,0,0) = f(0,pm 1,0) = f(0,0, pm 1) = 1$ are the global maximums. #qedhere
]

== [SIDENOTE] Compactness as a way to check your work

This is an optional section containing a nice theorem from
18.100 that could help you check your work, but isn't necessary in theory.

I need a new word called "compact", and like before,
it's beyond the scope of 18.02 to give a proper definition,
However, I will hazard the following one: for 18.02 examples,
*$cal(R)$ is compact if there are no limit cases*.
That is,

- All the constraints are $=$, $<=$, or $>=$; no $<$ or $>$,
- None of the variables can go to $pm oo$.

#tip(title: [Tip: Compact optimization theorem])[
  If $cal(R)$ is a compact region,
  and $f$ is a function to optimize on the region which is continuously defined everywhere,
  then there must be at least one global minimum, and at least one global maximum.
]
This works in both the easy case (no Lagrange multipliers) and the hard case (with Lagrange multipliers).

#example[
  Here's some examples of how this theorem can help you:

  - Suppose you are asked to optimize a continuous function $f(x,y)$
    on the square $-1 <= x <= 1$, $-1 <= y <= 1$.
    We saw this square has no limit cases.
    Then the compact optimization theorem promises you that the answer
    "no global minimum" or "no global maximum" will never occur.

  - Suppose you are asked to optimize a continuous function $f(x,y,z)$
    on the sphere $x^2 + y^2 + z^2 = 1$
    (which means you are probably going to use Lagrange multipliers).
    We saw this sphere has no limit cases (and not even a boundary).
    Then the compact optimization theorem promises you that the answer
    "no global minimum" or "no global maximum" will never occur.

  - Suppose you are asked to optimize a continuous function $f(x,y,z)$
    on the closed ball $x^2 + y^2 + z^2 <= 1$, like in the last example.
    This closed ball also has no limit cases,
    so the compact optimization theorem promises you that the answer
    "no global minimum" or "no global maximum" will never occur.
]

== [RECAP] Recap of Part Foxtrot on Optimization

- We introduced the notion of critical points as points where $nabla f = bf(0)$.
  - We saw that critical points could be local minimums, local maximums, or saddle points.
  - We introduced the second derivative test as a way to tell some of these cases apart,
    although the second derivative test can be inconclusive.
- We talked about how regions have dimensions, limit cases, and boundaries.
  Although we didn't give a proper definition, we explain rules of thumb that work in 18.02.
- For optimization problems with no $=$ constraints,
  we check the critical points, limit cases, and boundaries.
- For optimization problems with one $=$ constraints,
  we check the LM-critical points, limit cases, and boundaries.


== [EXER] Exercises

#todo[Make some up]

#pagebreak()
