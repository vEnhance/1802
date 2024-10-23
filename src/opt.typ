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

  0. Figure out the boundary and limit cases for the region $cal(R)$.
    (You don't need to look at $f$ for this step.)
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

  0. $cal(R)$ has no boundary and limit cases when any variable approaches $0$ or $+oo$.
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

  Also, some sources will define an LM-critical point in the following
  (in my opinion, more confusing) way.
  Let's say $f(x,y,z)$ is a three-variable function.
  Define a _four-variable_ "Lagrangian function"
  $L(x,y,z,lambda) = f(x,y,z) - lambda g(x,y,z)$.
  Then an LM-critical point is a point for which either $nabla g = bf(0)$
  or $nabla L = 0$, i.e. a normal critical point of $L$.
  It can be checked this is equivalent to the original definition,
  but I personally find this unnatural.
  However, if you like this definition, feel free to use it instead.
]


Now that we have this, we can describe the recipe for the "hard" case.
The only change is to replace the old critical point definition (where $nabla f (P) = 0$)
with the LM-critical point definition.

== [RECIPE] Lagrange multipliers

#recipe(title: [Recipe for Lagrange multipliers])[
  Suppose you want to find the optimal values of $f : RR^n -> RR$ over a region $cal(R)$,
  and $cal(R)$ has dimension $n-1$ due to a single constraint $g = c$ for some $g : RR^n -> RR$.

  0. Figure out the boundary and limit cases for the region $cal(R)$.
    (You don't need to look at $f$ for this step.)
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

#sample[
  Find the minimum and maximum possible value, if they exist, of
  $ f(x,y,z) = x + y + z $
  over $x,y,z > 0$ satisfying the condition $x y z = 8$.
]
#soln[
  We carry out the recipe.

  0. The region $cal(R)$ is two-dimensional, consisting of strict inequalities
    $x, y, z > 0$ and the condition $g(x,y,z) = x y z = 8$.
    So there is no boundary, but there are limit cases if any variables approaches $0$ or $+oo$.
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

Back in @sec-system-advice, when we were finding all the critical points,
I reminded you to be careful about division-by-zero, handle cases carefully,
and gave you some advice for solving systems.
Solving the system for _LM-critical_ points is a similar situation: systems of equations are hard,
and you have to treat it like a self-contained high school algebra puzzle.

For systems of equations generated by Lagrange multipliers,
there's a new feature: a variable $lambda$ whose value is never used,
but which appears in every equation besides the constraint $g = c$.
So a couple tips specific to Lagrange Multiplier systems:

#tip(title: [Tip: Advice for Lagrange Multiplier systems])[
  In addition to the tips in @sec-system-advice,
  here are some strategies that sometimes help:

  - It might make sense to try to get rid of $lambda$ ASAP, if that's easy to do.
    After all, we don't actually care what $lambda$ is.
  - Alternatively, you can try to kill every variable _except_ $lambda$!
    This is commonly used if your equations only involve one non-$lambda$ variable.
    That is, solve for $x$ in terms of $lambda$; do the same for $y$ and $z$.
    Then plug these in the original constraint equation to solve for $lambda$,
    and hence extract $(x,y,z)$.
]

#warning(title: [Warning: Make sure you only divide by nonzero things!])[
  Remember: watch out for division by zero!
  For example, if you get to the equation $2 lambda y = 10 y$,
  for example, this implies EITHER $lambda = 5$ OR $y = 0$.

  During the 2024 midterm, an equation like this appeared
  as part of a step in a standard Lagrange multipliers question.
  Something like 50%-80% of students who got this equation would forget one of the two cases
  (which one they forgot about varied).
  Don't let this be you!
  Whenever you try to cancel, check if it could be zero!
]

Note the second advice bullet is the opposite of the first advice bullet!
Again, systems of equations can't be solved by blindly following recipes.
You should use whatever method you think makes sense for the given problem.
You don't need anyone's permission to use so-and-so approach.

Here's an example where a good idea is to kill $lambda$ ASAP:

