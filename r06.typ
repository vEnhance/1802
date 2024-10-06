#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 6],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [23 September 2024],
)

#quote(attribution: [Clara Oswald, in Doctor Who])[Run, you clever boy, and remember.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- Optional midterm review, 4-270, Thu 4:30pm-6:30pm. Led by me, Vinjay, and Sebastian.
- Please fill out the survey at #url("https://forms.gle/AsXPweCbJ1Nvzp3k7") when you can.
- I made a Discord server. If you didn't get the link emailed to you, ask me to join.
- Remember that September 30 is the last day to switch sections freely on Canvas.

= It's a miracle that multiplication in $CC$ has geometric meaning

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

- All the way back in R01, when I warned you about type safety,
  I repeatedly stressed you that you *cannot multiply two vectors in $RR^n$ to get another vector*.
  You had a "dot product", but it spits out a number.
  (Honestly, you shouldn't think of dot product as a "product"; the name sucks.)

- Of course, the classic newbie mistake (which you better not make on your midterm)
  is to define a product on vectors component-wise:
  why can't $vec(x_1, dots.v, x_n)$ and $vec(y_1, dots.v, y_n)$ have "product"
  $vec(x_1 y_1, dots.v, x_n y_n)$?
  Well, in 18.02, every vector definition needed a corresponding geometric picture
  for us to consider it worthy of attention (see table at start of `r03.pdf`).
  This definition has no geometric meaning.

- However, there is a big miracle for $CC$. For complex numbers, you can define multiplication by
  $(a+b i)(c+d i) = (a c - b d) + (a d + b c) i$ and there is
  _an amazing geometric interpretation_.

Unfortunately, AFAIK there is no English word for
"complex number whose absolute value is one" (err, CNWAVIO?),
the same way there is for "unit vector".
For 18.02, we instead use
$e^(i theta) := cos theta + i sin theta$
as the "word"; whenever you see $e^(i theta)$, draw it as unit vector $cos theta + i sin theta$.

It's worth pointing out the notation $e^(i theta)$ should strike you as _nonsense_.
What meaning does it have to raise a number to an imaginary power?
Does $i^i$ have a meaning? Does $cos(i)$ have a meaning?
(If you want to know, check @i-to-the-i in the post-recitation notes.)

But for 18.02, when starting out,
I would actually think of the notation $e^(i theta)$ as a _mnemonic_,
i.e. a silly way to remember the following result:
#thm[
  If you multiply two CNWAVIO's, you get the CNWAVIO with the angles added:
  $ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) <==>
    cos (theta_1 + theta_2) + i sin (theta_1 + theta_2)
    = (cos theta_1 + i sin theta_1) (cos theta_2 + i sin theta_2). $
  More generally, multiplying two complex numbers multiplies the norms and adds the angles.
] <miracle>
This is IMO the biggest miracle in all of precalculus.
Corollary: $e^(i n theta) = (e^(i theta))^n
<==> (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)$,
allows taking $n$th roots; Maulik showed $z^2 = 2i$ in class.

= Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
Depending on what you are trying to do, some forms are easier to work with than others.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Operation], [In rectangular], [In polar]),
    [$z_1 plus.minus z_2$],
      [✅ Component-wise like in $RR^2$],
      [❌ Unless $z_1$ is a real multiple of $z_2$],
    [$z_1 z_2$], [✅ Expanding], [✅ by @miracle],
    [$z_1 slash z_2$], [✅ Use $1/(c+d i) = (c - d i) / (c^2+d^2)$ trick then multiply], [✅ by @miracle],
    [$n$#super[th] root of $z_1$], [❌ Not recommended for $n > 1$], [✅ by @miracle corollary],
  ),
  kind: table
)

= Recitation problems from official course

/ 1.: For each of the following points, convert it from Cartesian to polar or
  vice versa:
    - $(x , y) = (- sqrt(3) , 1)$
    - $(r , theta) = (3 , pi \/ 6)$
    - $(x, y) = (- sqrt(6) , - sqrt(2))$
