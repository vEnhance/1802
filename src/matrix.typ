#import "@local/evan:1.0.0":*

= Linear transformations and matrices

This section will be presented a bit differently than you'll see in many other places;
I talk about linear transformations first,
and then talk about matrices as an encoding of linear transformations.
I feel quite strongly this way is better, but if you are in an actual course,
there presentation is likely to be different (and worse).

== Linear transformation

#definition[
  A _linear transform_ $T : RR^n -> RR^m$ is _any_ map obeying $T(c bf(v)) = c T(bf(v))$
  and $T(bf(v) + bf(w)) = T(bf(v)) + T(bf(w))$.
]
It's a chonky boy: for every $bf(v) in RR^n$, there's an output value $T(bf(v)) in RR^m$.

#todo[examples]

The important principle to understand is that if you know the values of a transformation $T$
at enough points, you can recover the rest.
Here's an easy example to start:

#problem[
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
#problem[
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

More generally, if $T : RR^n -> RR^m$,
then telling you the output of $T(bf(e)_1)$, ..., $T(bf(e)_n)$
is the smallest amount of information I can give you that lets you reconstruct any other output.

== Matrix encoding

A _matrix_ is a way of _encoding_ the _outputs_ of $T$ using as few numbers as possible:

#definition[
  A matrix *encodes all outputs* of a linear transformation $T$
  by *writing the outputs* of $T(bf(e)_1)$, ..., $T(bf(e)_n)$ as a list of *column vectors*.
]

Now, I told you a linear transformation $T$ can be _encoded_ as a matrix.
This is really easy: glue the outputs of $T$ at the basis vectors and format it as an array:
$ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4)
  <==> T " encoded as " mat(1,2;3,4) $

#todo[Write the other examples]

#remark[The identity matrix deserves its name][
  This also gives a "better" reason why the identity matrix is the one
  with $1$'s on the diagonal than the "well try multiplying by it".

  Let $I : RR^3 -> RR^3$ denote the 3d identity function.
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
]


== Matrix multiplication

In the prerequisites, I said that you were supposed to know the rule for
multiplying matrices, so you should already know for example that
$ mat(5,6;7,8) mat(1,2;3,4) = mat(23, 34; 31, 46). $

The goal of this section is to now explain why matrix multiplication is defined in this funny way.
We will see two results:

- Multiplication of the matrix for $T$ by a column vector $bf(v)$
  corresponds to evaluation $T(bf(v))$.
- Multiplication of the matrices for $S$ and $T$
  gives the matrix for the composed function $S compose T$.

=== One matrix

The matrix multiplication rule is then rigged to correspond to evaluation:
$ T( vec(50,70) ) = vec(190, 430) <==> mat(1,2;3,4) vec(50,70) = vec(190, 430). $
And indeed, you can now verify that if you calculate $mat(1,2;3,4) vec(50,70)$
as you were told to do in high school,
you get the same answer (and do the same calculations) as we did for @pop2.
(In recitation, I actually circled where $1 dot 50$ and $2 dot 70$ showed up
in the solution to @pop2 on the board.)

=== Two matrices

Any time we have functions in math, we can _compose_ them.#footnote[
  The $compose$ symbol means the function where you apply $T$ first then $S$ first.
  So for example, if $f(x) = x^2$ and $g(x) = x+5$, then
  $(f compose g)(x) = f(g(x)) = (x+5)^2$.
  We mostly use that circle symbol if we want to refer to $f compose g$ itself without the $x$,
  since it would look really bad if you wrote "$f(g$" or something.
]
So let's play the same game with a pair of functions $S$ and $T$,
and think about their composition $S compose T$.

#problem[
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

This shows why the 18.700/18.701 definitions are better than the 18.02 ones.
In 18.02, the recipe for matrix multiplication is a _definition_:
"here is this contrived rule about taking products of columns and rows, trust me bro".
But in 18.700/18.701, the matrix multiplication recipe is a _theorem_;
it's what happens if you generalize @pop3 to eight variables
(or $n^2+n^2 = 2n^2$ variables for $n times n$ matrices).

As an aside, this should explain why matrix multiplication is associative but not commutative:
- Because #link("https://w.wiki/BAHh")[function composition is associative],
  so is matrix multiplication.
- Because function composition is _not_ commutative in general,
  matrix multiplication isn't either.

== Determinants
