#import "@local/evan:1.0.0":*

= Linear transformations and matrices

This section will be presented a bit differently than you'll see in many other places;
I talk about linear transformations first,
and then talk about matrices as an encoding of linear transformations.
I feel quite strongly this way is better, but if you are in an actual course,
their presentation is likely to be different (and worse).

== [TEXT] Linear transformation

The definition I'm about to give is the 18.700/18.701 definition of linear transform,
but the hill I will die on is that this definition is better than the one 18.02.

#definition(title: [Definition of linear transformation])[
  A _linear transform_ $T : RR^n -> RR^m$ is _any_ map obeying
  the two axioms $T(c bf(v)) = c T(bf(v))$ and $T(bf(v) + bf(w)) = T(bf(v)) + T(bf(w))$.
]
So it's a chonky boy: for every $bf(v) in RR^n$, there's an output value $T(bf(v)) in RR^m$.
I wouldn't worry too much about the axioms until later; for now, read the examples.

#example(title: [Examples of linear transformations])[
  The following are all linear transformations from $RR^2$ to $RR^2$:

  - The constant function where $T(bf(v)) = bf(0)$ for every vector $v$
  - Projection onto the $x$-axis: $T(vec(x,y)) = vec(x,0)$.
  - Rotation by an angle
  - Reflection across a line
  - Projection onto the line $y = x$.
  - Multiplication by any $2 times 2$ matrix, e.g. the formula
    $ T(vec(x,y)) = vec(x+2y,3x+4y) $
    is a linear transformation too.
]
#tip[
  Note that $T(bf(0)) = bf(0)$ in any linear transformation.
]

The important principle to understand is that if you know the values of a transformation $T$
at enough points, you can recover the rest.

Here's an easy example to start:

#ques[
  If $T : RR^2 -> RR^2$ is a linear transform and it's given that
  $ T( vec(3,4) ) = vec(pi, 9) " and " T( vec(100, 100) ) = vec(0, 12) $
  what are the vectors for $T( vec(103,104) )$ and $T( vec(203, 204) )$?
] <pop1>
#soln[
  $
  T( vec(103,104) ) = vec(pi, 9) + vec(0, 12) = vec(pi, 21) \
  T( vec(203,204) ) = vec(pi, 9) + 2 vec(0, 12) = vec(pi, 33). #qedhere
  $
]

Here's another example.
#ques[
  If $T : RR^2 -> RR^2$ is a linear transform and it's given that
  $ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4) $
  what is $T( vec(50, 70) )$?
] <pop2>
#soln[
  $ T( vec(50, 70) ) = 50 vec(1,3) + 70 vec(2,4) = vec(190, 430). #qedhere $
]

More generally, the second question shows that if you know
$T( vec(1,0) )$ and $T( vec(0,1) )$
you ought to be able to _calculate_ the output of $T$ at any other vector like $vec(50,70)$.
To expand on this:
#eqn[
  $ T( vec(a,b) ) = a T( vec(1,0) ) + b T( vec(0,1) ). $
  <t-apply>
]

More generally, from understanding the solution to the above two questions,
you should understand the following important statement that we'll use over and over.

#memo[
  Let $T : RR^n -> RR^m$ be a linear transformation.
  If you know the outputs $T$ on a basis,
  then you can deduce the value of $T$ at any other input.
]

For now "basis" refers to just the $n$ vectors $bf(e)_1$, ..., $bf(e)_n$.
But later on we will generalize this notion to some other settings too.

== [RECIPE] Matrix encoding

A _matrix_ is a way of _encoding_ the _outputs_ of $T$ using as few numbers as possible.
That is:

#definition[
  A matrix *encodes all outputs* of a linear transformation $T$
  by *writing the outputs* of $T(bf(e)_1)$, ..., $T(bf(e)_n)$ as a list of *column vectors*.
]

For example, if you had $T : RR^2 -> RR^2$ with
$ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4)
  <==> T " encoded as " mat(1,2;3,4). $