/ 2.: Show that $sin (theta) = frac(1, 2 i) (e^(i theta) - e^(- i theta))$ and
  $cos (theta) = 1 / 2 (e^(i theta) + e^(- i theta))$. Use this to write
  $(sin (theta))^3$ in terms $sin (3 theta)$ and $sin (theta)$.
/ 3.: Consider the complex number $f (t) = frac(t + 2 i, 1 - 3 i)$ where $t$ is real.
  - Find the real and imaginary part of $f (t)$.
  - Find $overline(f (t))$ and $lr(|f (t)|)^2$.
/ 4.: Use polar form to find the fourth powers of $2 + 2 i$ and
  $- 3 + i sqrt(3)$. Graph these numbers and their fourth powers on the
  complex plane.
/ 5.: (If you have time) Consider the matrix
  $A = mat(0, - 1; 1, 0)$. In class, working with real
  numbers, this had no eigenvectors. But now we can treat it as a matrix
  with complex number entries. Find complex number eigenvalues for $A$ and
  for each one, find an eigenvector in $CC^2$, i.e. a
  two-component vector $vec(z, w)$ where $z$, $w$ are complex numbers.

#pagebreak()

= Post-recitation notes

== The importance of definitions; also $cos(i)$ and $i^i$ (not for exam) <i-to-the-i>

When learning mathematics, I believe definitions are actually more important than theorems.
A lot of confusion comes from not having been given careful definitions of the objects.
(See #url("https://web.evanchen.cc/handouts/NaturalProof/NaturalProof.pdf") for more on that.)

So in general any time you are confused about whether an operation is "legal" ---
and this is true in all of math, not just 18.02 ---
*the first thing to really check whether you have been given a precise definition*.
The endless Internet debates on whether $0$ is even or whether $0.999... = 1$ or whether $1/x$ is
a continuous function (hint: yes) are all examples of people who don't know
the definitions of objects they're dsicussing.

=== Real exponents, real base

With that in mind, let's fix $a > 0$ a positive real number and think about what $a^r$ should mean.

#defn[18.100 definition][
- When $n > 0$ is an integer, then $a^n := a times ... times a$, where $a$ is repeated $n$ times.
- Then we let $a^(-n) := 1 / a^n$ for each integer $n > 0$.
- When $m/n$ is a rational number, $a^(m/n)$ means the unique $b > 0$ such that $a^m = b^n$.
  (In 18.100, one proves this $b$ is unique and does exist.)
- It's less clear what $a^x$ means when $x in RR$, like $x = sqrt(2)$ or $x = pi$.
  I think usually one takes a limit of rational numbers $q$ close to $x$
  and lets $a^x := lim_(q -> x) a^q$.
  (In 18.100, one proves this limit does in fact exist.)
] <def18100>

=== Complex exponents, real base

But when $z in CC$, what does $a^z$ mean? There's no good way to do this.

You likely don't find an answer until 18.112, but I'll tell you now.
In 18.100 you will also prove that the Taylor series
$ e^x = sum_(k >= 0) r^k / k! $
is correct, where $e := sum_(k >= 0) 1/k!$ is Euler's constant.

So then when you start 18.112, we will flip the definition on its head:

#defn[18.112 definition][
  If $z in CC$, we _define_ $ e^z := sum_(k >= 0) z^k / k!. $
  Then for $a > 0$, we let $a^z = e^(z log a)$.
] <def18112>

To summarize: in 18.100, we defined exponents in the way you learned in grade school
and then proved there was a Taylor series. But in 18.112, you _start_ with the Taylor series
and _then_ prove that the rules in grade school you learned still applied.

