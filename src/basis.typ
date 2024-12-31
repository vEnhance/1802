#import "@local/evan:1.0.0":*

= Linear combinations of vectors

== [TEXT] Definition of a basis <sec-basis>

Recall in @sec-lintransf-def the following two questions I posed:

/ Q1.: If $T : RR^2 -> RR^2$ is a linear transform and it's given that
  $ T( vec(3,4) ) = vec(pi, 9) " and " T( vec(100, 100) ) = vec(0, 12) $
  what are the vectors for $T( vec(103,104) )$ and $T( vec(203, 204) )$?

/ Q2.:
  If $T : RR^2 -> RR^2$ is a linear transform and it's given that
  $ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4) $
  what is $T( vec(50, 70) )$?

Now if I wanted to make life harder for you, I could have asked:

/ Q3.: Given $T( vec(3,4) ) = vec(pi, 9)$ and $T( vec(100, 100) ) = vec(0, 12)$,
  what is $T( vec(13,37) )$?

This is a lot harder than Q1; however, the question is still solvable.
If I locked you in a room for an hour and told you to work on it,
I think many of you would eventually get the answer:
$ vec(13, 37) = 24 vec(3, 4) - 0.59 vec(100, 100)
  ==> T( vec(13,37) ) = 24 vec(pi, 9) - 0.59 vec(0, 12) = vec(24 pi, 208.92). $

So this shows you something interesting:
actually, $vec(1,0)$ and $vec(0,1)$ is only special insomuch as it makes arithmetic easy.
But if you know the outputs of
$T( vec(3,4) )$ and $T( vec(100, 100) )$, you can _still_ find all the outputs of $T$ you want.
So really $vec(1,0)$ and $vec(0,1)$ aren't _that_ special.

Hence we say $vec(3,4)$ and $vec(100,100)$ are a _basis_ of $RR^2$
(we'll give the definition in just a moment).
Every $bf(v)$ like $vec(13, 37)$ can be written as $c_1 vec(3,4) + c_2 vec(100,100)$
for some $c_1$ and $c_2$, and hence you can solve Q3.

However, let's consider more variations of the question Q3.

/ Q4.: Given $T( vec(3,4) ) = vec(pi, 9)$, what is $T( vec(13,37) )$?

/ Q5.: Given $T( vec(3,4) ) = vec(pi, 9)$, $T( vec(100, 100) ) = vec(0, 12)$,
  and $T( vec(103, 104) ) = vec(pi, 21)$
  what is $T( vec(13,37) )$?

/ Q6.: Given $T( vec(3,4) ) = vec(pi, 9)$ and $T( vec(300, 400) ) = vec(100 pi, 900)$,
  what is $T( vec(13,37) )$?

The variants Q4, Q5, Q6 are all strange in some way and should make you squint.

- Q4 is obviously impossible; _not enough information_ to find an answer.
- Q5 is solvable, but has _redundant information_. You can delete any one hypothesis.
- Q6 suffers from both defects.
  Even though there are two givens, they are redundant.

With the examples illustrated here, let me give the relevant terms:
#definition(title: [Definition of a basis])[
  A *linear combination* of a set of vectors $bf(v)_1$, ..., $bf(v)_k$ in $RR^n$
  is a sum of the form $c_1 bf(v)_1 + ... + c_k bf(v)_k$.

  Then a set of vectors $bf(v)_1$, ..., $bf(v)_k$ in $RR^n$ is:
  - *linearly independent* if every linear combination gives a different vector;
    equivalently, there's no nontrivial linear combination giving $bf(0)$
    other than $c_1 = ... = c_k = 0$;
  - *spanning in $RR^n$* if every other vector $bf(w)$ in $RR^n$ can be written
    as some linear combination;
  - a *basis of $RR^n$* if both of the above are true;
    in other words, every vector in $RR^n$ can be made in _exactly_ one way.
]

The punch line is that these concepts correspond to the behaviors in the questions above;
Q3 has all the "good" properties above, and each of Q4, Q5, Q6 are missing something.

