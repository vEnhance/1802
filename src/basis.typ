#import "@local/evan:1.0.0":*

= Linear combinations of vectors

== [TEXT] Basis of vectors

== [RECIPE] Describing spans of explicit vectors

== Systems of equations

== [RECIPE] Number of solutions to a square system of linear equations

#pagebreak()

= Eigenthings

== The problem of finding eigenvectors

== How to come up with the recipe for eigenvalues

Let's pretend we didn't go to lecture or recitation,
and see how to solve this problem.
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
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(-1,1)$".
  Or you can say
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(1,-1)$" if you want;
  these are the same thing.
  You could even say
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(100,-100)$"
  and still get credit, but that's silly.

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
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(2,-3)$" if you want;
  these are the same thing.
  You could even say
  "the eigenvectors with eigenvalue $7$ are the multiples of $vec(200,-300)$"
  and still get credit, but that's silly.

== Summary

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
The good news is that one of the three equations is always redundant,
so you can just throw one away and solve for the other two.
For example, in this case we would solve
$
  x + 10 y &= 9z \
  3 x + y  &= -10z
$
for $x$ and $y$, as a function of $z$.
I think this particular example works out to $x = -109/29 z$, $y = 37/29 z$.
And it indeed fits the third equation too.

== Application of eigenvectors: matrix powers
