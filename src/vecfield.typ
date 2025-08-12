#import "@local/evan:1.0.0":*

= Vector fields

== [TEXT] Vector fields

In Part Golf, we only considered integrals of scalar-valued functions.
However, in Part India and Juliett we will meet a *vector field*,
which is another name for a function that inputs points and outputs vectors.
#definition[
  A *vector field* for $RR^n$ is a function $bf(F) : RR^n -> RR^n$
  that assigns to each point $P in RR^n$ a vector $bf(F)(P) in RR^n$.
]
In contrast, we might use the word *scalar field* for the old kind of functions $f : RR^n -> RR$
that gave a number at each input point rather than a vector.

You actually have met a lot of vector fields before:
#example[
  Every gradient is an example of a vector field!
  That is, if $f : RR^n -> RR$, then $nabla f$ is a vector field for $RR^n$.
]
This case is so important that there's a word for it:
#definition[
  A vector field for $RR^n$ is called *conservative*
  if it happens to equal $nabla f$ for some function $f : RR^n -> RR$.
]
In Part India and Juliett we'll meet vector fields that aren't conservative too.
#typesig[
  For standalone vector fields, we'll always use capital bold letters like $bf(F)$ to denote them.
  That said, remember $nabla f$ is _also_ a vector field.
  So that's why the operator $nabla$ itself is typeset a little bit bold.

  Like the gradient, you should draw inputs to $bf(F)$ as _points_ (dots)
  but the outputs as _vectors_ (arrows). Don't mix them.
]

For 2D and 3D vector fields, we'll often write
$ bf(F) = vec(p(x,y), q(x,y)) quad bf(F) = vec(p(x,y,z), q(x,y,z), r(x,y,z)). $
I think other sources often use $P$, $Q$, $R$ instead,
but right now I'm using those for points too, so I'll use lowercase letters.

== [TEXT] How do we picture a vector field?

There's a lot of ways to picture a vector field, especially in physics.
For consistency, I'm going to pick _one_ such framework and write all my examples in terms of it.
So *in my book, all examples will be aquatic* in nature;
but if you can't swim#footnote[Doesn't MIT make you pass a swim test, though?],
you should feel free to substitute your own.
Imagine an electric field. Or a black hole in outer space.
Or air currents in the atmosphere. Whatever works for you!

Anyway, for my book, we'll use the following picture:
#idea[
  Imagine a flowing body of water (ocean, river, whirlpool, fountain, etc.) in $RR^2$ or $RR^3$.
  Then at any point $P$, we draw a tiny arrow $bf(F)(P)$
  indicating the direction and speed of the water at the point $P$.
  You could imagine if you put a little ball at the point $P$,
  the current would move the ball along that arrow.
]

Sounds a lot like the gradient, right?
Indeed, conservative vector fields are a big family of vector fields,
and so we should expect they fit this picture pretty neatly.
But the thing about conservative vector fields is this: $nabla f$,
as a vector field, is always rushing _towards_ whatever makes the value of $f$ bigger.
Whereas generic vector fields might, for example, go in loops.
Let's put these examples into aquatic terms.

#example(title: [Example of a conservative vector field: going downstream a river])[
  Let's imagine we have a river with a strong current.
  We'll make the important assumption that the river only goes one way:
  that is, if you go along the current, you never end up back where you started.
  In real life, this often occurs if the river goes down a mountain,
  so as you go down the river you're losing elevation.

  If you do this, you can define a "downstream function" $f : RR^3 -> RR$ as follows:
  for every point $P$ in the river, $f(P)$ measures how far downstream you are.
  For example, if the river had a head, maybe we could assign $f$ the value zero there,
  and then $f$ would increase as you get farther from the bank,
  reaching the largest value at the mouth.
  (For mountainous rivers, $f$ might instead be thought of as decreasing in elevation.)

  Then the vector field corresponding to the river is the gradient $nabla f$.
  Remember, the gradient $nabla f$ tells you what direction to move in to increase $f$.
  And if you throw a ball into a river, its motion could be described simply as:
  the ball moves downstream.
]

#figure(
  image("media/waterfall.jpg", width: 50%),
  caption: [A river flowing from the base of a waterfall.
    Black arrows point along the direction of the gradient.],
)

#example(title: [Example of a non-conservative vector field: a whirlpool])[
  Now imagine instead you have a whirlpool.
  If you throw a ball in it, it goes in circles around vertex of the whirlpool.
  This doesn't look anything like the river!
  If you have a river, you never expect a ball to come back to the same point after a while,
  because it's trying to go downstream.
  But with a whirlpool, you keep going in circles over and over.

  If you draw the vector field corresponding to a whirlpool,
  it looks like lots of concentric rings made by tiny arrows.
  That's an example of a non-conservative vector field.
]

