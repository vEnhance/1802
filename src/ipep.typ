#import "@local/evan:1.0.0":*

= A zoomed out pep talk of Part Golf

This whole section is a pep talk.
We'll get to recipes and details in subsequent sections.

== [TEXT] The big table of integrals

The rest of 18.02 is going to cover a bunch of different integrals.
If you've been following my advice to pay attention to type safety so far, it'll help you here.
I'll freely admit that I (Evan) often make type-errors in this part of 18.02 as well,
so don't let your guard down.

Remember that:
#idea[
  Suppose $f : RR^n -> RR$ is given, and $0 <= d <= n$.
  The point of a $d$-dimensional integral of $f$
  is to add up all the values of $f$ among some $d$-dimensional object living in $RR^n$.
]

For example, this idea even makes sense for $d = 0$!
In 18.02, a $0$-dimensional object is a point (or a bunch of points),
and you can evaluate $f$ at a point by just plugging it in.
So philosophically, a $0$-dimensional integral is just a finite sum of $f$ at some points.
This might seem stupid that I bring up this degenerate case,
but it turns out later when we cover div/grad/curl the $0$-dimensional case is relevant.

Here's a giant chart in @fig-int-chart-triangle.
(The chart is so big it doesn't quite fit in the page,
but you can download a
#link("https://web.evanchen.cc/textbooks/poster-ints.pdf")[large PDF version]).

#figure(
  image("figures/integrals-triangle.png", width: 100%),
  caption: [
    For each $0 <= d <= n <= 3$, the kind of integral is drawn and named.
    Download at #url("https://web.evanchen.cc/textbooks/poster-ints.pdf").
  ]
) <fig-int-chart-triangle>

This chart has ten different kinds of integrals,
one for each $(d,n)$ with $0 <= d <= n <= 3$.
Here's a rundown of the things in the chart.

- The case $d = 0$ is stupid, as I just said,
  and it's only here because I'll reference it later.
- The case $d = 1$ and $n = 1$ was covered in 18.01.
  Good old single-variable integral computed using the antiderivative,
  via the fundamental theorem of calculus.

- After that, the conceptually simplest cases are actually $d = n = 2$ and $d = n = 3$
  --- the ones on the diagonal.
  In general, these might be called *double/area integrals* for $n=2$
  and *triple/surface integrals* for $n = 3$.
  We'll say a bit in a moment about how to compute these in practice,
  but the good news is that often you can just chain together old 18.01 integrals;
  you don't even need a parametrization some of the time.

- When $d = 1$ and $2 <= n <= 3$, what you get are *line integrals*.
  The idea is that you have a trajectory in $RR^n$
  which is defined by some parametric equation $bf(r) : RR -> RR^n$.
  You also have a function $f : RR^n -> RR$.
  The line integral lets you add up the values of $f$ along the trajectory.

  This is just turns out to be a _single_ 18.01 integral.
  Usually your path is parametrized by a single variable $t$.
  So even though the expression inside the integral
  $ int_(t_0)^(t_1) f(bf(r(t))) |bf(r)'(t)| dif t $
  inside the integral might look intimidating,
  if you are really given a concrete $f$ and $bf(r)(t)$, then what you _really_ have is
  $ int_(t_0)^(t_1) ["expression involving only " t] dif t $
  which is an 18.01 integral!
  And so that's something you already know how to do.

  In other words, if you have $d=1$ and $n > 1$,
  you basically replace it right away with a single integral
  over the parametrizing line segment.
  In other words *line integrals translate directly into single 18.01 integrals*.

- When $d = 2$ and $n = 3$, we have the *surface integral*.
  To compute these, you usually have to parametrize a _surface_;
  but since a surface is two-dimensional,
  rather than $bf(r)(t)$ for a time parameter $t$
  you have $bf(r)(u,v)$ for two parameters $u$ and $v$ to describe the surface.
  That makes these a little more annoying.

  But like the line integral, after you work out the parametrization stuff,
  the surface integral will transform into a $2$-variable area integral.
  In other words *surface integrals translate directly into area integral*.

