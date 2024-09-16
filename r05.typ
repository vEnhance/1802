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

Let $M = mat(cos(60 degree), sin(60 degree); -sin(60 degree), cos(60 degree))$
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

= Recitation problems from Prof Maulik

$ A = mat(1,2;2,1), #h(1em) B = mat(1,2;1,-2), #h(1em) C = mat(-1,0,1;3,4,1;0,0,2). $

/ 1: Find the eigenvalues and eigenvectors of $A$ and $B$.
/ 2: Find the eigenvalues and eigenvectors of $C$.
/ 3: For any real numbers $a$ and $b$, find the eigenvalues and eigenvectors of
    $A = mat(a,0;0,b)$ and $B = mat(a,1;0,a)$.
    If $a = b$, how do these answers differ?

= Post-recitation notes

To be added after recitation.
(I'm finding there's always things to add after seeing the actual questions in recitation.)