#example[
  - In Q3, $vec(3,4)$ and $vec(100, 100)$ are a basis of $RR^2$.
    Hence, the question Q3 makes a well-formed question.

  - In Q4, the vector $vec(3,4)$ by itself is not spanning
    (though it is linearly independent).
    That's what makes Q4 impossible to answer: you can't make $vec(13, 37)$
    out of just $vec(3,4)$.

  - In Q5, $vec(3,4)$, $vec(100, 100)$, $vec(103,104)$ are not linearly independent
    (though they are spanning), because there's a dependence
    $ vec(3,4) + vec(100, 100) = vec(103,104) $
    between them.

  - In Q6, the two vectors $vec(3,4)$ and $vec(300, 400)$ is missing _both_ good properties.
    The two vectors give redundant information; because $vec(300, 400) = 100 vec(3, 4)$,
    there is a dependence between the vectors.
    And the two vectors are not spanning: you can't make $vec(13,37)$
    out of $vec(3,4)$ and $vec(300, 400)$.
]

So that's what the example showing what the definition is trying to communicate.

You might have a sense already that there's no way to write a "good" question like Q3
for $RR^2$ that uses any number of vectors other than two, and you'd be right.
It turns out a basis for $RR^n$ always has exactly $n$ vectors;
that's what it means that "$RR^n$ is $n$-dimensional".
More examples of correct hunches that we'll explain momentarily:

- In $RR^n$, at least $n+1$ vectors are never linearly independent.
- In $RR^n$, at most $n-1$ vectors are never spanning. (So a basis is always $n$ vectors exactly.)
- Also, if you have exactly $n$ vectors in $RR^n$, and they're linearly independent, then they're a basis.
- Also, if you have exactly $n$ vectors in $RR^n$, and they're spanning, then they're a basis.

== [RECIPE] How to detect a basis

This begs the question: does there exist a way to easily tell whether some vectors are a basis?
For $RR^2$, you can probably tell by looking.
But for $RR^n$ for $n >= 3$, it might be trickier.

In fact, the following theorem is true, though we won't prove it.

#memo(title: [Memorize: Basis for $RR^n$, "buy two get one free"])[
  Suppose you have a bunch of vectors in $RR^n$.
  Any two of the following imply the third:

  1. There are exactly $n$ vectors.
  2. The vectors are linearly independent.
  3. The vectors are span all of $RR^n$.

  Moreover, if item 1 is true, the following fourth item works too:

  4. The determinant of the $n times n$ matrix with the vectors as column vectors is nonzero.
]

We can't prove this result in this class,
but you might have the instinct that 1-3 should all be true for a basis.
The determinant might be more surprising, so here's an explanation why

#digression(title: [Digression on why determinant does the right thing])[
  Let $n = 3$ and consider three vectors $bf(u)$, $bf(v)$, $bf(w)$ in $RR^3$.
  We give an informal explanation for why the determinant lets you tell
  whether these three vectors are a basis or not.

  The matrix in question is formed by taking $bf(u)$, $bf(v)$, $bf(w)$ as the columns of the matrix:
  $ A = mat(bf(u), bf(v), bf(w)) $
  Recall the determinant $det(A)$ geometrically represents the signed volume
  of the parallelepiped spanned by these vectors.

  Suppose $bf(u)$, $bf(v)$, $bf(w)$ are not spanning (i.e. not a basis),
  meaning they fail to occupy the full three-dimensional space.
  Then these vectors are coplanar: you can only get "some" vectors out of them.
  So geometrically, the parallelepiped they form lacks height
  in the direction perpendicular to the plane; resulting in zero volume, that is, $det(A) = 0$.

  Conversely, if $bf(u)$, $bf(v)$, $bf(w)$ were a basis,
  then pictorially this means they span the entire space,
  so the parallelepiped had better be nondegenerate.
  The nondegeneracy corresponds to having nonzero volume, that is, $det(A) != 0$.
  (The sign of the determinant tells you something about the orientation,
  but we don't care about this sign, just the nonzero-ness.)
]

Anyway, in practice, if you have an explicit set of vectors, the recipe is simple now:
#recipe(title: [Recipe for checking if vectors form a basis])[
  Suppose you're given a list of vectors in $RR^n$ and want to know if they're a basis.

  1. If the _number_ of vectors is not $n$, output "no" and stop.
  2. Otherwise, form the matrix with the $n$ vectors as columns, and compute its determinant.
    Output "yes" if and only if the determinant is nonzero.
]

