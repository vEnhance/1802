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


On the rare occasions when you need it, you can get a scalar-field line integral
by replacing $1$ with the function $f$ in question, evaluated at the points of the arc:

#memo(title: [Memorize: Scalar-field line integral])[
  If the parametrization $bf(r)(t) : RR -> RR^n$ traces out a path in $RR^n$,
  and $f : RR^n -> RR$ is a function,
  then the *scalar-field line integral* of $f$ is defined by
  $ int_("start time")^("stop time") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t. $
]

We'll pretty much only use this generalization for mass/density type questions, and nowhere else.

As I mentioned in the shorthand table (@table-shorthand), many other sources abbreviate
$ dif s := lr(|bf(r)'(t)|) dif t $
so that the arc length formula gets written as $L = int 1 dif s = int dif s$
and the general formula is $int f dif s$.
However, I will try to avoid this notation when I can.

== [TEXT] Surface area

The section for surface area is about the same,
but the thing that makes this more complicated is you need to parametrize an entire _surface_.
It was pretty easy to think about $bf(r)(t)$ as a path in $RR^n$,
where $t$ was controlling time.
It's more obnoxious to talk about a whole surface,
which is why you see the notation is $bf(s)(u,v)$

== [EXER] Exercises
