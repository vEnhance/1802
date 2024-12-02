#import "@local/evan:1.0.0":*

= Eigenvalues and eigenvectors

In this section, we'll define an eigenvalue and eigenvector.
The main goal of this section is that:
#goal[
  Given a $2 times 2$ or $3 times 3$ matrix, by the end of this section,
  you should be able to find all the eigenvalues and eigenvectors by hand.
]

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
  Given a matrix $T$, how can we find its eigenvectors (besides $bf(0)$)?
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

At this point, you should be remembering something I told you last section:
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
But we learned how to do this in the last section:
in order to get a degenerate system you need to make sure that
$
  0 = detmat(5-lambda, -2; 3, 10-lambda).
$

#remark[
  At this point, you might notice that this is secretly an explanation
  of why $A - lambda I$ keeps showing up on your formula sheet.
  Writing $A bf(v) = lambda bf(v)$
  is the same as $(A - lambda I) bf(v) = 0$, just more opaquely.
]


Expanding the determinant on the left-hand side gives
$
  0 = detmat(5-lambda, -2; 3, 10-lambda)
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

- We cherry-pick $lambda$ to make sure the system doesn't just solve to $x=y=0$.
- To do the cherry-picking, ensure $det(A - lambda I) = 0$
  so that our system is degenerate.

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

#remark[
  Eigenvectors are sometimes grouped into so-called _eigenlines_ because
  every multiple of an eigenvector is also an eigenvector.
  For example, if you get $2x + y = 0$ for $lambda = 2$,
  any of the following outputs is often acceptable:

  - "Any multiple of $vec(1, -2)$ is an eigenvector for $lambda = 2$"
  - "Any multiple of $vec(-1, 2)$ is an eigenvector for $lambda = 2$"
  - "Any multiple of $vec(100, -200)$ is an eigenvector for $lambda = 2$"
  - ...

  And in practice people will just say "$vec(1,-2)$ is _the_ eigenvector for $lambda = 2$"
  and the "any multiple of" is understood.
]

#sample[
  Find all eigenvalues and eigenvectors of $ A = mat(4, 1; 2, 3). $
]
#soln[
  We follow the recipe:
  1. We compute $A - lambda I$, where
    $I$ is the identity matrix:
    $ A - lambda I = mat(4, 1; 2, 3) - lambda mat(1, 0; 0, 1) = mat(4 - lambda, 1; 2, 3 - lambda) . $
    Now, compute the determinant of $A - lambda I$ and set it equal to zero:
    $ det (A - lambda I) = (4 - lambda) (3 - lambda) - (2 dot 1) = (4 - lambda) (3 - lambda) - 2 . $
    Expanding this:
    $ (4 - lambda) (3 - lambda) = 12 - 7 lambda + lambda^2 , $ so the
    equation becomes:
    $ 12 - 7 lambda + lambda^2 - 2 = 0 ==> 0 = lambda^2 - 7 lambda + 10 = (lambda-2)(lambda-5). $
    Solving for $lambda$ gives $lambda = 2$ or $lambda = 5$.
  2. There are two cases:
    - For $lambda = 5$, solve
      $(A - 5 I) bf(v) = 0$:
      $ A - 5 I = mat(- 1, 1; 2, - 2) ==> mat(- 1, 1; 2, - 2) vec(x, y) = vec(0, 0) . $
      This gives the equation $- x + y = 0$,
      so the eigenvector is $bf(v)_1 = vec(1, 1)$ as well as any multiple of it.

    - For $lambda = 2$, solve $(A - 2 I) bf(v) = 0$:
      $ A - 2 I = mat(2, 1; 2, 1) ==> mat(2, 1; 2, 1) vec(x, y) = vec(0, 0) . $
      This gives the equation $2 x + y = 0$, so the eigenvector is
      $bf(v)_2 = vec(1, - 2)$ or any multiple of it.

  In conclusion, $vec(1,1)$ and its multiples are the eigenvectors for $lambda = 5$
  and $vec(1,-2)$ and its multiples are the eigenvectors for $lambda = 2$.
]