#sample[
  Use Lagrange multipliers to find the smallest possible value of
  $x^2 + x y + y^2 + y$ subject to the constraint $x + 2 y = 3$.
]
#soln[
  We want to minimize the function $f (x , y) = x^2 + x y + y^2 + y$
  subject to the constraint $g(x , y) = x + 2 y = 3$.

  0. The constraint region has no boundary, but limit cases along the line $x + 2y = 3$
    if either $x -> +oo$ and $y -> -oo$ and either $x -> -oo$ and $y -> +oo$.

  1. Computing the gradients gives
    $ nabla f &= vec(2 x + y , x + 2 y + 1) \
      nabla g &= vec(1 , 2). $
    Note $nabla g$ is never $bf(0)$.
    Thus, the Lagrange multiplier equation becomes:
    $ vec(2 x + y , x + 2 y + 1) = lambda vec(1 , 2) . $
    This gives the following system of equations:
    $ 2 x + y &= lambda \
      x + 2 y + 1 &= 2 lambda . $
    Combining these two equations gives us an easy way to get rid of $lambda$:
    $ x + 2y + 1 = 2 dot underbrace((2 x + y), = lambda) = 4x + 2y. $
    Cancel out $2 y$ on both sides gives us $x$: $ x + 1 = 4 x ==> x = 1/3 $

    Now substitute $x = 1 / 3$ into the constraint $x + 2 y = 3$ to get:
    $ 2 y = 3 - 1 / 3 = 8 / 3 ==> y = 4 / 3. $

    In other words, the only LM-critical point is $(1/3, 4/3)$, at which point we have
    $ f(1/3, 4/3) = (1 / 3)^2 + (1 / 3) (4 / 3) + (4 / 3)^2 + 4 / 3 =
       1 / 9 + 4 / 9 + 16 / 9 + 4 / 3 = 11/3. $

  2. There is no boundary to check.

  3. If any of the variables goes to $+oo$ (and hence the other goes to $-oo$),
    the value of $f$ will become large too.#footnote[This is actually a bit tricky to see,
      because in this limit case
      you have two positive terms $x^2$ and $y^2$ and one negative term $x y$
      one idea is to write
      $ f(x,y) approx 3 x^2 / 4 + (x / 2 + y)^2 = 3 y^2 / 4 + (x + y / 2)^2 $
      for large $x$ and $y$.
      The first expression shows that if $x$ is big, then so is $f$;
      The first expression shows that if $y$ is big, then so is $f$.
    ]

  In conclusion, the global minimum is $f(1/3, 4/3) = 11/3$.
]

And here's an example where we kill every variable _except_ $lambda$:

#sample[
  Use Lagrange multipliers to find the smallest possible value of
  $x^2 + y^2 + z^2 + y - z$ subject to the constraint $x + 2 y + 3 z = 4$.
]

#soln[
  We want to minimize the function
  $f (x , y , z) = x^2 + y^2 + z^2 + y - z$ subject to the constraint
  $  (x , y , z) = x + 2 y + 3 z = 4$.

  0. The $g = 4$ region is a plane with no boundary but
    limit cases if any variable becomes $pm oo$.

  1. Let's find all the LM-critical points.
    We start by calculating all the gradients:
      $ nabla f &= vec(2 x , 2 y + 1 , 2 z - 1) \
      nabla g &= vec(1 , 2 , 3) . $
    Note the gradient $nabla g$ is never $bf(0)$.
    Thus, the Lagrange multiplier equation becomes:
    $ vec(2 x , 2 y + 1 , 2 z - 1) = lambda vec(1 , 2 , 3)  $
    or
    $ 2 x &= lambda, \ 2 y + 1 &= 2 lambda , \ 2 z - 1 &= 3 lambda . $

    Let's get rid of every variable besides $lambda$, by solving in $lambda$:
    $ 2x = lambda &==> x = lambda / 2 \
      2 y + 1 = 2 lambda &==> y = lambda - 1 / 2 \
      2 z - 1 = 3 lambda &==> z = (3 lambda + 1) / 2. $

    Now substitute $x = lambda / 2$, $y = lambda - 1 / 2$, and
    $z = (3 lambda + 1) / 2$ into the constraint $x + 2 y + 3 z = 4$:
    $ lambda / 2 + 2 (lambda - 1 / 2) + 3 (frac(3 lambda + 1, 2)) &= 4 \
      ==> lambda / 2 + 2 lambda - 1 + frac(9 lambda + 3, 2) &= 4 \
      ==> frac(10 lambda + 3, 2) + 2 lambda - 1 &= 4 \
      ==> 10 lambda + 3 + 4 lambda - 2 &= 8 \
      ==> 14 lambda + 1 &= 8 \
      ==> lambda &= 1/2. $

    Now that we have $lambda$, plug back in to get $(x,y,z)$:
    $ x = lambda / 2 = 1 / 4 , $
    $ y = lambda - 1 / 2 = 1 / 2 - 1 / 2 = 0 , $
    $ z = frac(3 lambda + 1, 2) = frac(3 (1 / 2) + 1, 2) = frac(3 / 2 + 1, 2) = 5 / 4 . $

    This gives a single LM-critical point $(x,y,z) = (1/4, 0, 5/4)$,
    where $f(1/4, 0, 5/4) = 3/8$.

  2. There are no boundary cases to consider.
  3. The limit cases are if one of the variables goes to $pm oo$.
    However, in such a situation $f$ obviously becomes large,
    so there are no minimums in the situation.

  In conclusion, the global minimum is $f(1/4, 0, 5/4) = 3/8$.
]

