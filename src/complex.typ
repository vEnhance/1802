#import "@local/evan:1.0.0":*

= Complex numbers

== [TEXT] It's a miracle that multiplication in $CC$ has geometric meaning

Let $CC$ denote the set of complex numbers (just as $RR$ denotes the real numbers).
It's important that realize that, *until we add in complex multiplication,
$CC$ is just an elaborate $RR^2$ cosplay*.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Concept], [For $RR^2$], [For $CC$]),
    [Notation], [$bf(v)$], [$z$],
    [Components], [$vec(x, y)$], [$x + y i$],
    [Length], [Length $|bf(v)|$], [Abs val $|z|$],
    [Direction], [(slope, maybe?)], [argument $theta$],
    [Length $1$], [unit vector], [$e^(i theta) = cos theta + i sin theta$],
    [Multiply], [_NONE_], [✨ $z_1 z_2$ ✨]
  ),
  kind: table
)

At the start of the course, I warned you about type safety
I repeatedly stressed you that you *cannot multiply two vectors in $RR^n$ to get another vector*.
(You had a "dot product", but it spits out a number.
Honestly, you shouldn't think of dot product as a "product"; the name sucks.)

Of course, the classic newbie mistake (which you better not make on your midterm)
is to define a product on vectors component-wise:
why can't $vec(a_1, dots.v, a_n)$ and $vec(b_1, dots.v, b_n)$ have "product"
$vec(a_1 b_1, dots.v, a_n b_n)$?
Well, in 18.02, every vector definition needed a corresponding geometric picture
for us to consider it worthy of attention.
This definition has no geometric meaning.

However, there is a big miracle for $CC$.
For complex numbers, you can define multiplication by
$ (a+b i)(c+d i) = (a c - b d) + (a d + b c) i $
and there is _an amazing geometric interpretation_.

Unfortunately, AFAIK there is no English word for
"complex number whose absolute value is one", the same way there is for "unit vector".
For 18.02, we instead use
$ e^(i theta) := cos theta + i sin theta $
as the "word"; whenever you see $e^(i theta)$, draw it as unit vector $cos theta + i sin theta$.

#digression(title: [What does complex exponents mean anyway?])[
  It's worth pointing out the notation $e^(i theta)$ should strike you as a type-error
  based on what you've learned in school.
  What meaning does it have to raise a number to an imaginary power?
  Does $i^i$ have a meaning? Does $cos(i)$ have a meaning?
  If you want to know, check @appendix-i-to-the-i in the Appendix.
]

But for 18.02, when starting out,
I would actually think of the notation $e^(i theta)$ as a _mnemonic_,
i.e. a way to remember the following result:
#eqn[
  $ underbrace((cos theta_1 + i sin theta_1), = e^(i theta_1))
    dot underbrace((cos theta_2 + i sin theta_2), = e^(i theta_2))
    = underbrace(cos (theta_1 + theta_2) + i sin (theta_1 + theta_2), = e^(i (theta_1 + theta_2))). $
  <eqn-miracle>
]
This is in my opinion the biggest miracle in all of precalculus.
Really, I want to stress: @eqn-miracle is supposed to be _astonishing_.
My goal by the end of this chapter is to convince you that
something really powerful is happening in @eqn-miracle
allowing you to do things that you absolutely should not expect to be able to do.

More generally, the result you need to know is:
#memo(title: [Memorize: Complex multiplication])[
  Suppose $z_1$ and $z_2$ are complex numbers.
  To describe $z_1 z_2$:

  - The magnitude of $z_1 z_2$ is the _product_ of the magnitudes of $z_1$ and $z_2$.
    That is,
    #eqn[
      $ |z_1 z_2| = |z_1| |z_2| $
      <eqn-magnitudes>
    ]
  - The argument of $z_1 z_2$ is the _sum_ of the arguments of $z_1$ and $z_2$.
    This is @eqn-miracle.
]

