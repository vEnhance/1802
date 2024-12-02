#import "@local/evan:1.0.0":*

= The cross product <sec-cross>

The cross product is the last major linear algebra tool we'll need to introduce
(together with determinants and the dot product).
Like the dot product, the cross product also has two definitions,
one algebraic and one geometric.

However, unlike the dot product, the cross product is really stilted and unnatural,
and not used as much --- in fact they won't show up again to @sec-scalar-field-ints.
(More on that in @sec-cross-sucks.)
I'll try to keep this section brief.

== [TEXT] The two definitions of the cross product

This definition is terrible, so bear with me.

#definition[
  Suppose $bf(v) = vec(a_1, a_2, a_3)$ and $bf(w) = vec(b_1, b_2, b_3)$ are two vectors in $RR^n$.

  The _algebraic definition_ of the cross product is:
  #eqn[
    $ bf(v) times bf(w) := det mat(a_2, a_3; b_2, b_3) bf(e)_1
      - det mat(a_1, a_3; b_1, b_3) bf(e)_2 + det mat(a_1, a_2; b_1, b_2) bf(e)_3
      = vec(a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1). $
    <eqn-cross-raw-alg>
  ]

  (See the tip below for a way to remember this formula more easily.)

  The _geometric definition_ of the cross product is based on
  specifying both the direction and magnitude.
  - The *magnitude* of $bf(v) times bf(w)$ is equal to the area of the parallelepiped
    formed by $bf(v)$ and $bf(w)$.
    In trigonometry turns, if $theta$ is the included angle,
    this equals $|bf(v)| |bf(w)| sin theta$.
  - The *direction* is given by requiring $bf(v) times bf(w)$ to be perpendicular
    to _both_ $bf(v)$ and $bf(w)$, and also satisfying the *right-hand rule*.
]

Like with the dot product, it's not obvious at all why these definitions are compatible!
@eqn-cross-raw-alg is probably also really mysterious and seems to come from nowhere.
In this case, I think the idea is that you should start with the geometric definition,
then grind through some calculation to get a system of equations.
If you solve the system of equations, you wind up with @eqn-cross-raw-alg as the result.
If you want to see this derivation done in full, check @appendix-crosspf.

#typesig[
  The cross product *only* accepts two vectors *both of length $3$*.
  And it outputs a single *vector of length $3$*.
]

#remark(title: [Remark: The right-hand rule])[
  The hack with the right-hand rule is necessary
  because if I tell you only the length of a vector in $RR^3$
  and that it is normal to two other vectors in $RR^3$,
  there are actually two vectors.
  (For example, there are two vectors of length $5$ perpendicular to $bf(e)_1$ and $bf(e)_2$:
  namely $pm 5 bf(e)_3$.)

  So we need to pick one, and the right-hand rule
  says that if you point your right index finger along $bf(v)$
  and right middle finger along $bf(w)$ closer to your palm,
  and stick out your right thumb, then $bf(v) times bf(w)$ points along your thumb.

  Another way to describe the right-hand rule is to require the following table to be true:
  $ bf(e)_1 times bf(e)_2 &= bf(e)_3 = -bf(e)_2 times bf(e)_1 \
    bf(e)_2 times bf(e)_3 &= bf(e)_3 = -bf(e)_3 times bf(e)_2 \
    bf(e)_3 times bf(e)_1 &= bf(e)_3 = -bf(e)_1 times bf(e)_3. $
]

It may not be that easy to remember @eqn-cross-raw-alg.
In practice, I think almost everyone uses the following mnemonic for it.

#tip(title: [Tip: How to remember the algebraic cross product definition])[
  The algebraic definition is usually remembered using the following mnemonic:
  #eqn[
    $ bf(v) times bf(w) =
      det mat(
        bf(e)_1, bf(e)_2, bf(e)_3;
        a_1, a_2, a_3;
        b_1, b_2, b_3
      ). $
    <eqn-cross-det>
  ]
  Mathematically speaking, the right-hand side doesn't make sense and is a type-error,
  because one can't have a matrix where some things in it are numbers
  and other things in it are vectors.
  However, if you ignore that and multiply anyway, you'll get the algebraic definition above.

  In these notes *I will always use @eqn-cross-det rather than @eqn-cross-raw-alg*
  because that's what people actually do in practice.
  (I do so quite grudgingly, because @eqn-cross-det is officially a type-error,
  and in theory it is nonsense.
  But in the words of Linus Torvalds:
  "Theory and practice sometimes clash. And when that happens, theory loses. Every single time.")
]

