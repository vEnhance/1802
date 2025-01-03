#import "@local/evan:1.0.0":*

= Solutions to Part Bravo

== Solution to @exer-matrix-rotrefl

#recall-thm(<exer-matrix-rotrefl>)

We calculate the outputs of $T$ on the basis vectors
$ee_1 = angle.l 1,0 angle.r$ and $ee_2 = angle.l 0,1 angle.r$.

For $ee_1$, we first end up with
$ ee_1 = lr(angle.l 1,0 angle.r) -->
  lr(angle.l cos 30 degree, sin 30 degree angle.r) = lr(angle.l sqrt(3)/2, 1/2 angle.r)
  --> lr(angle.l 1/2, sqrt(3)/2 angle.r) = T(ee_1) $
(with the first arrow being the rotation and the second arrow being reflection).

For $ee_2$, we end up with
$ ee_2 = lr(angle.l 0,1 angle.r) -->
  lr(angle.l cos 120 degree, sin 120 degree angle.r) = lr(angle.l -1/2, sqrt(3)/2 angle.r)
  --> lr(angle.l sqrt(3)/2, -1/2 angle.r) = T(ee_2). $

Hence, the answer is
$ T = #boxed[$ mat(1 slash 2, sqrt(3) slash 2; sqrt(3) slash 2, -1 slash 2) $]. $

Alternatively, one could obtain the same answer
by multiplying the matrices corresponding to counterclockwise rotation
and reflection around $y = x$, that is
$ T = mat(0,1;1,0) mat(cos 30 degree, cos 120 degree; sin 30 degree, sin 120 degree) $
would work out to the same thing.
This is just an affirmation that @sec-matrix-mult holds true:
applying two transformations is the same as multiplying their corresponding matrices.

== Solution to @exer-basis-birthday

#recall-thm(<exer-basis-birthday>)

Neither $bf(v)_1$ nor $bf(v)_2$ is zero,
and for almost everyone the two vectors won't be a multiple of each other.
So for most people the answer is that the span is $#boxed[all of $RR^2$]$.

In order to find a K-pop idol whose two vectors are linearly dependent
(to get the answer "line" instead),
we need to find a database of K-pop birthdays, and we need to know where to look in it.
There are roughly two strategies you can adopt:

- For idols born before 2000, the only year that's viable is 1995
  (because $19$ is a prime greater than $12$, the last two digits need to be a multiple of $19$).
  The two days that work here are January 5 and February 10.
  As an example, Jo Sangho from former boy group Snuper was born on February 10, 1995:
  $ bf(v)_1 = vec(02,10) " and " bf(v)_2 = vec(19,95). $

- For idols born after 2000, good years to try would be 2004 or 2005.
  (The year 2004 has May 1 and October 2; the year 2005 has April 1, October 2, December 3.)
  As an example, Machida Riku from KJRGL was born on October 2, 2004:
  $ bf(v)_1 = vec(10,02) " and " bf(v)_2 = vec(20,04). $

== Solution to @exer-basis-perpbasis

#recall-thm(<exer-basis-perpbasis>)

These vectors all need to lie in a hyperplane perpendicular to $bf(v)$,
which is a $#boxed[$ 4 $]$-dimensional space.
(The entries of the vector $bf(v)$ are irrelevant besides $bf(v)$ not being the zero vector.)

== Solution to @exer-eigen-warmup

#recall-thm(<exer-eigen-warmup>)

This is done just by following the recipe.
Here are the answers.

/ Matrix $A = mat(1, 1; 1, 1)$:
  To find the eigenvalues $lambda$, we solve the characteristic equation:
  $ det (A - lambda I) = 0 $ Where $I$ is the identity matrix.

  $ A - lambda I &= mat(1 - lambda, 1; 1, 1 - lambda) \
    det (A - lambda I) &= (1 - lambda)^2 - (1) (1) = lambda^2 - 2 lambda  = lambda(lambda-2). $
  Thus, the eigenvalues are: $ lambda_1 = 0 , quad lambda_2 = 2 $

  Now we compute the eigenvectors:

  - *For $lambda_1 = 0$*:
    $ (A - 0 I) bf(v) &= A bf(v) = mat(1, 1; 1, 1) vec(x, y) = vec(x + y, x + y) = bf(0) \
      x + y &= 0 ==> y = - x $
    Thus, the eigenvectors corresponding to $lambda_1 = 0$
    are all the multiples of $ bf(v)_1 = vec(1, - 1). $

  - *For $lambda_2 = 2$*:
    $ (A - 2 I) bf(v) &= mat(- 1, 1; 1, - 1) vec(x, y) = vec(- x + y, x - y) = bf(0) \
      - x + y &= 0 ==> y = x $
    Thus, the eigenvector corresponding to $lambda_2 = 2$
    are all the multiples of $ bf(v)_2 = vec(1, 1). $