So the bottom trio --- 2D/3D line integral and surface integral ---
end up being special instances of the single and double integrals.
We'll see some examples of this later;
but it'll actually be the _last_ thing we cover in part Golf.
Most of part Golf will be dedicated towards double and triple integrals instead.

== [TEXT] Warning about the bottom trio <sec-warning-trio>

The integrals in @fig-int-chart-triangle would be better called
*scalar-field line integral* and *scalar-field surface integral* to emphasize
that this is integration for a _scalar_ function $f : RR^2 -> RR$ or $f : RR^3 -> RR$.
The reason you won't see this term much is the following important caveat
*the line integral and surface integral in @fig-int-chart-triangle are used rarely*.

In 18.02 the only cases where we use these are:
- Arc length (for $d=1$) and surface area (for $d=2$)
- Questions related to mass, or center of mass, of objects like wires
  (for $d=1$) or metal plates (for $d=2$).

In this book, this will happen in @sec-scalar-field-ints, and then
after that the line and surface integrals will
always be the *vector field* variant instead (in Part Hotel).
If you want to flip ahead,
take a glance at @fig-int-chart-stokes at @table-purples.

== [TEXT] Idea of how these are computed when $d = n$ and $n >= 2$

So as I just said, focus for now on $d = n = 2$ or $d = n = 3$
(the double and triple integral cells in chart @fig-int-chart-triangle).

The easiest cases are when the region you're integrating is a rectangle or prism.
Despite looking scary because of the number of integral signs,
they are actually considered the "easy case" to think about for practical calculations:

- A double integral over a rectangle is two 18.01 integrals followed one after another.
- A triple integral over a rectangular prism
  really is three 18.01 integrals followed one after another.

Then there are cases where $d = n = 2$ or $d = n = 3$
but the region is not rectangular.
For example, maybe in $RR^2$ you are trying to do an *area integral* over the disk $x^2+y^2 <= 1$
or you are trying to do a *volume integral* over the ball $x^2+y^2+z^2 <= 1$ for example.

- Even in this case, sometimes you could still set up a double integral
  or triple integral without having to change variables.
  For example, an integral over the disk
  $ iint_(x^2+y^2<=1) f(x,y) dif x dif y $
  might actually be rewritten a double integral
  $ int_(-1)^1 int_(-sqrt(1-y^2))^(sqrt(1-y^2)) f(x,y) dif x dif y. $
  Although it looks more frightening because the limits of integration are
  expressions and not numbers, it doesn't require any new techniques.
  It really is just two 18.01 integrals, one after another.

- If rewriting as a double or triple integral fails,
  then the strategy is instead to *change variables*.
  This method will be covered extensively in @sec-chvar.

So to summarize
#idea[
  Whenever you try to compute a multivariable integral in @fig-int-chart-triangle,
  your goal is to translate it into a rectangular-looking single/double/triple integral,
  then evaluate by using your old 18.01 methods multiple times.
]

This is actually really, really good news!
You might have remembered from 18.01 that computing integrals of single-variable functions
like $integral e^x sin(x)$ was, well, hard!#footnote[It's $1/2 e^x (sin(x) - cos(x)) + C$, by the way.]
Computing antiderivatives was not easy at all; in fact, it's so nontrivial that MIT students
made an #link("https://en.wikipedia.org/wiki/Integration_Bee")[event called the integration bee]
that's like the spelling bee but for integrals (I'm not kidding).
You might have feared that in 18.02, you might need to learn something even more horrifying.

But no, you don't!
It's a lot like how you might have been scared of multivariate differentiation at first,
with the symbols $nabla f$ or partial derivatives,
until you realize that calculating partial derivatives is something
_actually already know how to do_ from 18.01.

The same will be true for multivariable integrals.
The challenge won't actually be the anti-derivatives, which are unchanged for 18.01.
The hard part will actually be figuring out the _limits_ of integration!
