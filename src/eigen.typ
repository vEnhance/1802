#import "@local/evan:1.0.0":*

= Eigenvalues and eigenvectors

== [TEXT] The problem of finding eigenvectors

Let's define the relevant term first:

#definition[
  Suppose $T$ is a matrix or linear transformation, $lambda$ a scalar,
  and $bf(v)$ is a vector such that
  $ T(bf(v)) = lambda bf(v); $
  that is, $T$ sends $bf(v)$ to a multiple of itself.
  Then we call $lambda$ an *eigenvalue* and $bf(v)$ an *eigenvector*.
]

#typesig[
  Eigenvalues $lambda$ are always scalars.
]

#example[
  Let $T = mat(74,52;32,36)$ and consider the vector $bf(v) = vec(2,1)$. Then
  $ T(bf(v)) = mat(74,52;32,36) vec(2,1) = vec(200,100) = 100 vec(2,1) = 100 bf(v). $
  So we would say $bf(v)$ is an eigenvector with eigenvalue $100$.

  Of course, if $bf(v)$ is an eigenvector, so are all its multiples, e.g.
  $ mat(74,52;32,36) vec(20,10) = vec(2000,1000) = 100 vec(20,10) $
  so $vec(20,10)$ is an eigenvector with the same eigenvalue $100$, etc.
]

#remark[
  The stupid solution $bf(v) = bf(0)$ always satisfies the eigenvector equation for any $lambda$,
  so we will pretty much ignore it and focus only on finding nonzero eigenvectors.
]

The goal of this section is to show:
#question[
  Given an encoding of $T$ as a matrix, how can we find its eigenvectors (besides $bf(0)$)?
]

== [TEXT] How to come up with the recipe for eigenvalues

For this story, our protagonist will be the matrix
$ A = mat(5, -2; 3, 10). $
Phrased another way, the problem of finding eigenvectors is, by definition,
looking for $lambda$, $x$, $y$ such that

$
  A vec(x,y) = lambda vec(x, y)
  <==>
  cases(
    5 x - 2 y = lambda x,
    3 x + 10 y = lambda y
  ).
$

Smart-alecks will say $x=y=0$ always works for every $lambda$.
_Are there other solutions?_

=== Why guessing the eigenvalues is ill-fated

As an example, let's see if there are any eigenvectors $vec(x,y)$ with eigenvalue $100$.
In other words, let's solve

$ mat(5, -2; 3, 10) vec(x, y) = 100 vec(x, y). $

If we solve the system of equations, we get

$
  cases(
    5 x - 2 y = 100 x,
    3 x + 10 y = 100 y
  )
  ==>
  cases(
    -95x - 2y = 0,
    3x - 90y = 0,
  )
  ==> x = y = 0.
$

Well, that's boring. In this system of equations, the only solution is $x = y = 0$.

We can try a different guess: maybe we use $1000$ instead of $100$.
An eigenvector with eigenvalue $1000$ ought to be correspond to
$ mat(5, -2; 3, 10) vec(x, y) = 1000 vec(x, y). $

If we solve the system of equations, we get

$
  cases(
    5 x - 2 y = 1000 x,
    3 x + 10 y = 1000 y
  )
  ==>
  cases(
    -995x - 2y = 0,
    3x - 990y = 0,
  )
  ==> x = y = 0
$

which... isn't any better. We still don't get any solutions besides $x = y = 0$.

At this point, you should be remembering something I told you in R04:
a "random" system of equations and variables usually only has a unique solution.
So if I keep picking numbers out of a hat like $100$, $1000$, etc.,
then I'm unlikely to find anything interesting.
In order to get a system that doesn't just solve to $x=y=0$,
I'm going to need to cherry-pick my number $lambda$.

=== Cherry-picking $lambda$

Let's try to figure out what value of $lambda$ would make the system more interesting.
If we copy what we did above, we see that the general process is:

$
  cases(
    5 x - 2 y = lambda x,
    3 x + 10 y = lambda y
  )
  ==>
  cases(
    (5-lambda)x - 2y = 0,
    3x + (10-lambda)y = 0,
  )
$

We need to cherry-pick $lambda$ to make sure that the system doesn't just
solve to $x = y = 0$ like the examples we tried with $100$ and $1000$.
But we learned how to do this in R04:
in order to get a degenerate system you need to make sure that
$
  0 = det mat(5-lambda, -2; 3, 10-lambda).
$

#remark[
  At this point, you might notice that this is secretly an explanation
  of why $A - lambda I$ keeps showing up on your formula sheet.
  Writing $A bf(v) = lambda bf(v)$
  is the same as $(A - lambda I) bf(v) = 0$, just more opaquely.
]