To put this into recipe form:
#definition(title: [Definition for encoding a transformation])[
  Given a transformation $T : RR^n -> RR^m$, to encode it as a matrix:

  1. Compute $T(bf(e)_1)$ through $T(bf(e)_n)$ and write them as column vectors..
  2. Glue them together to get an $n times m$ array of numbers.
]

Here's more examples.

#sample[
  Let $T : RR^2 -> RR^2$ be projection onto the $x$-axis.
  Write $T$ as a $2 times 2$ matrix.
]
#soln[
  Note that
  $ T(vec(1,0)) = vec(1,0) #h(2em) T(vec(0,1)) = vec(0,0). $
  Glue these together and output $T$ as the matrix $ T = mat(1,0;0,0). #qedhere $
]
#remark[
  You might note that indeed multiplication by the encoded matrix
  $ mat(1,0;0,0) vec(x,y) = vec(x,0). $
  matches what you expect: $vec(x,0)$ is indeed the projection of $vec(x,y)$ onto the $x$-axis!
  And this works for every linear transformation.
  This is so important I'll say it again next section, just mentioning it here first.
]

#sample[
  Let $T : RR^2 -> RR^2$ be reflection around the line $y = x$.
  Write $T$ as a $2 times 2$ matrix.
]
#soln[
  Note that
  $ T(vec(1,0)) = vec(0,1) #h(2em) T(vec(0,1)) = vec(1,0). $
  Glue these together and output $T$ as the matrix $ T = mat(0,1;1,0). #qedhere $
]

#sample[
  Let $T : RR^2 -> RR^2$ be counterclockwise rotation around the origin by $30 degree$.
  Write $T$ as a $2 times 2$ matrix.
]
#soln[
  See @fig-rotate-30.
  By looking at the unit circle, we see that
  $ T(bf(e_1)) = vec(cos 30 degree, sin 30 degree) = (sqrt(3)/2, 1/2). $
  The vector $bf(e)_2$ is $90 degree$ further along
  $ T(bf(e_2)) = vec(cos 120 degree, sin 120 degree) = (-1/2, sqrt(3)/2). $
  Glue these together and output $T$ as the matrix
  $ T = mat(sqrt(3)/2, -1/2; 1/2, sqrt(3)/2). #qedhere $
]
#figure(
  image("figures/matrix-rot.png", width: auto),
  caption: [Rotation by $30$ degrees.],
) <fig-rotate-30>

#remark(title: [Remark: This is where the rotation matrix comes from])[
  If you redo this question with $30 degree$ replaced by any angle $theta$, you get the answer
  $ T = mat(cos(theta), cos(theta+90 degree); sin(theta), sin(theta+90 degree)). $
  So this is the matrix that corresponds to rotation.
  However, in the literature you will often see this rewritten as
  $ T = mat(cos(theta), -sin(theta); sin(theta), cos(theta)) $
  to get rid of the $+90 degree$ offsets.
  That's fine, but I think it kind of hides where the formula for rotation matrix comes from, personally.
]

Another example is the identity function:
#example(title: [Example: The identity matrix deserves its name])[
  Let $I : RR^3 -> RR^3$ denote the 3D identity function, meaning $I(bf(v)) = bf(v)$.
  To encode it, we look at its values at $bf(e)_1$, $bf(e)_2$, $bf(e)_3$:
  $
    I(bf(e)_1) = bf(e)_1 = vec(1,0,0),
    #h(1em)
    I(bf(e)_2) = bf(e)_2 = vec(0,1,0),
    #h(1em)
    I(bf(e)_3) = bf(e)_3 = vec(0,0,1).
  $
  We encode it as a matrix by writing the columns side by side, getting what you expect:
  $ I " encoded as " mat(1,0,0;0,1,0;0,0,1). $
  This gives a more natural reason why the identity matrix
  is the one with $1$'s on the diagonal and $0$'s elsewhere
  (compared to the "well try multiplying by it" you learned in high school).
]

== [TEXT] Matrix multiplication <matrix-mult>

In the prerequisites, I said that you were supposed to know the rule for
multiplying matrices, so you should already know for example that
$ mat(5,6;7,8) mat(1,2;3,4) = mat(23, 34; 31, 46). $