#digression(title: [Digression: Clever geometric approach for observant students])[
  We show a way you can skip all the calculus steps in the previous problem
  if you can see how to rewrite the question as a geometry one.
  This approach is so clever that you don't even need to find $(1/4, 0, 5/4)$;
  it will directly tell you the minimum value.
  Don't try this on an exam unless you really know what you're doing.

  Let if $P := (x,y,z)$ be a point. Let $cal(H)$ denote the plane $x+2y+3z=4$.
  The magic trick is to rewrite
  $ f = x^2 + y^2 + z^2 + y - z = x^2 + (y+1/2)^2 + (z-1/2)^2 - 1/2 = P Q^2 - 1/2 $
  where $Q := (0, -1/2, 1/2)$.
  In other words, $f(P)$ is a shift of the squared distance of $P$ from $Q$.
  So actually, the global minimum we found $(1/4, 0, 5/4)$
  is the point on the plane $cal(H)$ closest to $Q = (0, -1/2, 1/2)$.

  But if all you care about is the distance from $Q = (0, -1/2, 1/2)$ to the $cal(H)$,
  then using calculus is overkill: instead use the recipe from way back in @sec-distance-plane:
  $ min (P Q) = (|1 dot 0 + 2 dot -1/2 + 3 dot 1/2 - 4|)/(sqrt(1^2+2^2+3^2))
    = 7/(2sqrt(14)). $
  So the minimum is
  $ min(f) = min(P Q)^2 - 1/2 = (7/(2sqrt(14)))^2 - 1/2 = 3/8. $
  Thus, an extremely clever student could have bypassed the entire problem
  by translating it into a geometry question.
  Don't worry, you won't be expected to come up with something like this in 18.02.
]

To top all that of, here is a Lagrange multipliers example that requires
considering tons of cases.
This is probably too lengthy of a calculation for 18.02
because of the amount of arithmetic required; it's here just to illustrate.

#sample[
  Find the minimum and maximum possible of $x^3 + 3y^3 + 4z^3$ subject to $x^4 + y^4 + z^4 = 2$.
]

