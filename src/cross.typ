#import "@local/evan:1.0.0":*

= The cross product

The cross product is the last major linear algebra tool we'll need to introduce
(together with determinants and the dot product).
Like the dot product, the cross product also has two definitions, one algebraic and one geometric.

== [TEXT] The two definitions of the cross product

This definition is terrible, so bear with me.
See the extended digression in @sec-cross-sucks for more on that.

#definition[
  Suppose $bf(v) = vec(a_1, a_2, a_3)$ and $bf(w) = vec(b_1, b_2, b_3)$ are two vectors in $RR^n$.

  The _algebraic definition_ of the cross product is:
  $ bf(v) times bf(w) := det mat(a_2, a_3; b_2, b_3) bf(e)_1
    - det mat(a_1, a_3; b_1, b_3) bf(e)_2 + det mat(a_1, a_2; b_1, b_2) bf(e)_3
    = vec(a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1). $

  The _geometric definition_ of the cross product is based on
  specifying both the direction and magnitude.
  - The *magnitude* of $bf(v) times bf(w)$ is equal to the area of the parallelepiped
    formed by $bf(v)$ and $bf(w)$.
    In trigonometry turns, if $theta$ is the included angle,
    this equals $|bf(v)| |bf(w)| sin theta$.
  - The *direction* is given by requiring $bf(v) times bf(w)$ to be perpendicular
    to _both_ $bf(v)$ and $bf(w)$, and also satisfying the *right-hand rule*.
]
#typesig[
  The cross product *only* accepts two vectors *both of length $3$*.
  And it outputs a single *vector of length $3$*.
]

#tip(title: [How to remember the algebraic cross product definition])[
  The algebraic definition is usually remembered using the following mnemonic:
  $ bf(v) times bf(w) =
    det mat(
      bf(e)_1, bf(e)_2, bf(e)_3;
      a_1, a_2, a_3;
      b_1, b_2, b_3
    ). $
  Mathematically speaking, the right-hand side doesn't make sense and is a type-error,
  because one can't have a matrix where some things in it are numbers
  and other things in it are vectors.
  However, if you ignore that and multiply anyway, you'll get the algebraic definition above.
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