The determinant thing matters: the determinant is doing a _lot_ of work for you.
When $n = 2$ the determinant is unnecessary, because you can just use "slope":
it's obvious that $vec(1,2)$ and $vec(100,200)$ have a dependence.
But for $n >= 3$ *you can't eyeball it*#footnote[Though
  if you have a set of _exactly two_ vectors,
  they're dependent if and only if they're multiples, even in $RR^n$.
  Which you _can_ eyeball;
  so if you're trying to tell whether a span of two vectors in $RR^3$ is a line or plane,
  that's easy.
  (Even more stupidly, a single vector is linearly dependent only when it's the zero vector.)].
For example, the three vectors
$ bf(v)_1 = vec(1,3,4), quad bf(v)_2 = vec(10,1,11), quad bf(v)_3 = vec(-9,10,1) $
might look like unrelated small numbers, but surprisingly it turns out that
#eqn[
  $ 109 vec(1,3,4) - 37 vec(10,1,11) - 29 vec(-9,10,1) = bf(0). $
  <eqn-big-coeff>
]
Without "slope", you cannot notice these dependences by sight for $n >= 3$, so use the determinant.

#sample[
  Is $vec(1, 2)$, $vec(100, 200)$ a basis for $RR^2$?
]
#soln[
  No because $detmat(1, 2; 100, 200) = 0$.
  In this case you can also see directly that $100 vec(1, 2) = vec(100, 200)$,
  so the vectors are not linearly independent.
]

#sample[
  Is $vec(13, 37)$, $vec(42, 88)$ a basis for $RR^2$?
]
#soln[
  Yes because $detmat(13, 37; 42, 88) = 13 dot 88 - 37 dot 42 != 0$.
]

#sample[
  Is $bf(v)_1 = vec(1,3,4)$, $bf(v)_2 = vec(10,1,11)$, $bf(v)_3 = vec(-9,10,1)$ a basis for $RR^3$?
]
#soln[
  No because
  $ detmat(1, 3, 4; 10, 1, 11; -9, 10, 1)
    &= 1 detmat(1, 11; 10, 1) - 3 detmat(10, 11; -9, 1) + 4 detmat(10, 1; -9, 10) \
    &= 1(10-11) - 3(10+99) + 4(100+9) = 0. #qedhere $
]
#sample[
  Is $vec(3,42,18)$, $vec(1,53,17)$, $vec(71,91,13)$ a basis for $RR^3$?
]
#soln[
  No because
  $ detmat(3,1,71; 42,53,91; 18,17,13) = "ugly arithmetic" = -18522 != 0. #qedhere $
]

#remark(title: [Remark: If you randomly generate numbers, you'll get a basis])[
  The above sample was generated randomly when I gave this lecture at MIT.
  The way I presented this was I went up to the board and wrote:

  _"Is $vec(?,?,?)$, $vec(?,?,?)$, $vec(?,?,?)$ a basis for $RR^3$? Answer: no."_

  Then I asked my students to make up nine numbers to fill in the question marks.
  Of course, they picked big numbers,
  and I got to show off my amazing five-digit multiplication skills.

  I did this stunt of writing the answer before I even knew the question
  to make a point: if you pick large truly random numbers,
  the determinant will be some large random number too,
  so there's no chance you'll just get $0$.
  So you should always expect $n$ "random" vectors in $RR^n$ to be a basis,
  and it's only if you cherry-pick them you'll get a non-basis.
]

#sample[
  Is $vec(1,4,5,8)$, $vec(3,8,11,6)$, $vec(6,19,10,2)$ a basis for $RR^4$?
]
#soln[
  No, there are three vectors, and $RR^4$ needs to have exactly four vectors in every basis.
]

== [TEXT] Spans

The basis is the "best-case scenario",
because if you have a basis $bf(v)_1$, ..., $bf(v)_n$ of $RR^n$
then it means every vector of $RR^n$ can be made out of $bf(v)_i$ in exactly one way.
We won't always be so lucky, so we have a word that means "what you can make out of $bf(v)_i$".