#figure(
  image("media/whirlpool.jpg", width: 50%),
  caption: [A whirlpool. Round and round we go. Not a conservative vector field.],
)

== [TEXT] How to draw a vector field

If you're actually given a formula for $bf(F)(x,y)$,
you can sketch the corresponding vector field by the following procedure.

#recipe(title: [Recipe for sketching a vector field])[
  To draw a cartoon of a vector field:
  1. Pick a bunch of points $P$ that you want to draw the arrows at.
  2. For each $P$, draw a little arrow starting at $P$ in the same direction as $bf(F)(P)$.
    (To make the cartoon readable, you usually scale down the magnitude of the arrow.)
]

In practice, to make the pictures not look absurd,
people will typically draw  the arrows a lot smaller than they really are.
For example, if you get that $bf(F)(10,10) = vec(2,3)$,
then strictly speaking the arrow starting at $(10,10)$ should reach all the way to $(12,13)$.
But if you do this, your cartoon image looks absurd.
So people will typically adjust the arrow sizes in the cartoon to be a _tiny_ arrow,
still pointing the right way, but with much smaller magnitude.
For the cartoon it's usually more important the _relative_ size of the arrows
is correct; drawing the absolute values to scale is unnecessary.

The classic easy-to-draw example is $bf(F) = vec(x,y)$,
in which for every point $P$, one just points straight away from the origin.
See @fig-vecfield-id for that.
For the record, in this figure (and the other figures in this section),
the length of all the little arrows is scaled exactly 30% compared to the true length.

#figure(
  image("figures/vecfield-ex.svg", width: auto),
  caption: [A plot of the first vector field that's drawn in every class,
    good old $bf(F)(x,y) = vec(x,y)$.],
) <fig-vecfield-id>

Okay, here are eight more pictures to train your instincts.
For each one, try to pick a few points like $(2,0)$ or $(3,-1)$ and so on
and verify that the arrow starting at that point points in the way you expect.

#figure(
  image("figures/vecfield-ex2.svg", width: auto),
  caption: [Four more examples of vector fields in $RR^2$.
    The example $bf(F)(x,y) = vec(x,0)$ has just horizontal arrows
    that get longer as $|x|$ grows.
    The example $bf(F)(x,y) = vec(0,x)$ has just vertical arrows, similar story.
    The example $bf(F)(x,y) = vec(y,-x)$ is swirly.
    The example $bf(F)(x,y) = vec(x,y/3)$ is slanted.
  ],
)

#figure(
  image("figures/vecfield-ex3.svg", width: auto),
  caption: [Another four examples of vector fields in $RR^2$.
    The vector field $bf(F)(x,y) = vec(1,1)$ is just constant.
    The vector field $bf(F)(x,y) = vec((x+y)/2,(x-y)/2)$ has some tilted arrows.
    The vector field $bf(F)(x,y) = vec(x,x)$ has all arrows at $45 degree$ angles,
    growing in length with larger $|x|$.
    And the goofy $bf(F)(x,y) = vec(sin(pi/2 x), sin(pi/2 y))$
    has an oscillating behavior.
],
)

== [TEXT] Preview of integration over vector fields

As we mentioned in @sec-warning-trio,
the line integral and surface integral we encountered in Part Golf
(which had a scalar-valued function) are actually the ugly ducklings that don't get used.
For most cases, if you are doing a line integral or surface integral,
you actually want *vector-valued line and surface integrals*,
where one takes a line or surface integral over the entire field.

That's when the type signatures go crazy.

In order for this to be even remotely memorable,
what I'm going to do is augment the previous @poster-triangle
with pictures corresponding to the situations in which we might integrate a vector field.
The new chart can also be downloaded as a
#link("https://web.evanchen.cc/textbooks/poster-stokes.pdf")[large PDF version].

#figure(
  image("figures/integrals-stokes.svg", width: 100%),
  caption: [
    Upgraded @poster-triangle with vector fields.
    Download at #url("https://web.evanchen.cc/textbooks/poster-stokes.pdf").
  ]
) <poster-stokes>

There are two new features of @poster-stokes compared to the old version:
the three purple pictures and the six red arrows.
We'll define them all over the next few sections, so just a few words now.

=== The three purple pictures

There are *three new pictures in purple*: they are *work* (covered in Part India)
and *flux* (covered in Part Juliett).
Basically, these are the only two situations in which we'll be integrating over a vector field:

- We have a path along a vector field and want to measure the _work_
  of the vector field _along_ that path (in the physics sense); this is the focus of Part India.
- We have a surface in a 3D vector field and want to measure the _flux_
  of the vector field _through_ the surface; this is the focus of Part Juliett.

These terms will be defined next chapter.
#typesig[
  The new purple things are _still_ all scalar quantities,
  i.e. work and flux are both numbers, not vectors.
]