#soln[
  The region has no boundary nor limit cases.
  So, we will only focus on calculating the LM-critical points.

  The gradients of $f(x,y,z) = x^3+3y^3+4z^3$ and $g(x,y,z) = x^4+y^4+z^4$ are given by
  $ nabla f &= vec(3x^2, 9y^2, 12z^2) \
    nabla g &= vec(4x^3, 4y^3, 4z^3). $
  We begin by simplifying each equation:

  - $3 x^2 - 4 lambda x^3 = 0$ becomes: $x^2 (3 - 4 lambda x) = 0$.
    This gives two possibilities:
    - $x = 0$, or
    - $lambda = (3) / (4 x)$ (assuming $x != 0$).
  - $9 y^2 - 4 lambda y^3 = 0$ becomes: $y^2 (9 - 4 lambda y) = 0$.
    This gives two possibilities:
    - $y = 0$, or
    - $lambda = (9) / (4 y)$ (assuming $y != 0$).
  - $12 z^2 - 4 lambda z^3 = 0$ becomes: $z^2 (12 - 4 lambda z) = 0$.
    This gives two possibilities:
    - $z = 0$, or
    - $lambda = 3 / z$ (assuming $z != 0$).

  This gives a total of eight cases!
  We will go through them all individually.

  / Case 1 where $x = 0$, $y = 0$, $z != 0$:
    From the constraint $z^4 = 2$, we get: $ z = pm root(4, 2) . $
    Thus, $lambda = 3 / z = pm 3 / root(4, 2)$.
  / Case 2 where $x = 0$, $y != 0$, $z = 0$:
    From the constraint $y^4 = 2$, we get: $ y = pm root(4, 2) . $
    Thus, $lambda = (9) / (4 y) = pm frac(9, 4 root(4, 2))$.
  / Case 3 where $x != 0$, $y = 0$, $z = 0$:
    From the constraint $x^4 = 2$, we get: $ x = pm root(4, 2) . $
    Thus, $lambda = (3) / (4 x) = pm frac(3, 4 root(4, 2))$.
  / Case 4 where $x = 0$, $y != 0$, $z != 0$:
    From the constraint $y^4 + z^4 = 2$, we solve using
    $lambda = (9) / (4 y)$ and $lambda = 3 / z$. Equating these, we get:
    $ (9) / (4 y) = 3 / z ==> z = 4 / 3 y . $
    Substitute into the constraint:
    $ y^4 + (4 / 3 y)^4 = 2 ==> y^4 + 256 / 81 y^4 = 2 . $
    This simplifies to:
    $ 337 / 81 y^4 = 2 ==> y^4 = 162 / 337 ==> y = pm root(4, 162 / 337) . $
    Thus, $z = pm 4 / 3 root(4, 162 / 337)$.
  / Case 5 where $x != 0$, $y = 0$, $z != 0$:
    From the constraint $x^4 + z^4 = 2$, we solve using
    $lambda = (3) / (4 x)$ and $lambda = 3 / z$. Equating these, we get:
    $ (3) / (4 x) = 3 / z ==> z = 4 x . $ Substitute
    into the constraint:
    $ x^4 + (4 x)^4 = 2 ==> x^4 + 256 x^4 = 2 ==> 257 x^4 = 2 . $
    Thus, $x^4 = 2 / 257$, and:
    $ x = pm root(4, 2 / 257) , quad z = pm 4 root(4, 2 / 257) . $
  / Case 6 where $x != 0$, $y != 0$, $z = 0$:
    From the constraint $x^4 + y^4 = 2$, we solve using
    $lambda = (3) / (4 x)$ and $lambda = (9) / (4 y)$. Equating these, we
    get: $ (3) / (4 x) = (9) / (4 y) ==> y = 3 x . $
    Substitute into the constraint:
    $ x^4 + (3 x)^4 = 2 ==> x^4 + 81 x^4 = 2 ==> 82 x^4 = 2 . $
    Thus, $x^4 = 1 / 41$, and:
    $ x = pm root(4, 1 / 41) , quad y = pm 3 root(4, 1 / 41) . $
  / Case 7 where $x != 0$, $y != 0$, $z != 0$:
    Equating the three expressions for $lambda$:
    $ (3) / (4 x) = (9) / (4 y) = 3 / z . $ From
    $(3) / (4 x) = (9) / (4 y)$, we get $y = 3 x$, and from
    $(3) / (4 x) = 3 / z$, we get $z = 4 x$. Substitute into the
    constraint:
    $ x^4 + (3 x)^4 + (4 x)^4 = 2 ==> x^4 + 81 x^4 + 256 x^4 = 2 ==> 338 x^4 = 2 . $
    Thus, $x^4 = 2 / 338$, and:
    $ x = pm root(4, 1 / 169) , quad y = pm 3 root(4, 1 / 169) , quad z = pm 4 root(4, 1 / 169) . $
    Since $169 = 13^2$ is a square, this could be written more simply as
    $ x = pm 1 / sqrt(13) , quad y = pm 3 / sqrt(13) , quad z = pm 4 / sqrt(13) . $
  / Case 8 where $x = 0$, $y = 0$, $z = 0$:
    This doesn't yield a valid solution because it doesn't like on the constraint $x^4+y^4+z^4=2$.

  Hence there are a whopping total of $26$ LM-critical points.
  They are:
  - $x = 0$, $y = 0$, $z = pm root(4, 2)$,
  - $x = 0$, $y = pm root(4, 2)$, $z = 0$,
  - $x = pm root(4, 2)$, $y = 0$, $z = 0$,
  - $x = 0$, $y = pm root(4, 162 / 337)$, $z = pm 4 / 3 root(4, 162 / 337)$.
  - $x = pm root(4, 2 / 257)$, $z = pm 4 root(4, 2 / 257)$, $y = 0$,
  - $x = pm root(4, 1 / 41)$, $y = pm 3 root(4, 1 / 41)$, $z = 0$,
  - $x = pm 1 / sqrt(13)$,  $y = pm 3 / sqrt(13)$, $z = pm 4 / sqrt(13)$.

  When searching for the maximum, we should always take $+$ for $pm$ to maximize $f(x,y,z)$;
  similarly, the minimum uses only $-$ for $pm$.
  Note also that plugging in all $-$'s is the negative of plugging in all $+$'s.
  So this reduces us from $26$ cases to just $7$.
  If we actually try all seven, we find that the last one is the optimal one;
  that is, the maximum and minimums are
  $ f(1/sqrt(13), 3/sqrt(13), 4/sqrt(13)) &= 2sqrt(13) \
    f(-1/sqrt(13), -3/sqrt(13), -4/sqrt(13)) &= -2sqrt(13). #qedhere $
]