#definition(title: [Definition of span])[
  The *span* of a set of vectors $bf(v)_1$, ..., $bf(v)_k$ in $RR^n$ refers
  to the vectors that you can make out of $bf(v)_i$
  (i.e. can be written as a linear combination of $bf(v)_i$).
]

#example(title: [Example of spans in $RR^2$])[
  Consider vectors in $RR^2$.

  - The span of any basis, like $vec(3,5)$ and $vec(7, 11)$, is all of $RR^2$, by definition.
  - Moreover, the span of any set _containing_ a basis is also all of $RR^2$.
    For example, the span of $vec(3,5)$, $vec(8,10)$, $vec(7,11)$, $vec(700,1100)$
    is still all of $RR^2$.
    (Sure, it's not a basis as there are lots of dependencies,
    but that doesn't change that you can make any vector in $RR^2$ out of them;
    you just have some extra vectors you don't have to use.)
  - The span of the vectors $vec(1,2)$, $vec(10, 20)$, $vec(100, 200)$
    is the line $y = 2x$.
    These are the only vectors you can make out of combinations of these three vectors.
  - The span of the single vector $vec(1,2)$ is also the line $y = 2x$.
    That is, in the previous example, $vec(10, 20)$ and $vec(100, 200)$ were totally useless
  - The span of the single vector $vec(0,0)$ is the only one point: $vec(0,0)$ itself.
]

#example(title: [Examples of spans in $RR^3$])[
  Consider vectors in $RR^3$.

  - The span of any basis, like $vec(3,421,8)$, $vec(1,53,17)$, $vec(71,91,13)$
    is all of $RR^3$, by definition.

  - The span of the vectors $vec(1,2,3)$, $vec(10,20,30)$, $vec(100,200,300)$
    is the line consisting of multiples of $y = 2x$ and $z = 3x$,
    though I think it's easier to express this as "multiples of $vec(1,2,3)$".
    These are the only vectors you can make out of combinations of these three vectors.

  - The span of the single vector $vec(1,2,3)$ is the same line.
    That is, in the previous example, $vec(10, 20, 30)$ and $vec(100, 200, 300)$
    were totally useless.

  - The span of $vec(1,3,4)$, $vec(10,1,11)$, $vec(-9,10,1)$ is more interesting.
    We saw before that these three vectors actually have a dependence,
    so they are not a basis and the span is not all of $RR^3$.

    But the span is not just a line either: it's a two-dimensional plane!
    In fact, all three vectors are contained inside the plane
    $ x + y = z. $
    And the span is actually that entire plane;
    any point in the plane turns out to be formed as a combination,
    in fact just using the first two vectors is enough.
    For example, if I picked a random point on the plane like $vec(1337, 2025, 3362)$
    then it turns out the relevant combination is
    $ vec(1337, 2025, 3362) = 19113/29 vec(1,3,4) + 1386/29 vec(10, 1, 11) $
    (I won't explain how I got these coefficients,
    but you could probably figure out yourself if you wanted to).

  - The span of the single vector $vec(0,0,0)$ is the only one point: $vec(0,0,0)$ itself.
]

What you are probably gathering from all these examples is that the span _also_
has a concept of dimension: for example in $RR^3$,
we saw an example of

- a 0-dimensional span, just the single point $angle.l 0,0,0 angle.r$.
- a 1-dimensional span, the line consisting of multiples of $vec(1,2,3)$
- a 2-dimensional span, the plane $x + y = z$.
- a 3-dimensional span if you have a full basis.

This is worth knowing:
#tip[
  Remember, in $RR^n$, the span of a bunch of vectors is

  - always $d$-dimensional for some $d = 0, ..., n$ (so there are $n+1$ kinds of answers);
  - always contains the origin $bf(0)$.
]


== [RECIPE] Describing the span of several vectors

In 18.02 you might be asked to describe the span of some vectors in $RR^2$ and $RR^3$.
From the examples above, you should be able to extrapolate the recipe.

