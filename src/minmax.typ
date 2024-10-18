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
Each row includes all the ones above it, but not vice-versa.
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
$f(x) = x^3$ has a critical inflection point at the origin, for example.)

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
(If you want to see the code, it's in the Appendix, @appendix-saddle-sim.)

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
the north/south pair to have the same sign as the east/west pair.
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
== [TEXT] General advice for solving systems of equations <sec-system-advice>

In the last example with $f(x,y) = x y(6 - x - y)$,
we saw the solving a system of equations is not necessarily an easy task.
In general, solving a system of generic equations,
even when the number of variables equals the number of unknowns,
can be disproportionately difficult in the number of variables.

#digression(title: [Digression: Even simple-looking systems can be challenging])[
  It's easy to generate examples of systems that can't be solved by hand.
  But it's also possible to generate examples of systems that look innocent,
  _and_ can be solved by hand in a nice way,
  _but_ for which finding that nice way is extremely challenging.

  One example of such a system of equations is
  $
  x^3 &= 3 x - 12 y + 50 \
  y^3 &= 12 y + 3 z - 2 \
  z^3 &= 27 z + 27 x.
  $
  There is a way to solve it by hand, but it's quite hard to come up with,
  even for the best high school students in the world.
  (The source of the problem is the
  #link("https://aops.com/community/p1566057")[USA Team Selection Test 2009].)
]

This means that you need to put away your chef hat for a moment
and put on your problem-solving cap:
The good news is that it's all high-school algebra: no calculus involved, no derivatives, etc.
The bad news is that it's tricky. You really have to think.

#tip(title: [Tips on systems of equations])[
  - When solving a system of equations, *treat it like a self-contained algebra puzzle*.
    That means you cannot just blindly follow a recipe, but need to actually think.

  - Possible strategy in some situations: try to isolate one variable in terms of others.
    For example, if you see $x^2 + x + 2 y = 7$,
    one strategy is to rewrite it as $y = 1/2 (7 - (x^2 + x))$
    and then use that substitution to kill all the $x$'s for your system.
    This reduces the number of variables by $1$, at the cost of some work.

  - If there's symmetry in the system of equations, see if you can exploit it to save work.

  - Try to factor things when you spot factors.
    For example, if you see $x y - x = 0$, write it as $x (y-1) = 0$,
    then either $x=0$ or $y=1$.

  - If you are taking square roots of both sides,
    That is, if $a^2 = b^2$, you conclude $a = pm b$, not $a = b$.

  - Be careful in making sure you don't miss cases if you start getting OR statements.
    In the last example, there were $2^2 = 4$ cases.
    You can easily imagine careless students accidentally forgetting a case.

  - See if you can "guess" some obvious solutions to start (e.g. all-zero).
    If so, note them down so you know that they should show up later.
]

I also need one warning: be really careful about *division by zero*.
For example, in the example from last section,
careless students might try to divide by $y$ and $x$ to get
$
  6 y - 2 x y - y^2 &= 0 ==> 2x + y = 6 \
  6 x - 2 x y - x^2 &= 0 ==> x + 2y = 6.
$
But this is wrong, because $x$ and $y$ could be zero too!
If you make this mistake you're only getting to one of the four critical points.
This is important enough I'll box it:

#warning(title: [Warning: Watch for division by zero])[
  *Any time you divide both sides of an equation*,
  ask yourself if you the expression you're dividing by could be $0$ as well.
  If so, that case needs to be handled separately.
]

I'm going to give two examples, each with three variables,
to show these ideas in the tip I just mentioned.
Fair warning: these are deliberately a bit trickier, to give some space to show ideas.
Don't worry if you can't do these two yourself.
The exam ones will probably tone down this algebra step a bit.

#sample[
  Find all the critical points of the function
  $ f(x, y, z) = x^3 + y^3 + z^3 - 3 x y z. $
]

#soln[
  We first compute the gradient:
  $ nabla f = vec(3 x^2 - 3 y z, 3 y^2 - z x, 3 z ^2 - x y). $

  The critical points occur when $nabla f = bf(0)$,
  which gives us the system of equations (after dividing by $3$):
  $
  x^2 &= y z  \
  y^2 &= z x  \
  z^2 &= x y.
  $
  We'd like to divide out by the variables, but this would be division by zero.
  Indeed, note $(0,0,0)$ is a solution!

  - If $x = 0$, then it follows $z = 0$ from the last equation, then $y = 0$ from the second.
  - By symmetry, if _any_ of the three variables is zero, then all three are.

  Now let's suppose all the variables are nonzero.
  Then we can write the first equation safely as $ z = x^2 / y$
  and use that to get rid of $z$ in the second equation:
  $ y^2 = (x^2 / y) x => x^3 = y^3. $
  Similarly, we get $y^3 = z^3$ and $z^3 = x^3$.

  So in fact $x = y = z$, because we can safely take cube roots of real numbers.
  And any triple with $x = y = z$ works fine.

  In conclusion, every point of the form $(t,t,t)$ is a critical point ---
  an infinite family of critical points!
]

