#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 3],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [11 September 2024],
)

#quote(attribution: [Monokuma in _Danganropa_])[
  Every human has regrets, has things they'd like to go back and change.
  But I don't! 'Cause I'm a bear!
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").


= Housekeeping

- *Office hours both Monday and Wednesday 10am*; rooms posted on Evan's site.
- *You can now check recitation answers on Evan's site.*
  After the disaster that was the end of R02,
  I have pre-uploaded a quick answer key to R03 this time.#footnote[This time I just used ChatGPT.
    For future recitations, I might just type answers only,
    continue using ChatGPT more, or something else; undecided.
    Anyway, ChatGPT can make mistakes, so if you think something's wrong, flag me.]
  So, now you can check your answer on your phone/tablet/laptop/etc.
  But still feel free to check answers with me the old fashioned-way too.
  (Figured it's better to give people more options.)

I'll try to also yap less today and give you time to actually talk to people more 1:1
as I move around, since that seemed more useful.
(Though Wed recitation is nicer than Mon, half as much stuff to cover.)

= Follow-ups from R02

- Errata from R02:
  Last week in R02 I mistakenly claimed that $arrow(A B) times arrow(A C)$
  is the area of the triangle $A B C$,
  but it's actually the parallelogram's area.
  Divide by $2$ to get the area of the triangle instead.

- Maulik says any drawing of $x$, $y$, $z$ axes satisfying right-hand rule is OK.
  I'll follow Maulik.

- Remember that every vector has both a *direction* and a *magnitude*,
  which both have geometric meaning (or insignificance); see table below.

#align(center)[
  #table(
    columns: 3,
    table.header([*Object*], [*Direction*], [*Magnitude*]),
    [Normal vector to plane], [Perpendicular to plane], [_Irrelevant!_],
    [Vector projection of $bf(v)$ to $bf(w)$], [Same as $bf(w)$], [Scalar projection],
    [Cross product $bf(a) times bf(b)$], [Perpendicular to both $bf(a)$ and $bf(b)$], [Area of parallelogram]
  )
]

- Remember: *the $RR^2$ concept of slope is overriden by the concept of normal vector for $RR^3$*.
  This is an important lesson from last time that I didn't call enough attention to,
  so I want to re-emphasize it.
  Anything you used to rely on slopes for, you should try to retrain yourself
  to think of in terms of normal vector.
  (I'll say this yet again when $nabla f(x,y)$ is introduced.)


= Some abstraction on linear maps <lintransf>

Matrices are super confusing because they're actually the "wrong" way to think about things.
Again, take 18.700 or 18.701 or
#link("https://web.evanchen.cc/napkin.html")[read my Napkin book], or come to office hours.
For now, a summary:

- A _linear transform_ $T : RR^n -> RR^m$ is _any_ map obeying $T(c bf(v)) = c T(bf(v))$
  and $T(v + w) = T(v) + T(w)$.
  It's a chonky boy: for every $v in RR^n$, there's an output value $T(v) in RR^m$.
- A _matrix_ is a way of _encoding_ the _outputs_ of $T$ using as few numbers as possible.
- Pop quiz: if $T : RR^2 -> RR^2$ is a linear transform and
  it's given that
  $ T( vec(3,4) ) = vec(pi, 9) " and " T( vec(100, 100) ) = vec(0, 12) $
  what are the vectors for $T( vec(103,104) )$ and $T( vec(203, 204) )$?
- More generally, if you know the outputs $T( vec(1,0) )$ and $T( vec(0,1) )$, then
  that gives you enough information to figure out all other outputs of $T$, because
  #eqn[
    $ T( vec(a,b) ) = a T( vec(1,0) ) + b T( vec(0,1) ). $
    <t-apply>
  ]

So the really, really important principle to understand is:

#proposition[
  A matrix *encodes all outputs* of a linear transformation $T$
  by *writing the outputs* of $T(bf(e)_1)$, ..., $T(bf(e)_n)$ as a list of *column vectors*.
]

There's a philosophical axe I'm grinding.
In 18.02, a linear transform is defined as "act by a matrix".
I've never liked this definition for ten years.
I would rather define it as in the first bullet above (as in 18.701);
then say the matrix is a way to succinctly _encode_ or _identify_ the transformation.
(Think how that every human has a name that identifies them.)