And checking this consistency requires work.
Because we threw away @def18100, identities like
$ e^(z_1 + z_2) = e^(z_1) e^(z_2) " and " (e^(z_1))^(z_2) = e^(z_1 z_2)$
are no longer "free": they have to be proved rigorously too.
(To be fair, they need to be proved in 18.100 too, but there it's comparatively easier.)
I think you shouldn't be _surprised_ they're true;
we know it's true for $RR$, so it's one heck of a good guess.
But you shouldn't take these on faith.
At least get your professor to acknowledge they _require_ a (non-obvious) proof,
even if you aren't experienced enough to follow the proof yourself yet.

Anyway, if we accept this definition, then Euler's formula makes more sense:
#thm[Euler][We have $ e^(i theta) = cos theta + i sin theta. $] <euler>
The point is that cosine and sine also have a Taylor series that is compatible with definition:
#eqn[
  $
    cos(x) &= 1 - x^2/2! + x^4/4! - x^6/6! + ... \
    sin(x) &= x - x^3/3! + x^5/5! - x^7/7! + ... .
  $
  <trig>
]
And if you put these together, you can verify @euler, up to some technical issues with infinite sums.
I think Maulik even showed this in class:
$
  cos(theta) + i sin(theta)
  &= (1 - theta^2 / 2! + theta^4 / 4! - ...) + (theta - theta^3 / 3! + theta^5 / 5! - ...) i \
  &= 1 + (theta i) + (theta i)^2 / 2! + (theta i)^3 / 3! + (theta i^4) / 4! + (theta i)^5 / 5! \
  &= e^(i theta).
$

=== Complex exponents, complex base

But what about $i^i$?
Our @def18112 above only worked for positive real numbers $a > 0$.
Here, it turns out you're out of luck.
There isn't any way to define $i^i$ in a way that makes internal sense.
The problem is that there's no way to take a single log of a complex number,
so the analogy with $log a$ breaks down.

Put another way: there's no good way to assign a value to $log(i)$,
because $e^(i pi slash 2) = e^(5 i pi slash 2) = ...$ are all equal to $i$.
You might hear this phrased "complex-valued logarithms are multivalued".
You can have some fun with this paradox:
$ i &= e^(i pi slash 2) ==> i^i = e^(- pi slash 2) \
  i &= e^(5 i pi slash 2) ==> i^i = e^(-5 pi slash 2). $
Yeah, trouble.

=== Trig functions with complex arguments

On the other hand, $cos(i)$ can be defined:
use the Taylor series @trig, like we did for $e^z$.
To spell it out:
#defn[18.112 trig definitions][
  If $z$ is a complex number, we define
  $
    cos(z) &:= 1 - z^2/2! + z^4/4! - z^6/6! + ... \
    sin(z) &:= z - z^3/3! + z^5/5! - z^7/7! + ... .
  $
] <def18112trig>

If you do this, then @def18112 implies the following identities are kosher:
#prop[
  Under @def18112trig, we have the identities
  $ cos(z) &:= (e^(i z) + e^(-i z)) / 2 \
    sin(z) &:= (e^(i z) - e^(-i z)) / (2i). $
] <reimtrig>
#proof[
  If you write out $e^(i z) = sum (i z)^k / k!$
  and $e^(-i z) = sum (-i z)^k / k!$ and add them,
  the odd $k$'s cancel out and the even $k$'s don't, which gives you
  $ e^(i z) + e^(-i z) = 2  - 2 dot z^2/2! + 2 dot z^4/4! - 2 dot z^6/6! + ... . $
  So dividing by $2$, we see $cos(z)$ on the right-hand side, as needed.
  The argument with $sin$ is similar, but this time the even $k$'s cancel
  and you divide by $2i$ instead.
]

So for example, from @reimtrig, we conclude for example that
$ cos(i) = (e + 1/e) / 2. $
Strange but true.

== The future: what are 18.100 and 18.112 anyway? (not for exam)

