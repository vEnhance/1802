#import "@local/evan:1.0.0":*

= Optimization problems

Now that we understand both critical points of $f$ and regions $cal(R)$,
we turn our attention to the problem of finding global minimums and maximums.

== [TEXT] The easy and hard cases

Suppose you have a function $f : RR^n -> RR$ that you can compute $nabla f$ for,
and a region $cal(R)$.
We're going to distinguish between two cases:

- The *easy case* is if $cal(R)$ has dimension $n$ as well.
  The rule of thumb says there should be zero "=" constraints.
- The *hard case* is if $cal(R)$ has dimension $n-1$.
  Rule of thumb says there should be one "=" constraint.
  In the hard case, we will use *Lagrange multipliers*.

We won't cover the case where $cal(R)$ has dimension $n-2$ or less in 18.02
(i.e. two or more constraints), although it can be done.

== [RECIPE] The easy case <sec-recipe-opt-easy>

#recipe(title: [Recipe for optimization without Lagrange Multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n$.

  1. Evaluate $f$ on all the *critical points* of $f$ in the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ in the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ in the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).

  If there are any points at which $nabla f$ is undefined, you should check those as well.
  However, these seem to be pretty rare for the examples that show up in 18.02.
]

#warning(title: [Warning: Don't underestimate the boundary!])[
  In 18.01, you probably only optimized functions over intervals $I = [a,b]$,
  in which case the boundary was just two inputs $a$ and $b$.
  In 18.02, the situation is completely different:
  the boundary (if it is nonempty) will often have _infinitely many_ points.
  So it can take a lot of work to do the boundary case!
  Don't underestimate the possible complexity of Step 2.

  In particular, Step 2 might even require you to use Lagrange multipliers,
  i.e. that one step of the easy case is an entire instance of the hard case.
  For that reason, the naming "easy case" and "hard case" is a bit of a misnomer.
]

We'll start with an example with no boundary for which the limit cases are easy to examine,
so Step 2 and Step 3 are mostly harmless.
Later on we'll do more examples where Step 2 and Step 3 are more intricate.

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
  An *LM-critical point* is a point $P$ on the curve/surface $g(P) = c$ such that _either_

  - $nabla f(P) = lambda nabla g(P)$ for some scalar $lambda$; OR
  - $nabla g(P) = 0$.
]

Note that there are _two_ possible situations.
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

#recipe(title: [Recipe for Lagrange multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n-1$ due to a single constraint $g = c$ for some $g : RR^n -> RR$.

  1. Evaluate $f$ on all the *LM-critical points* of $f$ that lie on the region $cal(R)$.
  2. Evaluate $f$ on all the *boundary points* of $f$ of the region $cal(R)$.
  3. Evaluate $f$ on all the *limit cases* of $f$ of the region $cal(R)$.
  4. Output the points in the previous steps that give the best values,
    or assert the optimal value doesn't exist (if points in step 3 do better than steps 1-2).

  If there are any points at which $nabla f$ or $nabla g$ are undefined,
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
  When solving the system of equations,=
  one possible strategy is to start by eliminating $lambda$,
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
    Evaluating $f$ here gives $f(2,2,2) = 6$.

  2. The region $cal(R)$ has no boundary, because no $<=$ or $>=$ constraints are present.
  3. The region $cal(R)$ has limit cases when any of the variables $x,y,z$
    either approach $0$ or $+oo$.
    However, remember that $x y z = 8$.
    So if any variable approaches $0$, some other variable must become large.
    Consequently, in every limit case, we find that $f -> +oo$.

  Collating all these results:

  - The unique global minimum is $(2,2,2)$ at which $f(2,2,2) = 6$.
  - There is no global maximum. #qedhere
]

#remark[
  If you're paying close enough attention, you might realize this sample question we just did
  is a thin rewriting of the example in @sec-recipe-opt-easy.
  This illustrates something: sometimes you can rewrite a hard-case optimization problem in $3$
  variables to an easy-case one with $2$ variables.
]

== [TEXT] Advice for solving systems of equations (reprise)


== [TEXT] Example of an easy case with a boundary that can be handled with common sense

As we alluded to earlier, the boundary of the so-called "easy case" can have infinitely
many points, so you cannot just plug them in one by one to inspect them all.
In some situations, it will still be doable just by inspection,
because the points are so easy to deal with.
We give one such example below.

#todo[to be written]

== [TEXT] Example where the easy case ends up requiring Lagrange multipliers for the boundary

Now here's a case where the boundary requires Lagrange multipliers.
So, it's really a hard-case optimization problem _within_ an easy-case optimization problem.
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
      $ nabla g = vec(2x, 2y, 2z). $
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


== [SIDENOTE] A little common sense can you save you a lot of work

If you step back and think a bit before you try to dive into calculus,
you might find that having a bit of "common sense" might save you a lot of work.
What I mean is, imagine you gave the question to your high school self
before you learned _any_ calculus at all.
Would they be able to say anything about what properties the answer could have?
The answer is, yes, pretty often.

Let's take the example we just did: we asked for the minimum and maximum of
$ f(x,y,z) = x^4 + y^4 + z^4 $
over the region $x^2 + y^2 + z^2 <= 1$.
To show the recipe, I turned off my brain and jumped straight into a really long calculation.
But it turns out you can cut out a lot of the steps if you just use some common sense,
not involving any calculus:

- The _minimum_ is actually obvious: it's just $0$,
  because fourth powers are always nonnegative!
  So $f >= 0$ is obvious even to a high schooler, and $f(0,0,0) = 0$.
- The _maximum_ is not obvious,
  but actually you can see _a priori_ that it must occur on the boundary $x^2 + y^2 + z^2 = 1$.
  Why is this?
  Suppose you had a point in the strict interior $P = (0.1, 0.2, 0.3)$ with $f > 0$.
  Then $f(P) = f(0.1, 0.2, 0.3)$ is some number.
  But you could obviously increase the value of $f$ just by scaling the absolute value
  of things in $P$!
  For example, if I double all the coordinates of $P$ to get $Q = (0.2, 0.4, 0.6)$,
  then $f(Q) = 16 f(P)$.
  As long as $Q$ stays within the sphere, this will be a better value.

  So any point in the interior is obviously not a maximum:
  if you have a point $P$ strictly the interior,
  you could increase $f(P)$ by changing $P$ to have absolute value.

That means if we had used a bit of common sense,
we could have gotten the minimum with no work at all,
and we could have skipped straight to the LM step for the maximum.
So if you aren't too overwhelmed by material already in this class,
look for shortcuts like this when you can.

== [SIDENOTE] Compactness as a way to check your work

This is an optional section containing a nice theorem from
18.100 that could help you check your work,
but isn't necessary in theory if you never make mistakes.
(But in practice...)

I need a new word called "compact", and like before,
it's beyond the scope of 18.02 to give a proper definition.
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