#recipe(title: [Recipe for describing the span of vectors in $RR^2$])[
- *0D case*: Are all the vectors the zero vector $vec(0,0)$? If so the span is just a single *point*.
- *1D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
  If so, and there is at least one nonzero vector,
  the span is a *line* through the origin in the common direction of the vectors.
- *2D case*: Are there two (nonzero) vectors not pointing in the same direction
  (equivalently, are linearly independent)? If so, the span is *all of $RR^2$*.
]

#sample[
  What is the span of the vectors $vec(3,6)$, $vec(10,20)$, $vec(100,200)$, $vec(5000, 10000)$ in $RR^2$?
]
#soln[
  All the vectors are multiples of $vec(1,2)$, so the answer is a line:
  the multiples of $vec(1,2)$.
]

#sample[
  What is the span of $vec(420, 321)$ and $vec(666, 5)$ in $RR^2$?
]
#soln[
  Because the two vectors are not multiples of each other, they are linearly independent.
  (The determinant lets you see this too:
  $detmat(420, 666; 321, 5) = 420 dot 5 - 321 dot 666 = -211686 != 0$.)
  Hence they are a basis of $RR^2$ and the span is all of $RR^2$.
]

#recipe(title: [Recipe for describing the span of vectors in $RR^3$])[
  - *0D case:* Are all the vectors the zero vector $vec(0,0,0)$? If so the span is just a single *point*.
  - *1D case*: Are all the vectors pointing the same direction (i.e. multiples of each other)?
    If so, and there is at least one nonzero vector,
    the span is a *line* through the origin in the common direction of the vectors.
  - *2D case*: Is there more than one direction present,
    but you can't find three vectors which are linearly independent?
    If so, the span is a *plane* through the origin.
    - If you want the equation of the plane, use the cross product.
  - *3D case*: Are there three vectors among them which are linearly independent from each other?
    If so, the span is *all of $RR^3$*.
]
(In 18.02 the reason for the 2D case is really by process of elimination:
you can think of the 2D bullet as what's left over if you rule out 0D, 1D, 3D.)

#sample[
  What is the span of the vectors $vec(3,6,9)$, $vec(10,20,30)$ and $vec(100,200,300)$ in $RR^3$?
]
#soln[
  All the vectors are multiples of $vec(1,2,3)$, so it's a line: the multiples of $vec(1,2,3)$.
]

#sample[
  What is the span of $vec(1,3,4)$, $vec(10,1,11)$ and $vec(-9,10,1)$ in $RR^3$?
]
#soln[
  It should be a two-dimensional plane.
  This follows by process of elimination: we know $d = 0$ and $d = 1$ don't apply here
  (none of these vectors are zero or are multiples of each other)
  and we can rule out $d = 3$ because we can calculate the determinant
  $ detmat(1,10,-9;3,1,10;4,11,1) = 0 $
  to see that our three vectors are _not_ linearly independent.

  How do we actually find the equation of the plane?
  Well, really what we're asking is to find a plane through the origin passing
  through all of $(1,3,4)$, $(10,1,11)$, $(-9,10,1)$
  (we're promised it exists from the determinant being zero:
  again, that's what it means to not be spanning).
  We just want a normal vector to the plane,
  which we can get by taking the cross product of any two of the vectors.
  Arbitrarily, we use the first two:
  $ vec(1,3,4) times vec(10,1,11)
    = detmat(ee_1, ee_2, ee_3; 1, 3, 4; 10, 1, 11)
    = 29 ee_1 + 29 ee_2 - 29 ee_3. $
  That's the normal vector we wanted,
  so we now know $29 x + 29 y - 29 z = 0$ is the plane needed.
  This simplifies to just $#boxed[$ x+y-z=0 $].$
]
#digression[
  Just for comparison, if you had used the second and third vector instead, you'd get
  $ vec(1,3,4) times vec(-9,10,1)
    = detmat(ee_1, ee_2, ee_3; 1, 3, 4; -9, 10, 1)
    = 37 ee_1 + 37 ee_2 - 37 ee_3 $
  while the second and third vectors would give
  $ vec(10, 1, 11) times vec(-9,10,1)
    = detmat(ee_1, ee_2, ee_3; 10, 1, 11; -9, 10, 1)
    = - 109 ee_1 - 109 ee_2 + 109 ee_3 $
  which are all still multiples of $ee_1 + ee_2 - ee_3$,
  so the plane is still $x+y-z=0$.

  It's not a coincidence that the magic numbers $29$, $37$, $109$ from @eqn-big-coeff
  are reappearing in the normal vectors, but this time I won't explain why this is happening,
  and let you ruminate on it yourself if you want to figure out.
]