Here's a simple example.
#example[
  Let's consider the complex numbers:
  $ z_1 = 20 + 21 i quad "and" quad z_2 = 5 + 12 i. $
  Following your high school, the product $z_1 dot z_2$ is calculated as follows:
  $ z_1 dot z_2 &= (20 + 21 i) (5 + 12 i)
    = 20 dot 5 + 20 dot 12 i + 21 i dot 5 + 21 i dot 12 i \
    &= 100 + 240 i + 105 i + 252 i^2 \
    &= 100 + 345 i + 252 (- 1) quad ("since " i^2 = - 1) \
    &= 100 + 345 i - 252 = (100 - 252) + 345 i = - 152 + 345 i. $
  The above theorem is promising that if we had used polar form,
  the _angles_ will add and the _magnitudes_ will multiply.
  Let's verify this holds up.

  For the magnitudes, you can do this by hand:
  we have $|z_1| = sqrt(20^2 + 21^2) = 29$ and $|z_2| = sqrt(5^2 + 12^2) = 13$,
  and indeed we have the miraculous
  $|z_1 z_2| = sqrt(152^2 + 345^2) = 377. $

  The angles here probably need a calculator to verify.
  For the angles, from $arctan(21/20) approx 46.04 degree$
  and $arctan(12/5) approx 67.38 degree$, we have
  $ z_1 &approx 29 (cos 46.04 degree + i sin 46.04 degree) \
    z_2 &approx 13 (cos 67.38 degree + i sin 67.38 degree) \ $
  so we're expecting that
  $ z_1 z_2 approx 377 (cos 113 degree + i sin 113 degree) $
  and indeed $arctan(-345/152) approx 113 degree$, as needed!
]

Here's a more substantial example, which shows how @eqn-miracle can be used
to compute things that wouldn't be feasible by hand with the rectangular form.

#sample[
  Compute $(1+i)^(10)$.
]
#soln[
  The idea is that we will write $1+i$ in polar form as:
  $ 1 + i = sqrt(2) (cos pi / 4 + i sin pi / 4). $
  Then raising powers is easy, because of @eqn-miracle.
  To spell it out:
  $ (1 + i)^2 &= (sqrt(2))^2 (cos (2 dot pi / 4) + i sin (2 dot pi / 4)) \
    (1 + i)^3 &= (sqrt(2))^3 (cos (3 dot pi / 4) + i sin (3 dot pi / 4)) \
    (1 + i)^4 &= (sqrt(2))^4 (cos (4 dot pi / 4) + i sin (4 dot pi / 4)) \
    (1 + i)^5 &= (sqrt(2))^5 (cos (5 dot pi / 4) + i sin (5 dot pi / 4)) \
    &dots.v \
    (1 + i)^(10) &= (sqrt(2))^(10) (cos (10 dot pi / 4) + i sin (10 dot pi / 4)). $
  We can simplify this now: we know
  $ (1 + i)^(10) = 2^5 (cos (5 dot pi / 2) + i sin (5 dot pi / 2)) = 32 (0 + i)
    = #boxed[$ 32 i $]. #qedhere $
]
Compare to how annoying this would be if we tried to do it by multiplying $10$ times:
the fastest way with repeated squaring would be something like
$ (1 + i)^2 &= (1)^2 + 2 dot 1 dot i + i^2 = 1 + 2 i + (- 1) = 2 i \
  (1 + i)^4 &= ((1 + i)^2)^2 = (2 i)^2 = 4 i^2 = 4 dot (- 1) = - 4 \
  (1 + i)^8 &= ((1 + i)^4)^2 = (- 4)^2 = 16  \
  (1 + i)^(10) &= (1 + i)^8 dot (1 + i)^2 = 16 dot 2 i = 32 i. $
But you could easily imagine replacing $10$ with $100$ (which we'll do shortly) or even $1000000$.
Such a method would quickly become infeasible; whereas the polar coordinates
let us avoid all this work.

== [SIDENOTE] Extracting trig identities and the Brahmagupta-Fibonacci identity

In this optional section I want to convince you that @eqn-magnitudes and @eqn-miracle
are doing a lot of magic.
To do so I'll show you to consequences of these equations
that you would not expect to be true.

=== Application 1: @eqn-magnitudes gives the Brahmagupta-Fibonacci identity

Let's start with _magnitudes_.
If you don't trust your teacher (a good instinct to have sometimes 😉)
you might not _believe_ me the magnitudes multiply.
Because let's say $z_1 = a + b i$ and $z_2 = c + d i$.
Then
$ z_1 z_2 = (a + b i)(c + d i) = (a c - b d) + (a d + b c) i $
doesn't look anything right.
If @eqn-magnitudes is really true, it's promising that
$ sqrt(a^2+b^2) dot sqrt(c^2+d^2) = sqrt((a c - b d)^2 + (a d + b c)^2) $
or equivalently
#eqn[
  $ (a^2+b^2)(c^2+d^2) = (a c - b d)^2 + (a d + b c)^2 $
  <eqn-br-fib>
]
is supposed to be true for _all_ real numbers $a$, $b$, $c$, $d$.