#warning(title: [Warning: Cross product is anti-commutative])[
  From either definition, you should be able to see that
  $ bf(v) times bf(w) = - bf(w) times bf(v) $
  in contrast to the dot product.
  Note the minus sign.
  (The right hand rule means that you can't swap your index and middle finger.)

  Also, note that $bf(v) times bf(v) = 0$
  (or indeed $bf(v) times bf(w) = 0$ whenever $bf(v)$ and $bf(w)$ are parallel).
]

I really want to get this section over with so I'll just give you one example with numbers
and not even talk about the corresponding geometry.

#sample[
  Compute the cross product of $bf(v) = vec(1,2,3)$ and $bf(w) = vec(4,5,6)$.
]
#soln[
  Write
  $ bf(v) times bf(w) := det mat(2, 3; 5, 6) bf(e)_1
    - det mat(1, 3; 4, 6) bf(e)_2 + det mat(1, 2; 4, 5) bf(e)_3
    = -3 bf(e)_1 + 6bf(e)_2 - 3bf(e)_3 = vec(-3,6,3). #qedhere $
]
As a sanity check you can verify that, indeed,
this vector is perpendicular to both $bf(v)$ and $bf(w)$ using the dot product
$ vec(-3,6,3) dot vec(1,2,3) &= (-3)(1) + (6)(2) + (3)(3) = 0 \
  vec(-3,6,3) dot vec(4,5,6) &= (-3)(4) + (6)(5) + (3)(6) = 0. $
(Indeed, our proof in the appendix (@appendix-crosspf) shows the cross product is
really designed so that this dot product is $0$.)

== [RECIPE] What to use the cross product for

Unlike the dot product, which is just a number, the cross product is a vector.
So it has more information in it --- both a direction and a magnitude.

- The direction of $bf(v) times bf(w)$ is perpendicular to both $bf(v)$ and $bf(w)$.
- The magnitude is the area of the parallelogram.

However in practice, when we use the cross product,
we'll often _only use one piece of information_.

Hence the following two recipes below.

#recipe(title: [Recipe for normal vectors])[
  To find a vector perpendicular to both $bf(v)$ and $bf(w)$ at once:

  1. Output any nonzero multiple of $bf(v) times bf(w)$.
]

#recipe(title: [Recipe for area])[
  To find the area of the parallelogram formed by $bf(v)$ and $bf(w)$ in $RR^3$:

  1. Output the magnitude of $bf(v) times bf(w)$.
]

Notice in the first recipe, we ignore the magnitude;
in the second recipe, we ignore the direction.

#sample[
  Consider the three points $A = (1,0,0)$, $B = (0,2,0)$, $C = (0,0,3)$.

  - Find a normal vector to the plane through $A$, $B$, $C$.
  - Find the equation of the plane.
  - Compute the area of triangle $A B C$.
]
#soln[
  First, let's find a normal vector to the plane through $A$, $B$, and $C$.
  The idea is to compute two vectors $arrow(A B)$ and $arrow(A C)$:
  $ arrow(A B) &= vec(0 - 1 , 2 - 0 , 0 - 0) = vec(- 1 , 2 , 0) \
    arrow(A C) &= vec(0 - 1 , 0 - 0 , 3 - 0) = vec(- 1 , 0 , 3) . $
  These two vectors can be drawn as arrows contained in the plane through them.
  So if we compute the cross product, we'll get a normal vector we wanted!
  That is,
  $ arrow(A B) times arrow(A C)
    &= (2 dot 3 - 0 dot 0) bf(e)_1  - (- 1 dot 3 - 0 dot - 1) bf(e)_2
      + (- 1 dot 0 - 2 dot - 1) bf(e)_3 \
    &= (6 - 0) bf(e)_1 - (- 3 - 0) bf(e)_2 + (0 - (- 2)) bf(e)_3 = vec(6,3,2). $

  That's the normal vector. To find the equation of the plane, we know that we should have
  $ 6 x + 3 y + 2 z = d $
  for some constant $d$.
  Plugging in any of the three points $A$, $B$, $C$ gives $d = 6$
  (the redundancy here gives us a way to check our arithmetic, too).
  So the plane is $ 6 x + 3 y + 2 z = 6. $

  Finally, the area of $triangle.stroked.t A B C$ is half the area of the parallelogram formed by
  $arrow(A B)$ and $arrow(A C)$, so that
  $ op("Area")(triangle.stroked.t A B C)
    = 1 / 2 lr(|arrow(A B) times arrow(A C)|)
    = 1 / 2 sqrt(6^2 + 3^2 + 2^2) = 7 / 2. #qedhere $
]