#sample[
  What is the span of $vec(3,42,18)$, $vec(1, 53, 17)$, $vec(71,91,13)$ in $RR^3$?
]
#soln[
  As we mentioned above (@eqn-big-coeff), you shouldn't eyeball three or more dimensions;
  if you get three vectors in $RR^3$ and want to know if they are linearly independent or not,
  you should always take the determinant:
  $ detmat(3,1,71; 42,53,91; 18,17,13) = "ugly arithmetic" = -18522 != 0. $
  So the three vectors are a basis and the span is all of $RR^3$
]

== [TEXT] Systems of equations

As we commented earlier, a randomly chosen set of $n$ vectors is "usually" a basis for $RR^n$.
I want to now connect this to something else you've seen in high school:
a "random" linear system of $n$ equations and $n$ variables "usually" has only one solution.

For example, in high school algebra, you probably were asked to solve systems of equations like
$ x_1 + 2 x_2 = 14 \
  3 x_1 + 4 x_2 = 38. $
you can do this using whatever method you're used to;
you should find $(x_1,x_2) = (10, 2)$ as the only solution.
And you can probably already tell that $14$ and $38$ could have been any numbers,
and you'd still always get exactly solution.

Why is this relevant to the stuff about basis?
Well, the point is you can view the variables above as coefficients in a linear combination
and consider the previous system of equations as saying
$ x_1 vec(1,3) + x_2 vec(2,4) = vec(14, 38). $
That means our observations can be rephrased in terms of our linear algebra language:
#idea[
  $vec(1,3)$ and $vec(2,4)$ are a basis of $RR^2$,
  so any vector like $vec(14, 38)$ can be made in exactly one way.
]
In other words, as long as the column vectors made bx_2 the left-hand side on a basis,
there's always in fact one solution.

So what goes wrong when it's _not_ a basis?
Let's bring back the example we had in @eqn-big-coeff.
- Consider a system like
  $
    x_1 + 10x_2 - 9x_3 &= 0 \
    3 x_1 + x_2 + 10 x_3 &= 0 \
    4 x_1 + 11 x_2 + x_3 &= 0.
  $
  This equation obviously has at least one solution: $x_1 = x_2 = x_3 = 0$.
  We saw that $vec(1,3,4)$, $vec(10,1,11)$, $vec(-9, 10, 1)$ is not a basis of $RR^3$,
  and what that translates is to saying there are other solutions too:
  reading off @eqn-big-coeff, note that $x_1 = 109k$, $x_2 = -37k$, $x_3 = -29k$
  is a solution for any $k$.

- What if we consider something like
  $
    x_1 + 10 x_2 - 9 x_3 &= 17 \
    3 x_1 + x_2 + 10 x_3 &= 42 \
    4 x_1 + 11 x_2 + x_3 &= 1337
  $
  instead?
  We still know the coefficients on the left-hand side have a dependency,
  so we expect something to "go wrong".

  In this case, the kind of failure is different: $vec(17, 42, 1337)$
  turns out to _not_ be in the span of our three vectors.
  In fact, we earlier saw that the span of the vectors was the plane $x+y=z$,
  which doesn't contain $vec(17, 42, 1337)$.

  So for this system, satisfying these three equations simultaneously should be impossible
  (that is, there are _no solutions_ rather than _too many solutions_).
  And in fact you might be able to see this directly:
  if you add the first two equations
  and subtract the last one you can see the contradiction:
  $
    + [x_1 + 10 x_2 - 9 x_3] &= + 17 \
    + [3 x_1 + x_2 + 10 x_3] &= + 42 \
    - [4 x_1 + 11 x_2 + x_3] &= - 1337 \
    ==> 0 &= 17 + 42 - 1337 " which is absurd."
  $