#sample[
  Find the eigenvalues and eigenvectors of the matrix $ A = mat(3, 3; 4, - 1). $
]
#soln[
  We follow the recipe:
  1. First, we compute $A - lambda I$:
    $ A - lambda I = mat(3, 3; 4, - 1) - lambda mat(1, 0; 0, 1) = mat(3 - lambda, 3; 4, - 1 - lambda) . $
    To find the eigenvalues, we set the determinant of $A - lambda I$ equal to zero:
    $ det (A - lambda I) = upright("det") mat(3 - lambda, 3; 4, - 1 - lambda)
      = (3 - lambda) (- 1 - lambda) - (3 dot 4) = (3 - lambda) (- 1 - lambda) - 12 . $
    Expanding this expression:
    $ (3 - lambda) (- 1 - lambda) = - 3 - 3 lambda + lambda + lambda^2 = lambda^2 - 2 lambda - 3 . $
    Now, substitute this into the equation:
    $ lambda^2 - 2 lambda - 3 - 12 = 0 ==> 0 = lambda^2 - 2 lambda - 15 = (lambda-5)(lambda+3) . $
    Solving for $lambda$ gives $lambda = 5$ or $lambda = -3$.

  2. Now, we find the eigenvectors corresponding to each eigenvalue.
    - For $lambda = 5$, we solve $(A - 5 I) bf(v) = 0$.
      First, compute $A - 5 I$:
      $ A - 5 I = mat(3 - 5, 3; 4, - 1 - 5) = mat(- 2, 3; 4, - 6) . $
      We now solve the system:
      $ mat(- 2, 3; 4, - 6) vec(x, y) = vec(0, 0) . $
      This gives the equations:
      $ - 2 x + 3 y = 0 , quad 4 x - 6 y = 0 . $
      From the first equation, we get $x = 3 / 2 y$.
      Therefore, the eigenvectors corresponding to $lambda = 5$
      are the multiples of $vec(3,2)$.
    - For $lambda = - 3$, we solve $(A + 3 I) bf(v) = 0$.
      First, compute $A + 3 I$:
      $ A + 3 I = mat(3 + 3, 3; 4, - 1 + 3) = mat(6, 3; 4, 2) . $
      We now solve the system:
      $ mat(6, 3; 4, 2) vec(x, y) = vec(0, 0) . $
      This gives the equations:
      $ 6 x + 3 y = 0 , quad 4 x + 2 y = 0 . $
      From the first equation, we get $x = - 1 / 2 y$. Therefore, the
      eigenvector corresponding to $lambda = - 3$ is $vec(-1,2)$.

  In conclusion, $vec(3,2)$ and its multiples are the eigenvectors for $lambda = 5$
  and $vec(-1,2)$ and its multiples are the eigenvectors for $lambda = -3$.
]

#sample[
  Find the eigenvalues and eigenvectors of the matrix
  $ A = mat(2, 9; - 1, 8). $
]

#soln[
  We follow the recipe, but this time we'll find the quadratic polynomial in $lambda$
  we get has a repeated root, a new phenomenon.
  Nothing changes much though, recipe still works fine.

  1. We need to find the matrix $A - lambda I$, where $I$ is the identity
    matrix. First, we compute $A - lambda I$:
    $ A - lambda I = mat(2, 9; - 1, 8) - lambda mat(1, 0; 0, 1) = mat(2 - lambda, 9; - 1, 8 - lambda) . $

    To find the eigenvalues, we set the determinant of $A - lambda I$ equal
    to zero:
    $ det (A - lambda I) &= detmat(2 - lambda, 9; - 1, 8 - lambda) \
      &= (2 - lambda) (8 - lambda) - 9 dot (-1) = (2 - lambda) (8 - lambda) + 9 \
      &= lambda^2 - 10 lambda + 25 = (lambda - 5)^2. $
    This gives $lambda = 5$. So we only have one case!

  2. First, compute $A - 5 I$:
    $ A - 5 I = mat(2 - 5, 9; - 1, 8 - 5) = mat(- 3, 9; - 1, 3) . $
    We now solve the system:
    $ mat(- 3, 9; - 1, 3) vec(x, y) = vec(0, 0) . $
    This gives the equations:
    $ - 3 x + 9 y = 0 , quad - x + 3 y = 0 . $
    From the first equation, we get $x = 3 y$. Therefore, the
    eigenvector corresponding to $lambda = 5$ is $vec(3, 1)$ and its multiples.

  The only eigenvalue of the matrix $A = mat(2, 9; - 1, 8)$ is $lambda = 5$ (with multiplicity 2).
  The corresponding eigenvector is $vec(3, 1)$ and its multiples.
]

