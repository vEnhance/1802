#import "@local/evan:1.0.0":*

= Complex numbers

(I actually don't know why this subject is part of 18.02.)

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
why can't $vec(x_1, dots.v, x_n)$ and $vec(y_1, dots.v, y_n)$ have "product"
$vec(x_1 y_1, dots.v, x_n y_n)$?
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
#thm[
  $ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) <==>
    cos (theta_1 + theta_2) + i sin (theta_1 + theta_2)
    = (cos theta_1 + i sin theta_1) (cos theta_2 + i sin theta_2). $
] <miracle>
This is in my opinion the biggest miracle in all of precalculus.

More generally, the result you need to know is:
#memo(title: [Memorize: Complex multiplication])[
  Suppose $z_1$ and $z_2$ are complex numbers.
  To describe $z_1 z_2$:

  - The magnitude of $z_1 z_2$ is the _product_ of the magnitudes of $z_1$ and $z_2$.
  - The argument of $z_1 z_2$ is the _sum_ of the arguments of $z_1$ and $z_2$.
]

#todo[show an example like $20+21i$ times $5+12i$]

== [TEXT] Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
Depending on what you are trying to do, some forms are easier to work with than others.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Operation], [In rectangular], [In polar]),
    [$z_1 pm z_2$],
      [✅ Component-wise like in $RR^2$],
      [❌ Unless $z_1$ is a real multiple of $z_2$],
    [$z_1 z_2$], [✅ Expanding], [✅ by @miracle],
    [$z_1 slash z_2$], [✅ Use $1/(c+d i) = (c - d i) / (c^2+d^2)$ trick then multiply], [✅ by @miracle],
    [$n$#super[th] root of $z_1$], [❌ Not recommended for $n > 1$], [✅ by @miracle corollary],
  ),
  kind: table
)


== [RECIPE] $n$th powers of complex numbers

Before being able to extract $n$th roots, I need to make sure you know how to do $n$th powers.
This is easy:
$ (r (cos theta  + i sin theta))^n = r^n (cos n theta + i sin n theta). $

#recipe(title: [Recipe for raising a complex number to the $n$th power])[
]
#todo[...]

For example,
$ (3 (cos 18 degree + i sin 18 degree))^5 = 243 (cos 90 degree + i sin 90 degree) = 243 i. $

#todo[write sample]
#todo[compare it to doing it by hand]


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

== [RECIPE] Taking the $n$th root of a complex number

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
  z_4 &= 2 (cos 285 degree + i sin 285 degree).
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