- On the other hand, if we have
  $
    x_1 + 10 x_2 - 9 x_3 &= 100 \
    3 x_1 + x_2 + 10 x_3 &= 200 \
    4 x_1 + 11 x_2 + x_3 &= 300
  $
  then the span does contain $vec(100, 200, 300)$,
  so we expect to be back in the "too many solutions" case.
  I won't show you how to come up with these numbers (though it's actually not that hard),
  but you can find one example of a solution is $(x_1, x_2, x_3) = (58, 6, 2)$.
  If you put that together with @eqn-big-coeff you can come up with a lot of solutions now:
  $ x_1 &= 58 + 109 k \
    x_2 &= 6 - 37 k \
    x_3 &= 2 - 29 k. $

In summary, what we've seen in this section is that
for a system of $n$ equations in $n$ variables,
we should look at the $n$ column vectors made by the coefficients.
Then

- If those vectors form a basis of $RR^n$ (usual case),
  the system of equations always has one solution.
- Otherwise, the system of equations is defective:
  either it has no solutions at all (is self-contradictory),
  or there are actually infinitely many solutions.

== [RECIPE] Number of solutions to a square system of linear equations

Now, remember that _in practice_ the way we see whether or not $n$ vectors form a basis
is by considering a determinant.
So we can rephrase our findings from the previous section into the following recipe
using the word "determinant" in place of "basis".

#recipe(title: [Recipe for computing the number of solutions to a system of equations])[
  Suppose you are asked to find the number of solutions to a square system
  $
    a_11 x_1 + a_12 x_2 + ... + a_1n x_n &= b_1 \
    a_21 x_1 + a_22 x_2 + ... + a_2n x_n &= b_2 \
    &dots.v \
    a_(n 1) x_1 + a_(n 2) x_2 + ... + a_(n n) x_n &= b_n.
  $
  Let $A$ be the $n times n$ matrix formed by the $a_(i j)$.

  1. If $det A != 0$, you don't even have to look at $b_i$; just *output "exactly 1 solution"*.
  2. If $det A = 0$, you should *output either "zero solutions" or "infinitely many solutions"*,
    depending on whether there is at least one solution.
    To see which case you're in:

    - There's a common case $b_1 = b_2 = ... = b_n = 0$,
      where the system has an obvious solution $x_1 = ... = x_n = 0$.
      Thus output "infinitely many solutions".

    - When $n = 2$, you can usually tell by looking whether the two equations are redundant or not.
      Output "infinitely many solutions" if the two equations are multiples of each other;
      output "zero solutions" if the two equations are multiples of each other.

    - Otherwise, for $n >= 3$, if you can't guess a solution,
      you should eliminate variables one by one.
      However, this case doesn't occur in 18.02.
]

Examples of what I mean when I say "tell by looking" for $n=2$:

- The system $x + 3y = 8$ and $10x + 30y = 80$ is obviously "infinitely many",
  because the two equations are the same. In a case like this, *output "infinitely many"*.

- The system $x + 3y = 8$ and $10x + 30y = 42$ is obviously "no solutions",
  because it would imply $80 = 10 dot 8 = 10 dot (x+3y) = 10x + 30y = 42$,
  which is self-contradictory.
  In a case like this, *output 0*.

== [EXER] Exercises

#exer[
  Take your birthday and write it in eight-digit $Y_1 Y_2 Y_3 Y_4$-$M_1 M_2$-$D_1 D_2$ format.
  Consider the two vectors
  $ bf(v)_1 = vec(M_1 M_2, D_1 D_2) " and " bf(v)_2 = vec(Y_1 Y_2, Y_3 Y_4). $
  For example, if your birthday was May 17, 1994
  you would take $bf(v)_1 = vec(5, 17)$ and $bf(v)_2 = vec(19, 94)$.

  - Compute the span of those two vectors in $RR^2$.
  - Find a current or former K-pop idol who gets a different answer from you
    when they use their birthday.
] <exer-basis-birthday>

#exer[
  In $RR^5$, consider the vector $bf(v) = angle.l 1,2,3,4,5 angle.r$.
  Compute the maximum possible number of linearly independent vectors one can find
  which are all perpendicular to $bf(v)$.
]