#sample[
  Find the eigenvalues and eigenvectors of the matrix
  $A = mat(1, 2, 0; 0, 3, 0; 0, 1, 4)$.
]

#soln[
  The matrix is $3 times 3$, but that's no big deal.
  1. We need to find the matrix $A - lambda I$, where $I$ is the identity
    matrix. First, we compute $A - lambda I$:
    $ A - lambda I = mat(1, 2, 0; 0, 3, 0; 0, 1, 4) - lambda mat(1, 0, 0; 0, 1, 0; 0, 0, 1) = mat(1 - lambda, 2, 0; 0, 3 - lambda, 0; 0, 1, 4 - lambda) . $
    To find the eigenvalues, we set the determinant of $A - lambda I$ equal to zero:
    $ det (A - lambda I) &= detmat(1 - lambda, 2, 0; 0, 3 - lambda, 0; 0, 1, 4 - lambda) \
      &= (1 - lambda) upright("det") mat(3 - lambda, 0; 1, 4 - lambda)
      &= (1 - lambda)(3 - lambda)(4 - lambda). $
    Setting this equal to $0$ and solving gives $lambda = 1$, $lambda = 3$, $lambda = 4$.

  2. Now, we find the eigenvectors corresponding to each eigenvalue.

    - For $lambda = 1$:
      We solve $(A - I) bf(v) = 0$. First, compute $A - I$:
      $ A - I = mat(0, 2, 0; 0, 2, 0; 0, 1, 3) . $
      We now solve the system:
      $ mat(0, 2, 0; 0, 2, 0; 0, 1, 3) vec(x, y, z) = vec(0, 0, 0) . $
      In other words $2y = 0$, $2y = 0$ and $y + 3z = 0$.
      From the first and second rows, we have $2 y = 0$, so $y = 0$. From
      the third row, we have $z = 0$.
      There are no constraints on $x$ at all.
      Thus, the eigenvector corresponding to $lambda = 1$ is $ vec(1, 0, 0) $
      and all its multiples, i.e. those vectors for which the second and third component are zero.

    - For $lambda = 3$:
      We solve $(A - 3 I) bf(v) = 0$. First, compute $A - 3 I$:
      $ A - 3 I = mat(- 2, 2, 0; 0, 0, 0; 0, 1, 1) . $
      We now solve the system:
      $ mat(- 2, 2, 0; 0, 0, 0; 0, 1, 1) vec(x, y, z) = vec(0, 0, 0) . $
      In other words, $-2x+2z = 0$, $0=0$ and $y+z=0$.
      From the third row, we have $y = - z$. From the first row, we get
      $- 2 x + 2 z = 0$, so $x = z$. Thus, the eigenvector
      corresponding to $lambda = 3$ is:
      $ vec(1, - 1, 1) $
      and its multiples.

    - For $lambda = 4$:
      We solve $(A - 4 I) bf(v) = 0$. First, compute $A - 4 I$:
      $ A - 4 I = mat(- 3, 2, 0; 0, - 1, 0; 0, 1, 0) . $
      We now solve the system:
      $ mat(- 3, 2, 0; 0, - 1, 0; 0, 1, 0) vec(x, y, z) = vec(0, 0, 0) . $
      In other words, $-3x+2y=0$, $-y=0$, $y=0$.
      Hence $x=y=0$ and there are no constraints on $z$.
      Therefore, the eigenvector corresponding to $lambda = 4$ is:
      $ vec(0, 0, 1) $
      and its multiples, i.e. any vector for which the first two components are $0$.

  In conclusion, the eigenvalues of the matrix $A = mat(1, 2, 0; 0, 3, 0; 0, 1, 4)$
  are $lambda_1 = 1$, $lambda_2 = 3$, and $lambda_3 = 4$;
  the corresponding eigenvectors are:
  $ bf(v)_1 = vec(1, 0, 0) , quad bf(v)_2 = vec(1, - 1, 1), quad bf(v)_3 = vec(0, 0, 1) $
  and their multiples.
]