But how could that be? @eqn-br-fib doesn't even _look_ true,
and if I told this to you with no context, you wouldn't believe it.
It's not until you multiply out @eqn-br-fib with brute force
that you might believe me:
$ (a^2+b^2)(c^2+d^2) &= a^2 c^2 + b^2 c^2 + a^2 d^2 + b^2 d^2 \
  (a c - b d)^2 + (a d + b c)^2 &= (a^2 c^2 - 2 a b c d + b^2 d^2) + (a^2 d^2 + 2 a b c d + b^2 c^2) \
  &= a^2 c^2 + b^2 d^2 + a^2 d^2 + b^2 c^2. $
They really are equal! The $2 a b c d$ has apparently cancelled out magically.
(This unexpected identity is called the
#link("https://w.wiki/CLMJ")[Brahmagupta-Fibonacci identity],
if you want a name, but we won't use this name again later.)

=== Application 2: @eqn-miracle gives the trig addition formula and the double-angle formula

Let's say you still don't trust your teacher (again, good!)
and even though you have grudgingly admitted @eqn-magnitudes is true,
you don't believe the other equation @eqn-miracle.
Because if @eqn-miracle is true, then again brute-force expansion gives
$ cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)
  &= (cos theta_1 + i sin theta_1)(cos theta_2 + i sin theta_2) \
  &= (cos theta_1 cos theta_2 - sin theta_1 sin theta_2)
  + i (sin theta_1 cos theta_2 + sin theta_2 cos theta_1). $
So for @eqn-miracle to be true, you would need for _any_ angles $theta_1$ and $theta_2$ that
$ cos(theta_1 + theta_2) &= cos theta_1 cos theta_2 - sin theta_1 sin theta_2 \
  sin(theta_1 + theta_2) &= sin theta_1 cos theta_2 + cos theta_1 sin theta_2. $
But this _is_ true: it's the trig addition formula!

Put another way: if you have trouble remembering the trig addition formulas (like me),
then @eqn-miracle shows you how you can derive it.
@eqn-miracle is easy to remember, and if you do the expansion,
the mysterious trig addition formula falls out.

The double angle formula is also a special case: from
$ cos(2 theta) + i sin(2 theta) = (cos theta + i sin theta)^2
  = (cos^2 theta - sin^2 theta) + i dot 2 sin theta cos theta $
we can read off $cos(2 theta) = cos^2 theta - sin^2 theta$
and $sin(2 theta) = 2 sin theta cos theta$.

== [RECIPE] $n$th powers of complex numbers <sec-recipe-complex-nth-power>

Earlier I showed you how to calculate $(1+i)^(10)$ rapidly using polar form.
You can do this in general too: the point is that
#eqn[
  $ (r (cos theta  + i sin theta))^n = r^n (cos n theta + i sin n theta). $
  <eqn-de-moivre>
]
@eqn-de-moivre is sometimes called _De Moivre's theorem_, but it's such an easy consequence
of @eqn-miracle and @eqn-magnitudes that I don't think it really needs its own name.
Nonetheless, if you see the name in other places, it's referring to @eqn-de-moivre.

#recipe(title: [Recipe for raising a complex number to the $n$th power])[
  Given a complex number $z$, to compute $z^n$:

  1. Convert $z = r(cos theta + i sin theta)$ in polar form if it isn't already.
  2. Use $z^n = r^n (cos n theta + i sin n theta)$.
  3. Simplify the $cos n theta + i sin n theta$ and output the answer.
]


Here's the example with $(1+i)^(10)$ again,
but with $10$ replaced by $100$ for emphasis.

#sample[
  Compute $(1+i)^(100)$.
]

#soln[
  The polar form of $1 + i$ is:
  $ 1 + i = sqrt(2) (cos pi / 4 + i sin pi / 4). $
  Raising to the $100$th power gives
  $ (1 + i)^(100) &= (sqrt(2))^(100) (cos (100 dot pi / 4) + i sin (100 dot pi / 4))\
  &= 2^(50) (cos(25 pi) + i sin(25 pi)) \
  &= 2^(50) (cos(pi) + i sin(pi)) = #boxed[$ -2^(50) $]. #qedhere $
]

