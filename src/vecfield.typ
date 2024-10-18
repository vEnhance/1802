#import "@local/evan:1.0.0":*

= Vector fields

== [TEXT] Vector fields

In Part Golf, we only considered integrals of scalar-valued functions.
However, in Part Hotel we will meet a *vector field*,
which is another name for a function that inputs points and outputs vectors.
#definition[
  A *vector field* for $RR^n$ is a function $F : RR^n -> RR^n$
  that assigns to each point $P in RR^n$ a vector $bf(F)(P) in RR^n$.
]

You actually have met these before
#example[
  Every gradient is an examples of a vector fields!
  That is, if $f : RR^n -> RR$, then $nabla f$ is a vector field for $RR^n$.
]
In fact, there's a word for this:
#definition[
  A vector field for $RR^n$ is called *conservative*
  if it happens to equal $nabla f$ for some function $f : RR^n -> RR$.
]
In Part Hotel we'll meet vector fields that aren't conservative too.

#typesig[
  For standalone vector fields, we'll always use capital bold letters like $bf(F)$ to denote them.
  That said, remember $nabla f$ is _also_ a vector field.
  So that's why the operator $nabla$ itself is typeset a little bit bold.

  Like the gradient, you should draw inputs to $bf(F)$ as _points_ (dots)
  but the outputs as _vectors_ (arrows). Don't mix them.
]

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
  Then at any point, we draw a tiny arrow $bf(F)(P)$
  indicating the direction and speed of the water at the point $P$.
  You could imagine if you put a little ball at the point $P$,
  the current would move the ball along that arrow.
]

Sounds a lot like the gradient, right?
Indeed, conservative vector fields are a big family of vector fields,
and so we should expect they fit this picture pretty neatly.
But the thing about conservative vector fields is this: $nabla f$,
as a vector field, is always rushing _towards_ whatever makes the value of $F$ bigger.
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
  Remember, the gradient of $f$ tells you what direction to move in to increase $f$.
  And if you throw a ball into a river, its motion could be described simply as:
  the ball moves downstream.
]

#todo[draw a picture of a river with a mountain]

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

#todo[draw a picture of a whirlpool]

== [TEXT] Preview of integration over vector fields

So far everything's great.
But soon we'll have to start integrating over vector fields.
That's when the type signatures go crazy.

In order for this to be even remotely memorable,
what I'm going to do is augment the previous @fig-int-chart-triangle
with pictures corresponding to the situations in which we might integrate a vector field.
The new chart can also be downloaded as a
#link("https://web.evanchen.cc/upload/1802/integrals-stokes.pdf")[large PDF version].

#figure(
  image("figures/integrals-stokes.png", width: 100%),
  caption: [
    Upgraded @fig-int-chart-triangle with vector fields.
    Download at #url("https://web.evanchen.cc/upload/1802/integrals-stokes.pdf").
  ]
) <fig-int-chart-stokes>

There are two new features of @fig-int-chart-stokes compared to the old version:
the three purple pictures and the six red arrows.
We'll define them all over the next few sections, so just a few words now.

=== The three purple pictures

There are *three new pictures in purple*: they are *work* (for 1-D case) and *flux* (2-D case).
Basically, these are the only two situations in which we'll be integrating over a vector field:

- either we have a path along a vector field and want to measure the _work_
  of the vector field _along_ that path (in the physics sense),
- or we have a surface in a 3-D vector field and want to measure the _flux_
  of the vector field _through_ the surface.

These terms will be defined next section.
#typesig[
  The new purple things are _still_ all scalar quantities,
  i.e. work and flux are both numbers, not vectors.
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

=== Stay determined

This is probably super overwhelming right now,
and @fig-int-chart-stokes might be frightening to look at because there's so much information in it.
Don't worry, we'll take @fig-int-chart-stokes apart one piece at a time over the rest of the semester.
This will be a three-phase program:

- First, I'll tell you how to _integrate_ work and flux of a vector field.
- Second, I will define _individually_ each of the three transformations grad, curl, div.
  (Actually we defined the first one already, so it's just curl and div.)
- Third, I'll tell you how grad, curl, and div interact with each other,
  using the notorious _generalized Stokes' theorem_.

== [EXER] Exercises

#exer[
  Take a few deep breaths, touch some grass, and have a nice drink of water, so that
  you can look at @fig-int-chart-stokes without feeling fear.
]
#exer[
  Print out a copy of the high-resolution version of @fig-int-chart-stokes
  (which can be downloaded at #url("https://web.evanchen.cc/upload/1802/integrals-stokes.pdf"))
  and hang it in your room.
] <exer-poster>

#pagebreak()

= Work and flux