Expanding the determinant on the left-hand side gives
$
  0 = det mat(5-lambda, -2; 3, 10-lambda)
  = (5-lambda)(10-lambda) + 6 = lambda^2 - 15 lambda + 56 = (lambda - 7)(lambda - 8).
$
Great! So we expect that if we choose either $lambda = 7$ and $lambda = 8$,
then we will get a degenerate system, and we won't just get $x = y = 0$.
Indeed, let's check this:

- When $lambda = 7$, our system is
  $
    cases(
      5 x - 2 y = 7 x,
      3 x + 10 y = 7 y
    )
    ==>
    cases(
      -2x - 2y = 0,
      3x + 3y = 0,
    )
    ==> x = -y.
  $
  So for example, $vec(-13,13)$ and $vec(37,-37)$ will be eigenvectors with eigenvalue $7$:
  $ A vec(-13, 13) = mat(5,-2;3,10) vec(-13, 13) = vec(-91, 91) = 7 vec(-13, 13). $

  On exam, you probably answer
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(-1,1)$",
  or "the eigenvectors with eigenvalue $7$ are the multiples of $vec(1,-1)$" if you want;
  these are the same thing.
  Or if you want to mess with the grader,
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(100,-100)$" is fine too.

- When $lambda = 8$, our system is
  $
    cases(
      5 x - 2 y = 8 x,
      3 x + 10 y = 8 y
    )
    ==>
    cases(
      -3x - 2y = 0,
      3x + 2y = 0,
    )
    ==> x = -2/3 y.
  $
  So for example, $vec(-20, 30)$ is an eigenvector with eigenvalue $8$:
  $ A vec(-20, 30) = mat(5,-2;3,10) vec(-20, 30) = vec(-160, 240) = 8vec(-20, 30). $

  On exam, you should answer
  "the eigenvectors with eigenvalue $8$ are the multiples of $vec(-2,3)$".
  Or you can say
  "the eigenvectors with eigenvalue $8$ are the multiples of $vec(2,-3)$" if you want;
  these are the same thing.
  You could even say
  "the eigenvectors with eigenvalue $8$ are the multiples of $vec(200,-300)$"
  and still get credit, but that's silly.

== [RECAP] Summary

To summarize the story above:

- We had the matrix $A = mat(5, -2; 3, 10)$ and wanted to find $lambda$'s for which
  the equation
  $ mat(5, -2; 3, 10) vec(x,y) = lambda vec(x,y) $
  had solutions other than $x=y=0$.

- We realized that guessing $lambda$ was never going to fly,
  so we went out of our way to cherry-pick $lambda$ to make sure the system was degenerate.
  The buzzwords for this are "find the roots of the characteristic polynomial",
  but I wanted to show that it flows naturally from the end goal.

- For the two values of $lambda$ we cherry-picked,
  we know the system of equations is degenerate.
  So we solve the two degenerate systems and see what happens.

In lectures and notes, the last two bullets are separated as two different steps,
to make it into a recipe.
But don't lose sight of how they're connected!
I would rather call it the following interlocked thing:

#align(center)[
  We cherry-pick $lambda$ to make sure the system doesn't just solve to $x=y=0$.

  To do the cherry-picking, ensure $det(A - lambda I) = 0$
  so that our system is degenerate.
]

== [RECIPE] Calculating all the eigenvalues

To repeat the story:

#recipe(title: [Recipe for finding the eigenvectors and eigenvalues])[
  Given a matrix $A$, to find its eigenvectors and eigenvalues:

  1. Find all the values of $lambda$ such that, if you subtract $lambda$ from every diagonal
    entry of $A$ (that is, look at $A - lambda I)$,
    the resulting square matrix of coefficients has determinant $0$.
  2. For each $lambda$, solve the degenerate system and output the solutions to it.
    (You should find there is at least a one-dimensional space of solutions.)
]

#todo[Write example]

== [TEXT] Solving degenerate systems

When carrying out the recipe for finding eigenvectors and eigenvalues,
after cherry-picking $lambda$, you have to solve a degenerate system of equations.
Since most of the systems of equations you encounter in practice are nondegenerate,
here's a few words of advice on instincts for solving the degenerate ones.

=== Degenerate systems of two equations all look stupid

This is worth repeating:
*degenerate systems of two equations all look stupid*.
Earlier on, we saw the two systems
$
    cases(
      -2x - 2y = 0,
      3x + 3y = 0,
    )
    #h(2em)
    " and "
    #h(2em)
    cases(
      -3x - 2y = 0,
      3x + 2y = 0,
    ).
$
Both look moronic to the eye, because in each equation,
the two equations say the same thing.
This is by design: when you're solving the eigenvector problem,
_you're going out of your way to find degenerate systems_
so that there will actually be solutions besides $x = y = 0$.

In particular: if you do all the steps right,
*you should never wind up with $x = y = 0$ as your only solution*.
That means you either didn't do the cherry-picking step correctly,
or something went wrong when you were solving the system.
If that happens, check your work!