If that made sense, you can explain the following two sentences
(the last page of Maulik's L3 notes):

- Multiplication of matrix by vector is defined so that
  $M bf(v) = T(bf(v))$. (This is @t-apply.)
- Multiplication of two matrices defined so that $A B$ corresponds to _function composition_.

= Recitation problems

/ 1: Consider the $2 times 2$ matrices $A = mat(2, 1; 1, 2)$ and $B = mat(- 3, 1; 2, 0)$.
/ 1a: Calculate $A B$ and $B A$.
/ 1b: Calculate the matrix $A^(- 1)$.
/ 1c: Check directly that $A A^(- 1) = A^(- 1) A = I$.
/ 1d: Consider the linear system of equations: $2 x + y = 7$ and $x + 2 y = 11$.
  Write this system of equations as a single matrix equation and solve it
  using $A^(- 1)$ from the previous question.
  Check that your solution satisfies the original equations.
/ 2a: Viewed as a linear transformation, how does the matrix
  $mat(2, 3; 0, 1)$ transform the unit square with vertices
  $(0 , 0)$, $(0 , 1)$, $(1 , 0)$, $(1 , 1)$?
/ 2b: What is the $2 times 2$ matrix $A$ associated with reflection across the line $y = - x$?
/ 2c: Find the $3 times 3$ matrix corresponding to the linear transformation
  $f$: $vec(x, y, z) arrow.r.bar vec(3 x - 2 z, x + y + z, 4 y + z)$.
/ 2d: Consider the linear transformation $f : bb(R)^2 arrow.r bb(R)^2$ where
  $f (bf(v))$ is the vector projection of $bf(v)$ in the direction
  $bf(w) = vec(1, 2)$. What is the $2 times 2$ matrix $A$ associated with
  this linear transformation?

= Post-recitation notes

If you #strike[overslept] couldn't make it to recitation,
here's an elaboration of @lintransf as I presented it today.

== One matrix

Here's the answer to the pop quiz in @lintransf (I'll restate the question first):
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
  /* (If you're using the 18.02 definition of linear transform,
  then the above equations hold because matrix multiplication is distributive over addition.
  Whereas in 18.700/18.70, the equations hold _by definition_.) */
]

Now more generally, here's the example with the made-up numbers
(I forget which random numbers the audience gave me for the actual recitation, sorry).
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
More generally, if $T : RR^n -> RR^m$,
then telling you the output of $T(bf(e)_1)$, ..., $T(bf(e)_n)$
is the smallest amount of information I can give you that lets you reconstruct the other values.

Now, I told you a linear transformation $T$ can be _encoded_ as a matrix.
The way you do this is to write the outputs of $T$ at the basis vectors and make an array:
$ T( vec(1,0) ) = vec(1, 3) " and " T( vec(0,1) ) = vec(2, 4)
  <==> T " encoded as " mat(1,2;3,4) $

The matrix multiplication rule is then rigged to correspond to evaluation:
$ T( vec(50,70) ) = vec(19, 43) <==> mat(1,2;3,4) vec(50,70) = vec(19, 43). $
And indeed, you can now verify that if you calculate $mat(1,2;3,4) vec(50,70)$
as you were told to do in high school,
you get the same answer (and do the same calculations)
as we did for @pop2.
(In recitation, I actually circled where $1 dot 50$ and $3 dot 70$ showed up
in the solution to @pop2 on the board.)

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

== Two matrices

Any time we have functions in math, we can _compose_ them.#footnote[
  The $compose$ symbol means the function where you apply $T$ first then $S$ first.
  So for example, if $f(x) = x^2$ and $g(x) = x+5$, then
  $(f compose g)(x) = f(g(x)) = (x+5)^2$.
  We mostly use that circle symbol if we want to refer to $f compose g$ itself without the $x$,
  since you can't just write or something.
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

This is shows why the 18.700/18.701 definitions are better than the 18.02 ones.
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

== Remark on recitation question 2

I want to point out that 2b/2c/2d are all doing the same thing:
they take the general shape

#quote[
  Here is a particular linear transformation described in words;
  please encode it as a matrix.
]

And you do all three problems by calculating the value of the transformation
at $bf(e)_i$, and then encoding it by just gluing them together.
Conceptually, you can fit those into the following table.
It's important to realize *all the work of the problem is the "values at basis"*;
and that *only uses up to R02 material*.
The only new step introduced in R03 is "to encode as matrix, glue your answers together".

#align(center)[

  #table(
    columns: 4,
    table.header([*Q*], [*Transf.*], [*Values at basis*], [*Encoded matrix*]),
    [2b],
      [$T = $ "Reflect around $y=-x$"],
      [$ T(bf(e)_1) = vec(0,-1) \ T(bf(e)_2) = vec(-1,0) $],
      [$mat(0,-1;-1,0)$],
    [2c],
      [$T = $ "ugly 3d equation above"],
      [$ T(bf(e)_1) = vec(3,1,0) \ T(bf(e)_2) = vec(0,1,4) \ T(bf(e)_3) = vec(-2,1,1) $],
      [$mat(3,0,-2;1,1,1;0,4,1)$],
    [2d],
      [$T = $ "vector projection as in R02"],
      [$ T(bf(e)_1) = vec(1/5,2/5) \ T(bf(e)_2) = vec(2/5,4/5) $],
      [$mat(1/5,2/5;2/5,4/5)$],
  )

]
