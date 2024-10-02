#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 5],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [18 September 2024],
)

#quote(attribution: [Petey])[The most competent people, with weak processes, will screw up.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

Also, I'm going to start updating the online PDF's with *post-recitation notes*
based on what we talk about during the recitation.
So check the PDF later. (They're up already for R03 and R04.)

= How to find eigen-things of an $n times n$ matrix $A$

This is covered in full detail in Poonen section 6.
Here is a tl;dr, but please read Poonen.
(Unlike Poonen, I prefer $det(A - lambda I)$ to $det(lambda I - A)$ due to fewer minus signs.
This makes no difference.)

1. To find the *eigenvalues*, solve the equation $det(A - lambda I) = 0$ for $lambda$.
  - For $n = 2$ it turns out that this equation is actually just
    $ lambda^2 - (op("Tr") A) lambda + det A = 0 $
    so you can take a shortcut specifically when $n = 2$.
  - In real life, half the time this quadratic equation will have non-real roots.
    I hope this doesn't happen in 18.02, though,
    but I'll give you one example in a moment for your curiosity.

2. To find the *eigenvectors*, for _each_ eigenvalue $lambda$,
  manually solve the system of $n$ equations
  $ (A - lambda I) vec(x_1, dots.v, x_n) = 0 $
  for $x_1$, ..., $x_n$. (For 18.02, usually $n <= 3$.)
  - By the last step, $A - lambda I$ is _not_ invertible, (i.e. $det(A - lambda I) = 0$)
    so this system of $n$ equations is always degenerate.
    It will always have infinitely many solutions, i.e. at least one redundant equation.
    (To tie into last recitation: it has at least one obvious solution, $x_1 = ... = x_n = 0$,
    and because the matrix of coefficients $A - lambda I$ is not invertible, it thus has infinitely many.)


== Example with non-real eigenvalues (not for exam)

Let $M = mat(cos(60 degree), -sin(60 degree); sin(60 degree), cos(60 degree))$
be the matrix corresponding to rotation by $60$ degrees.
(Feel free to replace $60$ by a different number.)
I claim that $M$ has no real eigenvalues or eigenvectors.

Indeed, if $bf(v) in RR^2$ was an eigenvector,
then $M bf(v)$ needs to point in the same direction as $bf(v)$, by definition.
But that can never happen: $M$ is rotation by $60 degree$,
so $M bf(v)$ and $bf(v)$ necessarily point in different directions --- $60$ degrees apart.

If you want, you can compute the characteristic polynomial for $M$.
Indeed, $op("Tr")(M) = 2 cos(60 degree) = 1$
and $det(M) = cos^2(60 degree) + sin^2(60 degree) = 1$.
So the characteristic polynomial is $lambda^2 - lambda + 1 = 0$,
which has two nonreal roots $(1 plus.minus sqrt(-3))/2$.

= An example showing a use for eigenvectors (not for exam)

#exercise[
  Let $M$ be the matrix $mat(2,1;0,3)$.
  Calculate $M^100$.
]
This looks impossible at first glance without a computer.
I'll show you how to do it with eigenvectors.

#soln[
  In R03 and R04, I repeatedly stress the idea if you have a linear operator $T$,
  and you know the outputs of $T$ on _any_ basis, that tells you all the outputs of $T$.

  Idea: we'll find the eigenvectors for $M$, and pray they're independent (they usually are).
  Since $det M = 5$ and $op("Tr") M = 6$,
  the characteristic polynomial is $lambda^2 - 5lambda + 6 = 0$,
  so the eigenvalues are $2$ and $3$.
  If you grind out the corresponding system, you'll find these eigenvectors:

  - The vector $vec(1,0)$ is an eigenvector with eigenvalue $2$,
    because $M vec(1,0) = vec(2,0) = 2 vec(1,0)$.
  - The vector $vec(1,1)$ is an eigenvector with eigenvalue $3$,
    because $M vec(1,1) = vec(3,3) = 3 vec(1,1)$.

  Then it's really easy to apply $M^100$ because it's just multiplication by a constant:
  $
    M^(100) vec(1,0) = 2^(100) vec(1,0); #h(2em)
    M^(100) vec(1,1) = 3^(100) vec(1,1).
  $

  So now we know the outputs of $M^100$ at two linearly independent vectors.
  We can now rewrite this as
  $
    M^(100) vec(1,0) = vec(2^100, 0); #h(2em)
    M^(100) vec(0,1) = M^100 vec(1,1) - M^100 vec(1,0) = vec(3^100 - 2^100, 3^100).
  $
  Thus encoding $M$ as in R03 gives the answer: $M^100 = mat(2^100, 3^100-2^100; 0, 3^100)$.
]

#remark[
  A natural question might be whether every $2 times 2$ matrix (or any $n times n$ matrix)
  has such an basis consisting of only eigenvectors,
  i.e. whether you could do this trick with any matrix.
  It turns out (I won't prove this) that it's always possible for $n times n$ matrices
  as long as the characteristic polynomial has no repeated roots,
  although the eigenvalues might end up being complex numbers.
]

= Recitation problems from official course

$ A = mat(1,2;2,1), #h(1em) B = mat(1,2;-1,-2), #h(1em) C = mat(-1,0,1;3,4,1;0,0,2). $

/ 1: Find the eigenvalues and eigenvectors of $A$ and $B$.
/ 2: Find the eigenvalues and eigenvectors of $C$.
/ 3: For any real numbers $a$ and $b$, find the eigenvalues and eigenvectors of
    $A = mat(a,0;0,b)$ and $B = mat(a,1;0,a)$.
    If $a = b$, how do these answers differ?

= Post-recitation notes: let's redo everything

Based on my pulse today, I want to redo the whole lecture from first principles.
Therefore, the discussion in this section is supposed to stand by itself,
even if you missed both the lecture and recitation and didn't read any other material.
I will try to explain, from first principles, how to find eigenvectors and eigenvalues.

However, I _will_ assume you've read `r03.pdf` and `r04.pdf` from my website,
so if you haven't read those yet, now's a good time to do so.
Math builds on itself, so you need to have those down to make further progress here.

== Terminology

First, the relevant definition:
#definition[
  Given a square matrix $A : RR^n -> RR^n$, suppose that
  $ A bf(v) = lambda bf(v) $
  for some nonzero vector $bf(v)$.
  Then we say that $bf(v)$ is an _eigenvector_ for $A$,
  and $lambda$ is the _eigenvalue_.
]
The prefix "eigen-" means self or own.
It means that $A$ maps $bf(v)$ to a multiple of itself.

The basic problem is:
#problem[
  If we have a matrix $A$, can we find any and all the eigen-things for it?
]

=== Type signatures

I forgot to harp about types as I did in R01.

- The type of "eigenvector" is a _vector_.
- The type of "eigenvalue" is a _scalar_ (i.e. it's a real number).

== Story of how to derive the eigen-things

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

== Good news for people who don't like eigenthings

If you don't like eigen-things, I have some good news for you:
according to what I'm hearing, they won't actually be used much later on this course.