=== Degenerate systems of three equations may not look stupid, but they are

When you have three or more equations instead, they don't necessarily look as stupid.
To reuse the example I mentioned from R04, we have
$
  x + 10 y - 9 z &= 0 \
  3 x + y  + 10 z &= 0 \
  4 x + 11 y + z &= 0
$
which doesn't look stupid.
But again, if you check the determinant, you find out
$ det mat(1,10,-9;3,1,10;4,11,1) = 0. $
So you know _a priori_ that there will be solutions besides $x=y=z=0$.

I think 18.02 won't have too many situations where you need to solve a degenerate
three-variable system of equations, because it's generally annoying to do by hand.
But if it happens, you should fall back on your high school algebra
and solve the system however you learned it in 9th or 10th grade.
The good news is that at least one of the three equations is redundant,
so you can just throw one away and solve for the other two.
For example, in this case we would solve
$
  x + 10 y &= 9z \
  3 x + y  &= -10z
$
for $x$ and $y$, as a function of $z$.
I think this particular example works out to $x = -109/29 z$, $y = 37/29 z$.
And it indeed fits the third equation too.

== [SIDENOTE] Complex eigenvectors

Even in the $2 times 2$ case, you'll find a lot of matrices $M$ with real coefficients
don't have eigenvectors.
Here's one example.

Let $ M = mat(cos(60 degree), -sin(60 degree); sin(60 degree), cos(60 degree))
  = mat(1/2, -sqrt(3)/2; sqrt(3)/2, 1/2). $
be the matrix corresponding to rotation by $60$ degrees.
(Feel free to replace $60$ by a different number.)
I claim that $M$ has no real eigenvalues or eigenvectors.

Indeed, if $bf(v) in RR^2$ was an eigenvector,
then $M bf(v)$ needs to point in the same direction as $bf(v)$, by definition.
But that can never happen: $M$ is rotation by $60 degree$,
so $M bf(v)$ and $bf(v)$ necessarily point in different directions --- $60$ degrees apart.

#todo[what goes wrong?]

== [SIDENOTE] Application of eigenvectors: matrix powers

This is off-syllabus for 18.02, but I couldn't resist including it because
it shows you a good use of eigenvalues in a seemingly unrelated problem,
and also reinforces the idea that I keep axe-grinding:
#align(center)[
  If you have a linear operator $T$,
  and you know the outputs of $T$ on _any_ basis, that tells you all the outputs of $T$.
]

The problem is this:
#question[
  Let $M$ be the matrix $mat(2,1;0,3)$.
  Calculate $M^(100)$.
]
At first glance, you might thinks question is obviously impossible without a computer,
because raising a matrix to the $100$th power would require $100$ matrix multiplications.
But I'll show you how to do it with eigenvectors.

#soln[
  First, we compute the eigenvectors and eigenvalues of $M$.
  If you follow the recipe, you'll get the following results:

  - The vector $vec(1,0)$ is an eigenvector with eigenvalue $2$ (as is any multiple of $vec(1,0)$),
    because $M vec(1,0) = vec(2,0) = 2 vec(1,0)$.
  - The vector $vec(1,1)$ is an eigenvector with eigenvalue $3$ (as is any multiple of $vec(1,1)$),
    because $M vec(1,1) = vec(3,3) = 3 vec(1,1)$.

  Now the trick is the following:
  it's really easy to apply $M^(100)$ to the _eigenvectors_,
  because it's just multiplication by a constant.
  For example, the first few powers of $M$ on $vec(1,0)$
  each double the vector, since they are all eigenvectors with eigenvalue $2$; that is:
  $
    M vec(1,0) &= vec(2,0) \
    M^2 vec(1,0) &= M vec(2,0) = vec(4,0) \
    M^3 vec(1,0) &= M vec(4,0) = vec(8,0)
    &dots.v
  $
  and so on, until
  $ M^(100) vec(1,0) = 2^(100) vec(1,0). $
  By the same token:
  $ M^(100) vec(1,1) = 3^(100) vec(1,1). $
  So now we know the outputs of $M^(100)$ at two linearly independent vectors.
  It would be sufficient, then, to use this information to
  extract $M^(100) (bf(e)_1)$ and $M^100 (bf(e)_2)$.
  We can now rewrite this as
  $
    M^(100) vec(1,0) = vec(2^(100), 0); #h(2em)
    M^(100) vec(0,1) = M^(100) vec(1,1) - M^(100) vec(1,0) = vec(3^(100) - 2^(100), 3^(100)).
  $
  Thus encoding $M$ gives the answer:
  $ M^(100) = mat(2^(100), 3^(100)-2^(100); 0, 3^(100)). #qedhere $
]