#sample[
  Find all the critical points of the function
  $ f(x, y, z) = z(x-y)(y-z) - 2 x z. $
]
#soln[
  The gradient is given by
  $ nabla f = vec(z(y - z) - 2 z, z(-2y+x-z), y(x-y) -2z(x-y) -2x). $
  That looks scary, but it turns out the first two equations factor.
  Cleaning things up, we get:
  $
    z(y-z-2) &= 0 \
    z(-2y+x+z) &= 0 \
    y(x-y) -2(x-y)z -2x &= 0.
  $
  In the first equation, we have cases on $z = 0$ and $y = z+2$.

  - First case: If $z = 0$, then both the first and second equation are true and give no further information.
    So we turn to the last equation, which for $z = 0$ says
    $ y(x-y) - 2x = 0. $
    This is a linear equation in $x$ that we can isolate:
    $ (y-2) x - y^2 = 0 ==> (y-2) x = y^2. $
    Again, before dividing by $y-2$, we check the cases:

    - If $y = 2$, we get an obvious contradiction $0 = 4$.
    - So we can assume $y != 2$ and $x = y^2/(y-2)$.

    Hence, for _any_ real number $y != 2$, we get a critical point
    $ (y^2/(y-2), y, 0). $

  - Now assume $z != 0$.
    Then we can safely divide by $z$ in the first two equations to get
    $ y &= z + 2 \ x &= 2 y - z. $
    Our strategy now is to write everything in terms of $z$.
    The first equation tells us $y = z+2$, so the second equation says
    $ x = 2(z+2) + z = z + 4. $
    We have one more equation, so we make the two substitutions everywhere and expand:
    $ 0 &= (z+2)((z+4)-(z+2)) -2((z+4)-(z+2))z -2(z+4) \
      &= 2(z+2) - 4z - 2(z+4) = -4z - 4 \
      &==> z = -1. $
    Hence, we get one more critical point $(3, 1, -1)$.

  In conclusion, the answer is
  $ (y^2/(y-2), y, 0) " for every " y != 2 ", plus one extra point" (3, 1, -1). #qedhere $
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
  of a $2 times 2$ matrix just to justify a single result not reused later.
  (Poonen has some hints on quadratic forms in section 9 of his notes
  if you want to look there though.)

  The other downside is that even if quadratic forms are done correctly,
  the second derivative test doesn't work in all cases anyway,
  if the changes of the function near the critical point are sub-quadratic (e.g. degree three).
  And multivariable Taylor series are not on-syllabus for 18.02.
]

So to get this section over with quickly, I'll just give the result.
I'm sorry this will seem to come out of nowhere.

#recipe(title: [Recipe: The second derivative test])[
  Suppose $f(x,y)$ has a critical point at $P$.
  We want to tell whether it's a local minimum, local maximum, or saddle point.
  Assume $f$ has a continuous second derivative near $P$.

  1. Let $A = f_(x x) (P)$, $B = f_(x y) (P) = f_(y x) (P)$, $C = f_(y y) (P)$.
    These are the partial derivatives of the partial derivatives of $f$ (yes, I'm sorry),
    evaluated at $P$.
    If you prefer gradients, you could write this instead as
    $ nabla f_x (P) = vec(A,B), #h(1em) nabla f_y (P) = vec(B,C). $

  2. If $A C - B^2 != 0$, output the answer based on the following chart:
    - If $A C - B^2 < 0$, output "saddle point".
    - If $A C - B^2 > 0$ and $A, C >= 0$, output "local minimum".
    - If $A C - B^2 > 0$ and $A, C <= 0$, output "local maximum".
  3. If $A C - B^2 = 0$, the second derivative test is inconclusive.
    Any of the above answers are possible, including weird/rare saddle points like the monkey saddle.
    You have to use a different method instead.
]

The quantity $A C - B^2$ is sometimes called the _Hessian determinant_;
it's the determinant of the matrix $mat(A, B; B, C)$.

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

#exer[
  Find the critical points of $f(x,y,z) = x^2 + y^3 + z^4$ and classify them
  as local minimums, local maximums, or saddle points.
]

#exer[
  Show that
  $ f(x,y) = (x+y)^(100) - (x-y)^(100) $
  has exactly one critical point, and that critical point is a saddle point.
]

#exerstar[
  Give an example of a differentiable function $f : RR^2 -> RR$ with the following property:
  every lattice point $(x,y)$ (i.e. a point where both $x$ and $y$ are integers)
  is a saddle point, and there are no other saddle points.
  For example, $(2, -7)$, $(100, 100)$, and $(-42, -13)$ should be saddle points,
  but $(1/2, 0)$, $(pi, -sqrt(2))$, and $(sqrt(7), sqrt(11))$ should not be.
]

#exerstar[
  Does there exist a differentiable function $f : RR^2 -> RR$
  such that _every_ point in $RR^2$ is a saddle point?
]

#pagebreak()

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