Up until now I picked examples for which the solutions turn out nicely.
Most of the time it's not like that though.

#sample[
  Find the eigenvalues and eigenvectors of the matrix
  $A = mat(1, 2; 4, 7)$.
]

#soln[
  Keep going, even with terrible numbers.

  1. We need to find the matrix $A - lambda I$, where $I$ is the identity
    matrix. First, we compute $A - lambda I$:
    $ A - lambda I = mat(1, 2; 4, 7) - lambda mat(1, 0; 0, 1) = mat(1 - lambda, 2; 4, 7 - lambda) . $
    To find the eigenvalues, we set the determinant of $A - lambda I$ equal to zero:
    $ det (A - lambda I) = detmat(1 - lambda, 2; 4, 7 - lambda)
      = (1 - lambda) (7 - lambda) - (4 dot 2) = (1 - lambda) (7 - lambda) - 8 . $
    Expanding this expression:
    $ (1 - lambda) (7 - lambda) = 7 - 8 lambda + lambda^2 , $
    so the equation becomes:
    $ 7 - 8 lambda + lambda^2 - 8 = 0 ==> lambda^2 - 8 lambda - 1 = 0 . $
    We now solve the quadratic equation $lambda^2 - 8 lambda - 1 = 0$ using
    the quadratic formula:
    $ lambda = frac(- (- 8) pm sqrt((- 8)^2 - 4 (1) (- 1)), 2 (1)) = frac(8 pm sqrt(64 + 4), 2) = frac(8 pm sqrt(68), 2) = frac(8 pm 2 sqrt(17), 2) . $
    Thus, the eigenvalues are:
    $ lambda_1 = 4 + sqrt(17) , quad lambda_2 = 4 - sqrt(17) . $

  2. Now, we find the eigenvectors corresponding to each eigenvalue.

    - For $lambda_1 = 4 + sqrt(17)$:
      We solve $(A - lambda_1 I) bf(v) = 0$. First, compute $A - lambda_1 I$:
      $ A - lambda_1 I = mat(1 - (4 + sqrt(17)), 2; 4, 7 - (4 + sqrt(17))) = mat(- 3 - sqrt(17), 2; 4, 3 - sqrt(17)) . $
      We now solve the system:
      $ mat(- 3 - sqrt(17), 2; 4, 3 - sqrt(17)) vec(x, y) = vec(0, 0) . $
      This gives the equations:
      $ (- 3 - sqrt(17)) x + 2 y = 0 , quad 4 x + (3 - sqrt(17)) y = 0 . $
      From the first equation, we get $y = frac(3 + sqrt(17), 2) x$.
      Therefore, the eigenvector corresponding to $lambda_1 = 4 + sqrt(17)$ is:
      $ bf(v)_1 = vec(1, frac(3 + sqrt(17), 2)) . $

    - For $lambda_2 = 4 + sqrt(17)$, it's actually exactly the same with $sqrt(17)$
      replaced by $-sqrt(17)$, so I won't repeat it.
      You get the eigenvector
      $ bf(v)_2 = vec(1, frac(3 - sqrt(17), 2)) . $

  In conclusion the eigenvalues of the matrix $A = mat(1, 2; 4, 7)$ are:
  $ lambda_1 = 4 + sqrt(17) , quad lambda_2 = 4 - sqrt(17) . $
  The corresponding eigenvectors are:
  $ bf(v)_1 = vec(1, frac(3 + sqrt(17), 2)) , quad bf(v)_2 = vec(1, frac(3 - sqrt(17), 2)) . #qedhere $
]