== [TEXT] Example of easy case with a "common-sense" boundary

As we alluded to earlier, the boundary of the so-called "easy case" can have infinitely
many points, so you cannot just plug them in one by one to inspect them all.
In some situations, it will still be doable just by inspection,
because the function is really easy to describe on the boundary.
We give one such example below.

#sample[
  Find the minimum possible value of
  $ f(x,y) = x^2 + y^2 + x y - 6 y $
  in the first quadrant $x,y >= 0$.
]
#soln[
  Follow the recipe:

  0. The first quadrant has limit cases if either $x -> +oo$ or $y -> +oo$.
    The boundary consists of two rays: the positive $x$ axis (from $(0,0)$ due east)
    and the positive $y$ axis (from $(0,0)$ due north).

  1. We calculate the critical points.
    The gradient is given by
    $ nabla f = vec(4x + y, 2y + x - 6). $
    Setting the gradient to the zero vector, we need to solve the system
    $ 4x + y = 0 \ x + 2y - 6 = 0 $
    which is an easy linear system.
      If we let $y = -4x$ from the first equation, we get
    $ 2 (- 4 x) + x - 6 = 0 ==> - 8 x + x - 6 = 0 ==> - 7 x = 6 ==> x = - 6 / 7 . $

    Since we are working in the first quadrant where $x gt.eq 0$, this value is not valid.
    Therefore, there are no critical points in our region $cal(R)$.

  2. As we saw, we have two boundaries.
    There are infinitely many points on the positive $x$ and $y$ axis,
    so we cannot just plug them all in one by one.
    In principle, you could redo the entire easy-case recipe for each boundary parts,
    and it will work.

    However, luckily, the function is quite easy to analyze on each part,
    and we can do it with just high school algebra, no calculus needed.
    This way we don't need to go through the whole recipe again.

    / The boundary of $x = 0$ and $y >= 0$:
      Substitute $x = 0$ into the function:
      $f (0 , y) = 2 (0)^2 + y^2 + 0 dot y - 6 y = y^2 - 6 y$.
      In other words, we need to see what the smallest value of
      $ f(0,y) = y^2-6y " across all " y >= 0 $
      could be.
      You _could_ use the derivative of $y$,
      but I think the fastest thing to do is actually complete the square: the function
      $ f(0,y) = (y-3)^2 - 9 $
      obviously has the smallest value at $f(0,3) = -9$.
      (And $f(0,0) = 0$ and $f(0,+oo) = +oo$ are both worse.)

    / The boundary of $y = 0$ and $x >= 0$:
      Substitute $y = 0$ into the function:
      $ f (x , 0) = 2 x^2 + 0^2 + x (0) - 6 (0) = 2 x^2 . $
      It's obvious that $f(x,0)$ is minimized at $x = 0$.
      (Note that $f(+oo,0) = +oo$ is worse.)

  3. In the limit case where either $x -> +oo$ and $y -> +oo$ it's clear that $f -> +oo$.

  In conclusion, the best value is actually the one from Step 2: we have $f(0,3) = -9$
  being the smallest possible value.
]