#sample[
  Compute $(1 - sqrt(3) i)^(20)$.
]
#soln[
  First convert $1 - sqrt(3) i$ to polar form:
  $ 1 - sqrt(3) i = 2 (cos (5 pi) / (3) + i sin (5 pi) / (3)). $
  Then, when we raise to the $20$th power, we get
  $ (1 - sqrt(3) i)^20 = 2^20 (cos ((100 pi) / (3)) + i sin ((100 pi) / (3))). $
  The cosine and sine cycle every $2 pi$, so we write
  $ (100 pi) / (3) = (4 pi) / (3) + 2 pi dot 16. $
  We only care about the "remainder" $4 pi / 3$; we have
  $ cos ((100 pi) / (3)) = cos (240 degree) = - 1 / 2 $
  $ sin ((100 pi) / (3)) = sin (240 degree) = - sqrt(3) / 2. $
  Substituting back:
  $ (1 - sqrt(3) i)^20 &= 2^20 (- 1 / 2 - i sqrt(3) / 2) \
    &= 2^(20) times (- frac(1 + sqrt(3) i, 2)) = #boxed[$ - 2^(19) (1 + sqrt(3) i) $]. $
  (If you care, $2^(19) = 524288$, so one could also write $-524288 - 524288 sqrt(3) i$.)
]

== [TEXT] An example of $n$th roots of complex numbers: solving $z^5 = 243i$

This section is dedicated to $z^n$ and is on-syllabus for exam.
Specifically, you ought to be able to solve equations like
$ z^5 = 243 i$.
This section shows you how.

In this whole section, you always prefer to work in polar form.
So if you get input in rectangular form, you should first convert to rectangular form.
Conversely, if the answer is asked for in rectangular form,
you should work with polar form anyway,
and only convert to rectangular output at the end.

If you can raise to the $n$th power, you should be able to extract $n$th roots too,
by running the recipe "backwards".
First, I will tell you what the answer looks like:

#memo(title: [Memorize: The shape of an $n$th root answer])[
  Consider solving the equation $z^n = w$,
  where $w$ is a given nonzero complex number, for $z$.
  Then you should always output exactly $n$ answers.
  Those $n$ answers all have magnitude $|w|^(1/n)$
  and arguments spaced apart by $(360 degree) / n$.
]

I think it's most illustrative if I show you the five answers to
$ z^5 = 243 i $ to start.
Again, first we want to convert everything to polar coordinates:
$ z^5 = 243 i = 243 (cos 90 degree + i sin 90 degree). $
At this point, we know that if $|z^5| = 243$, then $|z| = 3$;
all the answers should have absolute $3$.
So the idea is to find the angles.
Here are the five answers:

$
z_1 = 3 (cos 18 degree + i sin 18 degree) ==> (z_1)^5 &= 243 (cos 90 degree + i sin 90 degree) \
z_2 = 3 (cos 90 degree + i sin 90 degree) ==> (z_2)^5 &= 243 (cos 450 degree + i sin 450 degree) \
z_3 = 3 (cos 162 degree + i sin 162 degree) ==> (z_3)^5 &= 243 (cos 810 degree + i sin 810 degree) \
z_4 = 3 (cos 234 degree + i sin 234 degree) ==> (z_4)^5 &= 243 (cos 1170 degree + i sin 1170 degree) \
z_5 = 3 (cos 306 degree + i sin 306 degree) ==> (z_5)^5 &= 243 (cos 1530 degree + i sin 1530 degree).
$

Here's a picture of the five numbers:

#figure(
  image("figures/complex-circle.svg", width: auto),
  caption: [The five answers to $z^5 = 243 i$, each of length $3$.],
)

On the right column, all the numbers are equal.
Notice something interesting happening on the right-hand side.
The numbers $cos 90 degree + i sin 90 degree$
and $cos 450 degree + i sin 450 degree$, etc. are all the same number;
if you draw them in the plane, they'll point to the same thing.
However, they give five _different_ answers on the left.
But if you continue the pattern one more,
you start getting a cycle
$ z_6 = 3 (cos 378 degree + i sin 378 degree) ==>
  (z_6)^5 &= 243 (cos 1890 degree + i sin 1890 degree). $