== [TEXT] What to expect when solving degenerate systems

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

=== Degenerate systems of three equations may or may not look stupid

When you have three or more equations instead, they don't necessarily look as stupid
(although they still can).
To reuse the example I mentioned before, consider the system of equations
$
  x + 10 y - 9 z &= 0 \
  3 x + y  + 10 z &= 0 \
  4 x + 11 y + z &= 0
$
which doesn't look stupid.
But again, if you check the determinant, you find out
$ detmat(1,10,-9;3,1,10;4,11,1) = 0. $
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

== [SIDENOTE] Complex eigenvalues

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

Nevertheless, let's boldly try this and see what goes wrong in the recipe.
The answer is that you just get some complex numbers instead.


#sample[
  Find the eigenvalues and eigenvectors of the matrix
  $ A = mat(1 / 2, - sqrt(3) / 2; sqrt(3) / 2, 1 / 2). $
]

#soln[
  Follow the recipe, just don't be scared of complex numbers:
  1. We need to find the matrix $A - lambda I$, where $I$ is the identity
    matrix. First, we compute $A - lambda I$:
    $ A - lambda I = mat(1 / 2, - sqrt(3) / 2; sqrt(3) / 2, 1 / 2) - lambda mat(1, 0; 0, 1) = mat(1 / 2 - lambda, - sqrt(3) / 2; sqrt(3) / 2, 1 / 2 - lambda) . $

    To find the eigenvalues, we set the determinant of $A - lambda I$ equal to zero:
    $ det (A - lambda I) &= detmat(1 / 2 - lambda, - sqrt(3) / 2; sqrt(3) / 2, 1 / 2 - lambda) \
      &= (1 / 2 - lambda) (1 / 2 - lambda) - (- sqrt(3) / 2 dot sqrt(3) / 2) \
      &= (1 / 2 - lambda)^2 + 3 / 4 . $
    Setting this equal to zero and solving, we get
    $ lambda = (1 pm sqrt(3) i) / 2 $
    as the two eigenvalues.

  2. Now, we find the eigenvectors corresponding to each eigenvalue.

    - Choose $lambda_1 = frac(1 + i sqrt(3), 2)$ first.
      We solve $(A - lambda_1 I) bf(v) = 0$.
      First, compute $A - lambda_1 I$:
      $ A - lambda_1 I = mat(1 / 2 - frac(1 + i sqrt(3), 2), - sqrt(3) / 2; sqrt(3) / 2, 1 / 2 - frac(1 + i sqrt(3), 2)) = mat(- frac(i sqrt(3), 2), - sqrt(3) / 2; sqrt(3) / 2, - frac(i sqrt(3), 2)) . $
      We now solve the system:
      $ mat(- frac(i sqrt(3), 2), - sqrt(3) / 2; sqrt(3) / 2, - frac(i sqrt(3), 2)) vec(v_1, v_2) = vec(0, 0) . $
      This gives the equations:
      $ - frac(i sqrt(3), 2) v_1 - sqrt(3) / 2 v_2 = 0 , quad sqrt(3) / 2 v_1 - frac(i sqrt(3), 2) v_2 = 0 . $
      From the first equation, we get $v_1 = i v_2$. Therefore, the
      eigenvector corresponding to $lambda_1 = frac(1 + i sqrt(3), 2)$ is:
      $ bf(v)_1 = vec(i, 1) $
      and its multiples.
    - When $lambda_2 = frac(1 - i sqrt(3), 2)$, all the $i$'s flip to $-i$'s and nothing else changes.
      The eigenvector corresponding to $lambda_2 = frac(1 - i sqrt(3), 2)$ is thus
      $ bf(v)_2 = vec(-i, 1) $
      and its multiples.

  In conclusion, the two eigenvalues are
  $ lambda_1 = frac(1 + i sqrt(3), 2) , quad lambda_2 = frac(1 - i sqrt(3), 2) . $
  and the corresponding eigenvectors are:
  $ bf(v)_1 = vec(i, 1) , quad bf(v)_2 = vec(- i, 1). #qedhere $
]