As we mentioned in @sec-warning-trio,
the purple pictures will basically replace the corresponding green ones.
Conversely, vector fields will usually only be integrated
in the situations described in the purple picture.
This is summarized in @table-purples.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([], [For scalar fields $f : RR^n -> RR$], [For vector fields $bf(F): RR^n -> RR^n$]),
    [*18.01 integral*], [✅ Used all the time], [❌ Never used in 18.02],
    [*Line integral*], [🔵 Only for arc length], [✅ Used all the time (work)],
    [*Double/Area integral*], [✅ Used all the time], [❌ Never used in 18.02],
    [*Surface integral*], [🔵 Only for surface area], [✅ Used all the time (flux)],
    [*Triple/Volume integral*], [✅ Used all the time], [❌ Never used (except in @eqn-gravity)],
  ),
  caption: [What the various kinds of integrals are used for.
    The integrals with ❌ markers never appear in 18.02,
    so they don't appear in the chart @poster-stokes either.
    (In 18.02 it could happen that line and surface integrals are used for scalar fields
    if you need mass of a wire or metal plate, but that's quite rare I think.)],
  kind: table
) <table-purples>

This bears repeating:
#idea[
  We'll pretty much not use the scalar field integrals besides for arc length and surface area.
  In other words, you can mostly ignore the green pictures in
  the poster @poster-stokes that got replaced by purple ones.
]

=== The six red arrows

There are also *six new red arrows*.
They indicate transformations on functions:
a way to take one type of function and use it to build another function.

For example, the gradient $nabla$ is the one we've discussed:
if you start with a scalar-valued function $f : RR^n -> RR$,
the gradient creates into a vector field $nabla f : RR^n -> RR^n$.
(The $(dif f) / (dif x)$ in the $f : RR^1 -> RR$ case is also just the gradient,
though a bit more degenerate.)

We'll soon meet three more transformations:

- *2D curl*, which converts a vector field on $RR^2$ _back_ into a scalar-valued function;
- *3D curl*, which converts a vector field on $RR^3$ into _another_ vector field;
- *divergence*, which converts a vector field on $RR^3$ _back_ into a scalar-valued function.

== [TEXT] Foreshadowing of Stokes' theorem

All the red arrows have two important properties I will tell you _right now_.
Because I haven't talked much about any of the red arrows yet,
*you won't be able to understand what this means yet*.
That's okay.
We'll go over what this means for each individual red arrow means when we get to it.
However, I want tell you _in advance_ that every time we meet a red arrow,
there will be a case of Stokes' theorem that applies to it.

#memo(title: [Memorize: Two red arrows gives zero])[
  In @poster-stokes,
  if you follow two red arrows consecutively, you get zero.
]

#memo(title: [Memorize: Generalized Stokes' Theorem, for 18.02])[
  In @poster-stokes, take any of the six red arrows
  #text(rgb("ff0000"))[$X -> Y$].
  Let $cal(R)$ be a compact region.
  Then the integral of $X$ over the *boundary* of $cal(R)$
  equals the integral of $Y$ over $cal(R)$:
  $ int_(op("boundary")(cal(R))) X = int_(cal(R)) Y. $
]