First I need to tell you what analysis is.
When students in USA ask me what analysis is,
I sometimes say "calculus but you actually prove things".
But that's actually a bit backwards; it turns out that in much parts of the world,
there is no topic called "calculus".#footnote[See #url("https://web.evanchen.cc/faq-school.html#S-10").]
It would be more accurate to say calculus is analysis with proofs, theorems,
and coherent theorem statements deleted,
and it only exists in some parts of the world
(which is why mathematicians will tend to look down on it).

With that out of the way,

- 18.100 is real analysis, i.e. analysis of functions over $RR$
- 18.112 is complex analysis, i.e. analysis of functions over $CC$.

If you ever take either class, I think the thing to know about them is:

#quote(attribution: [Charles Pugh, in _Real Mathematical Analysis_])[
  Complex analysis is the good twin and real analysis is the evil one:
  beautiful formulas and elegant theorems seem to blossom spontaneously in the complex domain,
  while toil and pathology rule the reals
]

Personally, I think it's insane that MIT uses 18.100 as their "intro to proofs" topic.
(This is why 18.100 is a prerequisite for 18.701, abstract algebra, which makes no sense either.)

= Exponentiation (for exam)

This section is dedicated to $z^n$ and is *on-syllabus for exam*.
Specifically, you ought to be able to solve equations like
$ z^5 = 243 i$.
This section shows you how.

In this whole section, you always prefer to work in polar form.
So if you get input in rectangular form, you should first convert to rectangular form.
Conversely, if the answer is asked for in rectangular form,
you should work with polar form anyway,
and only convert to rectangular output at the end.

== Raising to the $n$th power

Before being able to extract $n$th roots, I need to make sure you know how to do $n$th powers.
This is easy:
$ (r (cos theta  + i sin theta))^n = r^n (cos n theta + i sin n theta). $
For example,
$ (3 (cos 18 degree + i sin 18 degree))^5 = 243 (cos 90 degree + i sin 90 degree) = 243 i. $

== Extracting $n$th roots

If you can run the process in forwards, then you should be able to run the process backwards too.
First, I will tell you what the answer looks like:

#thm[
  Consider solving the equation $z^n = w$, where $w$ is a given nonzero complex number, for $z$.
  Then you should always output exactly $n$ answers.
  Those $n$ answers all have magnitude $|w|^(1/n)$ and arguments spaced apart by $(360 degree) / n$.
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
  image("figures/r06-circle.png", width: 80%),
  caption: [The five answers to $z^5 = 243 i$, each of length $3$.],
)


On the right column, all the numbers are equal.
Notice something interesting happening on the right-hand side.
The numbers $cos 90 degree + i sin 90 degree$
and $cos 450 degree + i sin 450 degree$, etc.
are all the same number; if you draw them in the plane, they'll point to the same thing.
However, they give five _different_ answers on the left.
But if you continue the pattern one more, you start getting a cycle
$ z_6 = 3 (cos 378 degree + i sin 378 degree) ==> (z_6)^5 &= 243 (cos 1890 degree + i sin 1890 degree). $
This doesn't give you a new answer, because $z_6 = z_1$.

In general, if $w$ has argument $theta$,
then the arguments of $z$ satisfying $z^n = w$
start at $theta / n$ and then go up in increments of $(360 degree) / n$.
(For example, they started at $(90 degree) / 5 = 18 degree$ for
answers to $z^5 = 243 i$.)
So you can describe the general recipe as:

#recipe(title: [Recipe for $n$th roots])[
1. Convert $w$ to polar form; say it has angle $theta$.
2. One of the $n$ answers will be $|w|^(1/n) (cos theta / n + i sin theta / n)$.
3. The other $n-1$ answers are obtained by increasing the angle in increments of $(360 degree) / n$.
]

- *Example 1*: Solve $z^5 = 243 i$.

  *Answer 1*: we first convert to polar form as
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

- *Example 2*: Solve $z^4 = 8 + 8 sqrt(3) i$.

  *Answer 2*: We first convert to polar form as
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

- *Example 3*: Solve $z^3 = -1000$.

  *Answer 3*: We first convert to polar form as
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