/ Matrix $B = mat(5, 1; 2, 4)$:
  Solve
  $ 0 = det (B - lambda I) = detmat(5 - lambda, 1; 2, 4 - lambda)
    = lambda^2 - 9 lambda + 18 = (lambda-6)(lambda-3). $
  Thus, the eigenvalues are:
  $ lambda_1 = 6 , quad lambda_2 = 3. $

  Now we compute the eigenvectors:

  - *For $lambda_1 = 6$*:
    $ (B - 6 I) bf(v) &= mat(- 1, 1; 2, - 2) vec(x, y) = vec(- x + y, 2 x - 2 y) = bf(0) \
      - x + y &= 0 ==> y = x $
    Thus, the eigenvectors corresponding to $lambda_1 = 6$ are the multiples of
    $ bf(v)_1 = vec(1, 1). $

  - *For $lambda_2 = 3$*:
    $ (B - 3 I) bf(v) &= mat(2, 1; 2, 1) vec(x, y) = vec(2 x + y, 2 x + y) = bf(0) \
      2 x + y &= 0 ==> y = - 2 x $
    Thus, the eigenvectors corresponding to $lambda_2 = 3$ are the multiples of
    $ bf(v)_2 = vec(1, - 2). $

/ Matrix $C = mat(9, 0; 0, 9)$:
  Note the matrix $C$ is actually $9$ times the identity matrix:
  hence the only eigenvalue is $9$, and in fact _every_ vector in $RR^2$ is an eigenvector.

/ Matrix $D = mat(6, 1; 0, 6)$:
  Solve
  $ det (D - lambda I) = detmat(6 - lambda, 1; 0, 6 - lambda) = (6 - lambda)^2 - (1) (0) = (6 - lambda)^2 = 0 $
  Thus, the unique eigenvalue is:
  $ lambda = 6. $

  To find the eigenvector, solve
  $ (D - 6 I) bf(v) = mat(0, 1; 0, 0) vec(x, y) = vec(y, 0) = bf(0) $ $ y = 0 $
  Thus, the eigenvectors satisfy $y = 0$.
  Therefore, the eigenvectors are all non-zero vectors of the form:
  $ bf(v) = vec(x, 0). $

== Solution to @exer-eigen-example

#recall-thm(<exer-eigen-example>)

We arbitrarily pick two vectors with nonzero entries to be the eigenvectors, say:
$ bf(v) = vec(1,1) \
  bf(w) = vec(1,-1). $
Then we seek a matrix $T$ such that
$ T vec(1,1) &= vec(5,5) \
  T vec(1,-1) &= vec(7,-7). $
At this point one could brute-force solve a system of equations
with $T = mat(a,b;c,d)$ in four unknowns.
On the other hand, it's more economical to add the two equations and get
$ T vec(2,0) &= vec(12,-2) ==> T(ee_1) = vec(6,-1) $
whereas if we subtract instead we get
$ T vec(0,2) &= vec(-2,12) ==> T(ee_2) = vec(-1,6). $
This gives us one valid matrix:
$ T = #boxed[$ mat(6,-1;-1,6) $]. $

And we already know the eigenvectors by construction:
they are the multiples of $bf(v)$ (for $lambda = 5$)
and the multiples of $bf(w)$ (for $lambda = 7$).

== Solution to @exer-eigen-6x6

#recall-thm(<exer-eigen-6x6>)

The basic idea is that we can basically work with bare hands,
not needing to resort to the determinants we saw before.
Specifically, suppose we have a proposed
nonzero eigenvector $bf(v) = angle.l x_1, x_2, x_3, x_4, x_5, x_6 angle.r$,
with eigenvalue $lambda$.
Then we are hoping for
$ M bf(v) = vec(5x_1, -9x_2, 5x_3, 0, 8x_5, x_5 + 8x_6) =
  vec(lambda x_1, lambda x_2, lambda x_3, lambda x_4, lambda x_5, lambda x_6) = lambda bf(v). $
Setting each component equal, we get six equations that say the following, in order:

1. Either $x_1 = 0$ or $lambda = 5$.
2. Either $x_2 = 0$ or $lambda = -9$.
3. Either $x_3 = 0$ or $lambda = 5$.
4. Either $x_4 = 0$ or $lambda = 0$.
5. Either $x_5 = 0$ or $lambda = 8$.
6. We have $(lambda - 8) x_6 = x_5$.
  In particular, if $x_6 != 0$ then either $lambda = 8$ or $x_5 != 0$,
  but the previous item tells $x_5 != 0$ forces $lambda = 8$ anyway.

Since at least one of $x_i$ should be nonzero
(since we always ignore $bf(v) = bf(0)$),
it follows $ #boxed[$ lambda = -9, 0, 5, 8 $] $ are the eigenvalues possible.
And we can read off the corresponding eigenvectors from the above six numbered items:

- For $lambda = -9$, the eigenvectors are $angle.l 0, x_2, 0, 0, 0, 0 angle.r$ for any choice of $x_2$.
- For $lambda = 0$, the eigenvectors are $angle.l 0, 0, 0, x_4, 0, 0 angle.r$ for any choice of $x_4$.
- For $lambda = 5$, the eigenvectors are $angle.l x_1, 0, x_3, 0, 0, 0 angle.r$ for any choice of $x_1$ and $x_3$.
- For $lambda = 8$, the eigenvectors are $angle.l 0, 0, 0, 0, 0, x_6 angle.r$ for any choice of $x_6$.
  (The last equation above, when $lambda = 8$, implies $x_5 = 0$.)

== Solution to @exer-eigen-power

#recall-thm(<exer-eigen-power>)

We'll follow the idea in @sec-matrix-power:
find a basis of eigenvectors of $M$ and use that to compute powers of $M$.

As usual, to find the eigenvalues for $M$ we work with
$ 0 = det M = detmat(4-lambda, 3; 6, 7-lambda)
  = (4-lambda)(7-lambda)-18 = lambda^2 - 11 lambda + 10 = (lambda-1)(lambda-10) $
so the eigenvalues are $lambda_1 = 1$ and $lambda_2 = 10$.
Let's find the corresponding eigenvectors again.

- For the eigenvalue $lambda_1 = 1$, we need
  $ mat(4-1, 3; 6, 7-1) vec(x,y) = vec(0,0) <==> x + y = 0 <==> y=  -x $
  so the eigenvectors are all the multiples of $bf(v)_1 = vec(1, -1)$.
- For the eigenvalue $lambda_2 = 10$, we need
  $ mat(4-10, 3; 6, 7-10) vec(x,y) = vec(0,0) <==> -2x + y = 0 <==> y = 2x $
  so the eigenvectors are all the multiples of $bf(v)_2 = vec(1, 2)$.

Hence, when raising to the $20$th power, we should have
$ M^(20) bf(v)_1 = 1^(20) bf(v)_1 &==> M^(20) vec(1, -1) = vec(1, -1) \
  M^(20) bf(v)_2 = 10^(20) bf(v)_2 &==> M^(20) vec(1, 2) = vec(10^(20), 2 dot 10^(20)). $
Hence, we've found $M^(20)$ on two linearly independent vectors!
As we showed in @sec-matrix-power,
this means we should be able to recover $M^(20)$ on the basis vectors too.

To get the first column of $M^(20)$, we write
$ M^(20) (ee_1) &= M^(20) (2/3 vec(1,-1) + 1/3 vec(1, 2))
  = 2/3 M^(20) vec(1,-1) + 1/3 M^(20) vec(1,2)
  = vec((2 + 10^(20)) slash 3, (-2 + 2 dot 10^(20)) slash 3) \
  &= vec(100000000000000000002 slash 3, 199999999999999999998 slash 3)
  = vec(33333333333333333334, 66666666666666666666) $
as needed for the first column.

To get the second column of $M^(20)$, we write
$ M^(20) (ee_2) &= M^(20) (1/3 vec(1,2) - 1/3 vec(1,-1))
  = 1/3 M^(20) vec(1,2) - 1/3 M^(20) vec(1,-1)
  = vec((10^(20) - 1) slash 3, (2 dot 10^(20) + 1) slash 3) \
  &= vec(99999999999999999999 slash 3, 200000000000000000001 slash 3)
  = vec(33333333333333333333, 66666666666666666667) $
as needed for the second column.
This completes the solution.