In fact let me tell you what generalized Stokes' theorem says,
in vague non-precise terms (we'll make precise later), for each of these six red arrows:

/ Evaluation $->$ 18.01 integral:
  For the $(dif f)/(dif x)$ arrow joining evaluation to the 18.01 integral,
  it's the fundamental theorem of calculus.
  The region $cal(R)$ is the line segment $[a,b]$, and the boundary is the two endpoints $a$ and $b$.
  Then we have the _fundamental theorem of calculus_ from 18.01:
  $ f(b) - f(a) = int_a^b (dif f) / (dif x) dif x. $

/ Evaluation $->$ line integral ($times 2$):
  There are two such red arrows, but the statement is the same for both.
  Suppose $bf(r)(t)$ parametrizes a path joining point $P$ to $Q$
  (say, the line segment $P Q$, or some more curvy path).
  The region $cal(R)$ is this path, and the endpoints are $P$ and $Q$:
  Then we get the _fundamental theorem of calculus for line integrals_:
  $ f(Q) - f(P) = int_(t="start time")^("stop time") nabla f(bf(r)(t)) dot bf(r)'(t) dif t. $
  The right-hand side is the work done by $nabla f$ on the path $bf(r)$.

  If you use shorthand where $cal(C)$ is the curve formed by $bf(r)$,
  this could be rewritten as
  $ f(Q) - f(P) = int_(cal(C)) nabla f dot dif bf(r). $

/ Line integral $->$ double/area integral:
  Suppose now $bf(F) : RR^2 -> RR^2$ is a vector field.
  Write $bf(F) = (p(x,y), q(x,y))$.
  Let $cal(R)$ be some two dimensional region, like a disk.
  Suppose further that the _boundary_ of $cal(R)$ is parametrized by a curve $bf(r)(t)$
  (e.g. the circumference of the disk).
  Then _Green's theorem_ says that
  $ int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t
    = iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif x dif y. $
  The weird expression $(partial q) / (partial x) - (partial p) / (partial y)$
  in the right-hand side is called the 2D scalar curl, but we haven't defined this term yet.

  If you use shorthand as in @table-shorthand, this can be simplified.
  Let $cal(C)$ be the curve formed by $bf(r)$,
  this could be rewritten as
  $ int_(cal(C)) bf(F) dot dif bf(r)
    = iint_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A. $
  There's a second form of Green's theorem I'll show you when I get to it.

/ Line integral $->$ surface integral:
  Suppose now $bf(F) : RR^3 -> RR^3$ is a vector field.
  Let $bf(r)_2(u,v)$ parametrizes some two dimensional surface $cal(S)$ (like a metal sheet),
  and suppose further that the _boundary_ of this surface is parametrized by a curve $bf(r)_1(t)$
  (e.g. the edges of the sheet).
  Then the classical version of _Stokes' theorem_ says that
  $ int_(t="start time")^("stop time") bf(F)(bf(r)_1(t)) dot bf(r)'_1(t) dif t
    = iint_(cal(S)) (nabla times bf(F))(bf(r)_2(u,v)) dot lr(((partial bf(r)_2)/(partial u) times (partial bf(r)_2)/(partial v))) dif u dif v. $
  The nonsense expression $nabla times bf(F)$ is called the curl, defined next chapter in @ch-gcd.

  The shorthand version following @table-shorthand is much easier to read,
  because the shorthand $bf(n) dif S$ stands for the entire hunk
  $lr(((partial bf(r)_2)/(partial u) times (partial bf(r)_2)/(partial v))) dif u dif v$.
  Suppose the curve for $bf(r)_1$ is denoted $cal(C)$.
  Then the above equation compresses all the way down to
  $ int_(cal(C)) bf(F) dot dif bf(r)_1 = iint_(cal(S)) (nabla times bf(F)) dot bf(n) dif S. $
  so yes, that does save a lot of characters.

/ Surface integral $->$ triple/volume integral:
  Suppose now $bf(F) : RR^3 -> RR^3$ is a vector field.
  Let $cal(T)$ be some three-dimensional solid (e.g. metal ball).
  Suppose further the boundary of $cal(R)$ is parametrized
  by some two-dimensional surface $bf(r)(u,v)$ (e.g. metal sphere), which we call $cal(S)$.
  Then the _divergence theorem_ says that
  $ iint_(cal(S)) bf(F)(bf(r)(u,v)) dot lr(((partial bf(r))/(partial u)
    times (partial bf(r))/(partial v))) dif u dif v
    =  iiint_(cal(T)) (nabla dot bf(F))(x,y,z) dif x dif y dif z. $
  If we adopt shorthand again, this reads just
  $ iint_(cal(S)) bf(F) dot bf(n) dif S = iiint_(cal(T)) nabla dot bf(F) dif V. $

  The nonsense expression $nabla dot bf(F)$ is called the divergence, defined next chapter in @ch-gcd.

Again, these bullets will not make sense to you yet (except the first one,
which is the 18.01 fundamental theorem of calculus),
because there are several undefined terms.
Instead, treat this as a template for all the theorem statements you are going to learn soon:
#idea[
  Every red arrow in the poster @poster-stokes has an associated Stokes result.
]
Know this going in to each of the concepts to follow.

#figure(
  image("media/all-stokes.png", width: 80%),
  caption: [It's all Stokes' theorem.],
)

== [TEXT] Stay determined

This is probably super overwhelming right now,
and @poster-stokes might be frightening to look at
because there's so much information in it.
Don't worry, we'll take @poster-stokes apart one piece
at a time over the rest of the semester.

- In @ch-gcd, I'll tell you how to compute each of grad, curl, div.
  This chapter has no integration in it, so if you hate integration, you'll like this chapter.

- I'll start talking about work in @ch-work.
  I'll define it, and then I'll show you how it ties in to the fundamental theorem of calculus
  (which are some of the cases of generalized Stokes' theorem).

- Then @ch-flux will define flux.
  This will let us talk about the rest of the cases of generalized Stokes' theorem.

== [EXER] Exercises

#exer[
  Take a few deep breaths, touch some grass, and have a nice drink of water, so that
  you can look at @poster-stokes without feeling fear.
] <exer-touchgrass>

#exer[
  Print out a copy of the high-resolution version of @poster-stokes
  (which can be downloaded at #url("https://web.evanchen.cc/textbooks/poster-stokes.pdf"))
  and hang it in your room.
] <exer-poster>