The goal of this section is to now explain why matrix multiplication
is defined in this funny way.
We will see two results:

- Multiplication of the matrix for $T$ by a column vector $bf(v)$
  corresponds to evaluation $T(bf(v))$.
- Multiplication of the matrices for $S$ and $T$
  gives the matrix for the composed function $S compose T$.#footnote[
  The $compose$ symbol means the function where you apply $T$ first then $S$ first.
  So for example, if $f(x) = x^2$ and $g(x) = x+5$, then
  $(f compose g)(x) = f(g(x)) = (x+5)^2$.
  We mostly use that circle symbol if we want to refer to $f compose g$ itself without the $x$,
  since it would look really bad if you wrote "$f(g$" or something.
]

=== One matrix

Recall from @pop2 that if $T$ was the linear transformation for which
$ T(bf(e)_1) = vec(1,3) " and " T(bf(e)_2) = vec(2,4) $
then $ T( vec(50,70) ) = vec(190, 430). $
We just now also saw that to encode $T$ as a matrix, we have
$ T = mat(1,2;3,4). $

Now, what do you think happens if you compute
$ mat(1,2;3,4) vec(50,70) $
as you were taught in high school?
Surprise: you get
$ mat(1,2;3,4) vec(50,70) = vec(1 dot 50 + 2 dot 70, 3 dot 50 + 4 dot 70) = vec(190, 340)$
which is not just the same answer, but also the same intermediate calculations.
In other words,
#idea[
  If one multiplies a matrix $M$ by a column vector $bf(v)$,
  this corresponds to applying the linear transformation $T$ encoded by $M$ to $bf(v)$.
]

=== Two matrices

Now, any time we have functions in math, we can _compose_ them.
So let's play the same game with a pair of functions $S$ and $T$,
and think about their composition $S compose T$.
Imagine we got asked the following question:

#ques[
  Let $T : RR^2 -> RR^2$ be a linear transform such that
  $ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4). $
  Then let $S : RR^2 -> RR^2$ be the linear transform such that
  $ S( vec(1,0) ) = vec(5, 7) " and " S( vec(0,1) ) = vec(6, 8). $
  Evaluate $S(T(vec(1, 0)))$ and $S(T(vec(0, 1)))$.
] <pop3>
#soln[
  $
  S(T(vec(1, 0))) = S(vec(1, 3)) = 1 vec(5,7) + 3 vec(6, 8) = vec(23, 31) \
  S(T(vec(0, 1))) = S(vec(2, 4)) = 2 vec(5,7) + 4 vec(6, 8) = vec(34, 46). #qedhere
  $
]

Now, $S compose T$ is _itself_ a function, so it makes sense to encode $S compose T$ as a matrix
too, using the answer to @pop3:
$
  S(T(vec(1, 0))) = vec(23, 31) " and "
  S(T(vec(0, 1))) = vec(34, 46)
  <==>
  S compose T " encoded as " mat(23, 34; 31, 46).
$

The matrix multiplication rule is then rigged to give the same answer
through the same calculation again:
$
  mat(5,6;7,8) mat(1,2;3,4) = mat(23, 34; 31, 46).
$

In other words:
#idea[
  If one multiplies two matrices $M$ and $N$,
  this corresponds to composing the linear transformations that $M$ and $N$ encode.
]

This shows why the 18.700/18.701 definitions are better than the 18.02 ones.
In 18.02, the recipe for matrix multiplication is a _definition_:
"here is this contrived rule about taking products of columns and rows, trust me bro".
But in 18.700/18.701, the matrix multiplication recipe is a _theorem_;
it's what happens if you generalize @pop3 to eight variables
(or $n^2+n^2 = 2n^2$ variables for $n times n$ matrices).

#digression[
  As an aside, this should explain why matrix multiplication is associative but not commutative:

  - Because #link("https://w.wiki/BAHh")[function composition is associative],
    so is matrix multiplication.
  - Because function composition is _not_ commutative in general,
    matrix multiplication isn't either.
]


== [EXER] Exercises

#exer[
  If $A$ is a $3 times 3$ matrix with determinant $2$, what values could $det(10 A)$ take?
]
