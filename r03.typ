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


= Some abstraction on linear maps

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
I would rather define it as in the first bullet above;
then say the matrix is a way to succinctly _encode_ or _identify_ the transformation.
(Think how that every human has a name that identifies them.)

If that made sense, you can explain the following two sentences
(corr to last page of Maulik's L3 notes):

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