== [TEXT] Trace and determinant

In 18.02 the following definition is briefly mentioned, but we won't do much with it:

#definition(title: [Definition of trace])[
  The trace is the sum of the diagonal entries of the matrix.
]

Then the following two theorems are roughly true:

- The trace of a matrix equals the sum of the eigenvalues, either real or complex.
- The determinant of a matrix equals the product of the eigenvalues, either real or complex.

I say "roughly" because there is a caveat:
most of the time, if you have an $n times n$ matrix,
then there will be $n$ different eigenvalues (if you allow complex ones).
You probably noticed this above.
However, sometimes you'll run into a matrix for which there are fewer than $n$,
and some of the eigenvalues are "repeated",
like the example we got where $(lambda-5)^2 = 0 ==> lambda = 5$.
We won't define what "repeated" means here,
but you need to define repetition correctly to handle these edge cases.

== [SIDENOTE] Application of eigenvectors: matrix powers <sec-matrix-power>

This is off-syllabus for 18.02, but I couldn't resist including it because
it shows you a good use of eigenvalues in a seemingly unrelated problem,
and also reinforces the idea that I keep axe-grinding:
#idea[
  If you have a linear operator $T$,
  and you know the outputs of $T$ on _any_ basis, that tells you all the outputs of $T$.
]

Okay, so here's the application I promised you.
#sample[
  Let $M$ be the matrix $mat(2,1;0,3)$.
  Calculate $M^(100)$.
]
At first glance, you might think this question is obviously impossible without a computer!
Raising a matrix to the $100$th power seems like it would require $100$ matrix multiplications.
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
    M^3 vec(1,0) &= M vec(4,0) = vec(8,0) \
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

== [EXER] Exercises

#exer[
  Compute the eigenvalues and eigenvectors for $mat(1,1;1,1)$ and $mat(5,1;2,4)$.
]
#exer[
  Compute the eigenvalues and eigenvectors for $mat(9,0;0,9)$.
]
#exer[
  Compute the eigenvalues and eigenvectors for $mat(6,1;0,6)$.
]
#exer[
  Give an example of a $2 times 2$ matrix with four nonzero entries
  whose eigenvalues are $5$ and $7$.
  Then find the corresponding eigenvectors.
]
#exer[
  Let $A = mat(4,3;4,8)$.
  - Compute the eigenvalues and eigenvectors for $A$.
  - Compute the eigenvalues and eigenvectors for $A^2$.
  - Compute the eigenvalues and eigenvectors for $A^(100)$.
]

#exer[
  Compute the eigenvalues and eigenvectors of the $3 times 3$ matrix $ mat(1,2,3;2,4,6;3,6,9). $
]
#exerstar[
  Find the eigenvectors and eigenvalues of the $6 times 6$ matrix
  $ mat(5,0,0,0,0,0; 0,-9,0,0,0,0; 0,0,5,0,0,0; 0,0,0,0,0,0; 0,0,0,0,8,1; 0,0,0,0,0,8). $
  (You can do this question without using any determinants.)
]

#exerstar[
  Show that
  $ mat(4,3;6,7)^(20) = mat(33333333333333333334, 33333333333333333333;
    66666666666666666666, 66666666666666666667). $
  (Each number on the right-hand side is $20$ digits.)
]
