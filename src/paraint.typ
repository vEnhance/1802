#import "@local/evan:1.0.0":*

= Scalar-field line and surface integrals <sec-scalar-field-ints>

Think back to @fig-int-chart-triangle.
So far we've talked about everything except the three entries
labeled "line integral" and "surface integral".
This section will talk about them.
For clarity, I will actually call these *scalar-field line integral*
and *scalar-field surface integral*.

The reason for this naming is that later we'll meet
vector-field variants of the line and surface integral
that play a much bigger role in 18.02.
Indeed we mentioned in @sec-warning-trio that these scalar-field integrlas
are only used for a few specific cases.

== [TEXT] Arc length, and its generalization to the scalar-field line integral

We've actually met arc length already back in Part Delta!
I'll restate it again here for convenience, but this is a repeat:

#memo(title: [Memorize: Arc length])[
  If the parametrization $bf(r)(t) : RR -> RR^n$ traces out a path in $RR^n$,
  the *arc length* is given by
  $ L = int_("start time")^("stop time") lr(|bf(r)'(t)|) dif t. $
]

In other words, the arc length is the integral of the function $1$ over the whole curve.

#warning(title: [Warning: You don't get Fundamental Theorem of Calculus for arc length])[
  One of the reasons we don't like these scalar-field line and surface integrals much
  is that they just don't behave that well, in part because of the awkward absolute value.
  For example, Stokes' theorem --- the biggest theorem in the 18.02 course ---
  doesn't work for arc length (or anything else in this section).

  To make that warning explicit, note two common "wrong guesses":
  $ int_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b)| - |bf(r)(a)| \
    int_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b) - bf(r)(a)|. $
  This is a tempting mistake to make and I've seen it happen;
  you might hope the fundamental theorem of calculus
  works somehow for $|bf(r)'(t)|$ in analogy to how $int_(x=a)^b f'(x) dif x = f(b) - f(a)$
  for differentiable functions $f : RR -> RR$.
  But that's simply not the case.
  There's just no analog of FTC for arc length.
]

On the rare occasions when you need it, you get a scalar-field line integral as:
#memo(title: [Memorize: Scalar-field line integral])[
  If the parametrization $bf(r)(t) : RR -> RR^n$ traces out a path in $RR^n$,
  and $f : RR^n -> RR$ is a function,
  then the *scalar-field line integral* of $f$ is defined by
  $ int_("start time")^("stop time") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t. $
]
#typesig[
  The scalar-field line integral (and hence arc length as well) outputs a scalar.
]

Note that arc length is just letting $f$ be the constant function $1$.
We'll pretty much only use this generalization for mass/density type questions, and nowhere else.

As I mentioned in the shorthand table (@table-shorthand), many other sources abbreviate
$ dif s := lr(|bf(r)'(t)|) dif t. $
Whenever this shorthand is being used, one frequently cuts out the start and stop time too.
The way this is done is, you let $cal(C)$ denote the curve that $bf(r)(t)$ cuts out.
Then we abbreviate
$ int_("start time")^("stop time") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t $
all the way down to just
$ int_(cal(C)) f dif s. $
So that the arc length formula gets written as $L = int_(cal(C)) dif s$
and the general scalar-field line integral is $int_(cal(C)) f dif s$.

== [TEXT] Surface area

The section for surface area is about the same,
but the thing that makes this more complicated is you need to parametrize an entire _surface_.
It was pretty easy to think about $bf(r)(t)$ as a path in $RR^n$,
where $t$ was controlling time.
It's more obnoxious to talk about a whole surface,
which is why you see the notation is $bf(r)(u,v)$ --- now we need two variables,
and thinking about it as time won't cut it anymore.

Maybe it's best if I give an example of a parametrization.

#example(title: [Example of a parametrization])[
  Consider the surface of a sphere, say $x^2 + y^2 + z^2 = 1$.
  #todo[finish the example]
]

If this feels familiar, it's because we used more or less
the same analogy for change of variables --- cartography.
The Earth is round, but you can still draw a rectangular world map.
So what we call $bf(r)(u,v)$ here is playing the same role
that our transition map $bf(T)$ did back when we did change-of-variables.
The only difference is that in change of variables, we had $bf(T) : RR^2 -> RR^2$
in the 2D case and $bf(T) : RR^3 -> RR^3$ in the 3D case.
But for parametrizing a surface in $RR^3$, we have $bf(r) : RR^2 -> RR^3$ instead.
(That is, in change-of-variables we make a $n$-dimensional map of an $n$-dimensional region,
but here we make a $2$-dimensional map of a surface living in $RR^3$.)

Okay, so in analogy to here are surface area and the scalar-field surface integral.

#memo(title: [Memorize: Surface area and scalar-field surface integral])[
  Suppose $cal(R)$ is a region in $RR^2$.
  If the parametrization $bf(r)(t) : cal(R) -> RR^3$ cuts out a surface $cal(S)$ in $RR^3$,
  the *surface area* is given by
  $ op("Area")(cal(S)) := iint_(cal(R))
    lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
  More generally if we have a function $f : RR^3 -> RR$ we define the
  *scalar-field surface integral* of $f$ over $cal(S)$ as
  $ iint_(cal(R)) f(bf(r)(u,v)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
]
So like before, surface area is the integral of the constant function $1$.

#typesig[
  The scalar-field surface integral (and hence surface area as well) outputs a scalar.
]

Yes, there's a cross product. Yes, it sucks (see @sec-cross-sucks).
This is one case where you probably would prefer to use the shorthand
$ dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v $
so that one can swallow surface area into just
$ op("Area")(cal(S)) &:= iint_(cal(S)) dif S $
where we also cut out the region $cal(R)$ on our cartographer's map from the notation;
instead we write $cal(S)$ directly.
Similarly we have an abbreviation $iint_(cal(S)) f dif S$.

#example(title: [Example: Surface area of a sphere])[
  Show that the surface area of the sphere $x^2+y^2+z^2=1$ is $4 pi$.
  #todo[write this example]
]

== [EXER] Exercises

#todo[write exercises]