This doesn't give you a new answer, because $z_6 = z_1$.

== [RECIPE] Taking the $n$th root of a complex number <sec-recipe-complex-nth-root>

In general, if $w$ has argument $theta$,
then the arguments of $z$ satisfying $z^n = w$
start at $theta / n$ and then go up in increments of $(360 degree) / n$.
(For example, they started at $(90 degree) / 5 = 18 degree$ for
answers to $z^5 = 243 i$.)
So you can describe the general recipe as:

#recipe(title: [Recipe for $n$th roots of complex numbers])[
  1. Convert $w$ to polar form; say it has angle $theta$.
  2. One of the $n$ answers will be $|w|^(1/n) (cos theta / n + i sin theta / n)$.
  3. The other $n-1$ answers are obtained by increasing the angle in increments of $(360 degree) / n$.
]

#sample[Solve $z^5 = 243 i$ for $z in CC$.]
#soln[
  We first convert to polar form as
  $ 243 i = 243 (cos 90 degree + i sin 90 degree) $
  and see that $243^(1/5) = 3$, and $theta = 90 degree$.
  The first angle is $theta / 5 = 18 degree$.
  So the five answers are
  $
  z_1 &= 3 (cos 18 degree + i sin 18 degree) \
  z_2 &= 3 (cos 90 degree + i sin 90 degree) \
  z_3 &= 3 (cos 162 degree + i sin 162 degree) \
  z_4 &= 3 (cos 234 degree + i sin 234 degree) \
  z_5 &= 3 (cos 306 degree + i sin 306 degree).
  $
  (As it happens, $z_2 = 3i$, which is easy to check by hand works.)
]
#sample[Solve $z^4 = 8 + 8 sqrt(3) i$ for $z in CC$.]
#soln[
  We first convert to polar form as
  $ 8 + 8 sqrt(3) i = 16 (cos 60 degree + i sin 60 degree) $
  and see that $16^(1/4) = 2$, and $theta = 60 degree$.
  The first angle is $theta / 4 = 15 degree$.
  So the four answers are
  $
  z_1 &= 2 (cos 15 degree + i sin 15 degree) \
  z_2 &= 2 (cos 105 degree + i sin 105 degree) \
  z_3 &= 2 (cos 195 degree + i sin 195 degree) \
  z_4 &= 2 (cos 285 degree + i sin 285 degree). #qedhere
  $
]
#sample[Solve $z^3 = -1000$ for $z in CC$.]
#soln[
  We first convert to polar form as
  $ -1000 = 1000 (cos 180 degree + i sin 180 degree) $
  and see that $1000^(1/3) = 10$, and $theta = 180 degree$.
  The first angle is $theta / 3 = 60 degree$.
  So the three answers are
  $
  z_1 &= 10 (cos 60 degree + i sin 60 degree) \
  z_2 &= 10 (cos 180 degree + i sin 180 degree) \
  z_3 &= 10 (cos 300 degree + i sin 300 degree).
  $
  (As it happens, $z_2 = -10$, as expected, since $(-10)^3 = -1000$.)
]

== [RECAP] Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
We saw that polar form (because of @eqn-miracle and @eqn-magnitudes)
is really good if you're doing lots of multiplication.
So to summarize, @tab-complex tells you rules of thumb for complex numbers.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Operation], [In rectangular], [In polar]),
    [$z_1 pm z_2$],
      [✅ Component-wise like in $RR^2$],
      [❌ Unless $z_1$ is a real multiple of $z_2$],
    [$z_1 z_2$], [✅ Expanding], [✅ By @eqn-miracle + @eqn-magnitudes],
    [$z_1 slash z_2$], [✅ Write $1/(c+d i) = (c - d i) / (c^2+d^2)$ then multiply], [✅ By @eqn-miracle + @eqn-magnitudes],
    [$z^n$], [❌ Possible but takes forever], [✅ Shown in @sec-recipe-complex-nth-power],
    [$n$#super[th] root of $z$], [❌ Not recommended for $n > 1$], [✅ Shown in @sec-recipe-complex-nth-root],
  ),
  kind: table
) <tab-complex>

== [EXER] Exercises

#exerstar[
  Without a calculator, find integers $a$ and $b$ such that
  $ a^2 + b^2 = 101 dot 401 dot 901. $
]