== [TEXT] Example of easy case that ends up using Lagrange multipliers for the boundary

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

  0. There are no limit cases, but a boundary $x^2 + y^2 + z^2 = 1$, the unit sphere (not filled).

  1. First let's find the critical points of $f(x,y,z) = x^4 + y^4 + z^4$.
    Write $ nabla f = vec(4x^3, 4y^3, 4z^3). $
    Solving the insultingly easy system of equations $4x^3 = 4y^3 = 4z^3 = 0$
    we see the only critical point is apparently $x=y=z=0$.
    The value there is $f(0,0,0) = 0$.

  2. The boundary of $cal(R)$ is $x^2 + y^2 + z^2 = 1$, the unit sphere;
    we denote this sphere by $cal(S)$.
    So now we have to evaluate $f$ on this boundary.
    The issue is that there are too many points on this unit sphere!
    We can't just check them one by one.
    And unlike the previous example,
    the function is not simple enough that we can use common sense to deal with it.

    Therefore, we will use Lagrange multipliers
    with the constraint function $g(x,y,z) = x^2+y^2+z^2$
    to find the minimum possible value of $f$ on this new region $cal(S)$.

    0. The new region $cal(S)$ has no boundary and no limit cases.
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
      and similarly for $y$ and $z$:
      $ 4y^3 = lambda dot 2 y &<==> y = 0 " or " y = pm sqrt(lambda/2) \
        4z^3 = lambda dot 2 z &<==> z = 0 " or " z = pm sqrt(lambda/2) $

      A priori, this seems like it will require us to take a lot of cases.
      However, we can take advantage of symmetry to reduce the amount of work we have to do.
      The trick is to get rid of $lambda$ as follows:
      #align(center)[
        _Observation: All the nonzero variables $x$, $y$, $z$ should have the same absolute value._
      ]
      To spell it out:
      - If all three variables are nonzero, then $|x| = |y| = |z| = 1/(sqrt(3))$
        (because $x^2+y^2+z^2=1$ as well).
      - If two variables are nonzero, then their absolute values are $1/(sqrt(2))$ by the same token.
      - And if only one variable is nonzero, it is $pm 1$.
      (Note of course that $(0,0,0)$ does not lie on $cal(S)$.)
      Think about why this works.

      So there are *26 LM-critical points* given by the following list:
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
- For the _maximum_ you can actually see
  _a priori_ that it must occur on the boundary $x^2 + y^2 + z^2 = 1$.
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
  you could increase $f(P)$ by moving $P$ farther from the origin.

That means if we had used a bit of common sense,
we could have gotten the minimum with no work at all,
and we could have skipped straight to the LM step for the maximum.
So if you aren't too overwhelmed by material already in this class,
look for shortcuts like this when you can.

#digression(title: [Digression: Even faster solution for observant students])[
  We saw the minimum is obviously $0$ if you just thought about it.
  In fact, you can _also_ similarly find the maximum with no calculus at all
  if you realize the answer should be $f(1,0,0) = 1$.

  Here's how. What we're trying to prove is that
  $ x^4 + y^4 + z^4 <= 1 $
  whenever $x^2+y^2+z^2 <= 1$.
  Because $y^2$ and $z^2$ are nonnegative, it's obvious that $x^2 <= 1$.
  But in fact it's easy to see that $ x^4 <= x^2 " is true whenever " x^2 <= 1. $
  Similarly, $y^4 <= y^2$ and $z^4 <= z^2$.
  Thus
  $ x^4 + y^4 + z^4 <= x^2 + y^2 + z^2 = 1. $
]

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

Here's some examples of how this theorem can help you:

#example[
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
- Finding either critical points or LM-critical points involves solving systems of equations.
  There is no fixed recipe for this, but we gave some possible strategies
  that you can try depending on the exact shape of the system you get.

== [EXER] Exercises

#exer[
  Let $A B C$ be the triangle in the $x y$-plane with vertices
  $A = (-5,0)$, $B = (0,12)$, $C = (9,0)$.
  For what point $P$ in the plane is the sum
  $ P A ^ 2 + P B ^ 2 + P C ^ 2 $
  as small as possible?
] <exer-opt-geo>

#exer[
  Compute the minimum possible value of $x+y$ given that $sin(x)+sin(y)=1$ and $x,y >= 0$.
] <exer-opt-lm-sin>

#exerstar[
  Compute the maximum possible value of
  $ 15x^2 + 12 x y + 16 x z + 6 y^2 + 8 z^2 $
  subject to $x,y,z >= 0$ and $x^3 + (x+y)^3 + (x+z)^3 = 1$.
] <exer-opt-lm-hell>

#pagebreak()