#remark[
  This shape of question is worth remembering:
  the cross product often gives you a way to find a normal vector to some plane,
  because it's so good at making right angles.
  Then once you have the normal vector, you can find the equation of the plane
  using the recipe from @recipe-plane-known-dir.
]


== [SIDENOTE] The cross product sucks <sec-cross-sucks>

Compared to dot products and determinants,
the cross product might feel the most unnatural, for good reason ---
it's used much less frequently by serious mathematicians than the other tools you see.

#figure(
  image("media/cross-products.jpg", width: 80%),
  caption: [How to think of cross products.],
)

The reason that the cross product isn't popular with mathematicians is
the definition of the cross product is *really quite brittle*.
For example, the cross product can't be defined for any number of dimensions,#footnote[Just kidding,
  apparently there's a
  #link("https://w.wiki/BVNL")[seven dimensional cross product]?
  Today I learned.
  Except that there are apparently $480$ different ways to define it in seven dimensions,
  so, like, probably not a great thing.]
and you have to remember this weird right-hand rule that adds one more arbitrary convention.
So the definition is pretty unsatisfying.

To replace the cross product, mathematicians use a different
kind of object called a _bivector_, an element of a space called $and.big^2 (RR^n)$.
(They might even claim that bivectors do everything cross products can do, but better.)
Again, this new kind of object is well beyond the scope of 18.02
but it's documented in Chapter 12 of my #link("https://web.evanchen.cc/napkin.html")[Napkin]
if you do want to see it.

I'll give you a bit of a teaser though.
In general, for any $n$, bivectors in $RR^n$ are specified by $(n(n-1))/2$ coordinates.
So for $n=3$ you _could_ translate every bivector in $RR^3$ into a vector in $RR^3$
by just reading the coordinates (although you end up with the right-hand rule
as an artifact of the translation), and the cross product is exactly what you get.
But for $n=4$, a bivector in $RR^4$ has six numbers,
which is too much information to store in a vector in $RR^4$.
Similarly, for $n > 4$, this translation can't be done.
That's why the cross product is so brittle and can't work past $RR^3$.

== [RECAP] Recap of vector stuff up to here

A brief summary of the last few chapters.

- The dot and cross products have algebraic formulas and geometric properties
  that make them useful in a lot of 3D geometry applications.

- The dot product lets you detect perpendicularity and projections.
  - Two vectors are perpendicular if and only if their dot product is zero.

- The cross products generates perpendicularities and lets you compute area.

- Both are used in the theory of planes:
  - We use the dot product to show that the normal vector
    to the plane $a x + b y + c z = d$ was the vector $vec(a,b,c)$.
  - We use the projection from the dot product to find the distance from a point to a plane.
  - Given three points on a plane, the cross product let us find the normal vector.

See also @table-vector-objects, which summarizes some of the vectors
we've seen in applications.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Vector], [Direction], [Magnitude]),
    [Normal vector $bf(n)$ to plane], [Perpendicular to plane], [_Irrelevant!_],
    [$op("proj")_(bf(w))(bf(v))$], [Same as $bf(w)$], [Scalar projection],
    [Cross product $bf(v) times bf(w)$], [Perpendicular to both $bf(a)$ and $bf(b)$], [Area of parallelogram]
  ),
  caption: [Some commonly used kinds of vectors we've met so far.],
  kind: table
) <table-vector-objects>

== [EXER] Exercises

#exer[
  Let $bf(v)$ and $bf(w)$ be vectors in $RR^3$
  for which $bf(v) times bf(w) = vec(1,2,3)$.
  Compute $5bf(w) times 4bf(v)$.
]

#exer[
  Let $bf(v)$ and $bf(w)$ be unit vectors in $RR^3$.
  Find all possible values of
  $ |bf(v) times bf(w)|^2 + (bf(v) dot bf(w))^2. $
]

#exerstar[
  Suppose $bf(v)$ is a vector in $RR^3$ such that
  $ vec(1,2,3) times bf(v) = vec(4,5,k). $
  Compute $k$.
]
