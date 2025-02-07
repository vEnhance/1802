#import "@local/evan:1.0.0":*

Nothing past this point is for exam, obviously.

= If you are thinking of majoring in math... <appendix-math-major>

During the course, one of the students asked me about academic advice
saying they wanted to become a math major at MIT.
If that also describes you, here's what I told them.
The course numbers here are with respect to MIT,
but this advice should hold equally well at other universities.

== The two starter topics are algebra and analysis, not calculus

It may come as a surprise to you that 18.02 isn't a prerequisite, even indirectly,
for most upper-division math classes ($18.x y z$ for $x >= 1$).
The two most important areas to take in pure math are *18.100* (real analysis)
and *18.701--18.702* (algebra); these are sort of the barrier between
the world of pre-university math and serious math.
Once you clear these two classes, the floodgates open and the world of
modern math is yours to explore (see the dependency chart in the Napkin for more on this).

For example, if you take 18.701, the instructor will literally _throw away_ the "definitions"
of linear transformations (and others) you learned in 18.02 and replace them
with the "correct" ones. You've seen me do this already.
Similarly, you will have new rigorous definitions of derivatives and integrals.
In some sense, 18.100 is really _redoing_ all of 18.01 and 18.02 with actual proofs.

== Proof-writing

A prerequisite to both 18.100 (real analysis) and 18.701--18.702 (algebra)
isn't any particular theory, but *proof experience*,
and that's the biggest priority if you don't have that yet.
(And I don't mean two-column proofs in 9th grade geometry.
Two-column proofs were something made up for K-12 education and never used again.)

At MIT, I've been told in recent years there's a class called 18.090 for this.
This class is new enough I don't even have any secondhand accounts,
but if Poonen is on the list of instructors who developed the course, I trust him.
If you're at a different school, my suggestion would be to ask any of the math professors
a question along the lines of
"I'd like to major in math, but I don't have proof experience yet.
Which class in your department corresponds to learning proof arguments?".
They should know exactly what you're talking about.

Alternatively, if you are willing to study proof-writing independently,
the FAQ #url("https://web.evanchen.cc/faq-contest.html#C-5") on my website has some suggestions.
In particular, if you're a textbook kind of person, the book I used growing up was
Rotman's _Journey into Math: An Introduction to Proofs_,
available at #url("https://store.doverpublications.com/products/9780486453064");
it worked well for me.
I'm sure there are other suitable books as well.

== The three phases of math education (from Tao's blog)

Let me put proof-writing into the bigger framework.
Terence Tao, on his #link("https://terrytao.wordpress.com/career-advice/theres-more-to-mathematics-than-rigour-and-proofs/")[blog],
describes a division of mathematical education into three stages.
The descriptions that follows are copied verbatim from that link:

1. The “pre-rigorous” stage, in which mathematics is taught in an informal, intuitive manner,
  based on examples, fuzzy notions, and hand-waving. (For instance, calculus is usually first
  introduced in terms of slopes, areas, rates of change, and so forth.) The emphasis is more on
  computation than on theory.
2. The “rigorous” stage, in which one is now taught that in order to do maths “properly”, one
  needs to work and think in a much more precise and formal manner (e.g. re-doing calculus by
  using epsilons and deltas all over the place). The emphasis is now primarily on theory; and one
  is expected to be able to comfortably manipulate abstract mathematical objects without focusing
  too much on what such objects actually “mean”.
3. The “post-rigorous” stage, in which one has grown comfortable with all the rigorous
  foundations of one’s chosen field, and is now ready to revisit and refine one’s pre-rigorous
  intuition on the subject, but this time with the intuition solidly buttressed by rigorous
  theory. (For instance, in this stage one would be able to quickly and accurately perform
  computations in vector calculus by using analogies with scalar calculus, or informal and
  semi-rigorous use of infinitesimals, big-O notation, and so forth, and be able to convert all
  such calculations into a rigorous argument whenever required.) The emphasis is now on
  applications, intuition, and the “big picture”.

These notes are still in the first stage.
The introduction-to-proofs class at your school
will essentially be the beginning of the second stage.

#pagebreak()

= Proofs of the dot product property

== Deriving the geometric definition of dot product from the algebraic one  <appendix-dotpf-alg>

This proof is short, but harder to come up with.

We have two definitions in play and we want to show they coincide, which makes notation awkward.
So in what follows, our notation $bf(u) dot bf(v)$ will always refer to the
_algebraic_ definition; and we will _prove_ that $bf(u) dot bf(v) = |bf(u)| |bf(v)| cos theta$.

The algebraic definition is already enough to tell us that
#eqn[
  $ bf(w) dot bf(w) = |bf(w)|^2 $
  <eqn-dot-sq>
]
by the Pythagorean theorem: if $bf(w) = angle.l a_1, ..., a_n angle.r $
then both sides equal $a_1^2 + ... + a_n^2$.

Let $C$ denote the origin, and let $A$ and $B$ denote the endpoints of $bf(u)$ and $bf(v)$
when we draw them as arrows emanating from the origin.
Hence $bf(v) - bf(u)$ is a vector pointing from $A$ to $B$.

#figure(
  image("figures/appendix-dotpf-loc.svg", width: auto),
  caption: [We use the law of cosines on triangle $A B C$ together with
    three applications of @eqn-dot-sq to show the geometric definition of dot product.],
) <fig-appendix-dotpf-loc>

We now use @eqn-dot-sq three times as follows:
$ A B^2 &= (bf(v) - bf(u))(bf(v) - bf(u)) \
  &= bf(v) dot bf(v) + bf(u) dot bf(u) - 2 bf(u) dot bf(v) \
  &= C A^2 + C B^2 - 2 bf(u) dot bf(v). $
However, the law of cosines on triangle $A B C$ also tells us that
$ A B^2 = C A^2 + C B^2 - 2 (C A)(C B) cos theta $
where $theta$ is the angle between $bf(u)$ and $bf(v)$.
Setting the two equations for $A B^2$ equal gives
$ bf(u) dot bf(v) = (C A)(C B) cos theta. $
As $|bf(u)| = C A$ and $|bf(v)| = C B$, the proof is complete.

== Deriving the algebraic definition of dot product from the geometric one <appendix-dotpf-geo>

The proof in @appendix-dotpf-alg might seem magical.
Indeed, it's so short because it's cheating in some way:
it starts with the algebraic definition.
But if you've never seen the dot product before, that algebraic definition is unnatural;
you wouldn't have any idea to write the expression $a_1 b_1 + ... + a_n b_n$.
So in this section we give a proof that _starts_ from the geometric formula
and shows how you would come up with $a_1 b_1 + ... + a_n b_n$.

So this time our convention is flipped from @appendix-dotpf-alg:
in what follows, our notation $bf(u) dot bf(v)$ will always refer to the
_geometric_ definition; that is $bf(u) dot bf(v) := |bf(u)| |bf(v)| cos theta$.
And our goal is to show that it matches the algebraic definition.

We will assume that $|bf(u)| = 1$ (i.e. $bf(u)$ is a unit vector)
so that $bf(u) dot bf(v)$ is the length of the projection of $bf(v)$ onto $bf(u)$.
This is OK to assume because in the general case one just scales everything by $|bf(u)|$.

#h3[Easy special case]

As a warmup, try to show that if $bf(u) = vec(a,b)$ is any vector, then $bf(u) dot ee_1 = a$.
(This is easy. The projection of $bf(u)$ onto $ee_1$ is literally $a$.)

#h3[Main proof]

For concreteness, specialize to $RR^2$ and consider $bf(u) dot bf(v)$
where $bf(u) =  vec(a,b)$ is a unit vector (i.e. $bf(u) = 1$),
and $bf(v) = vec(x,y)$ is any vector in $RR^2$.
Then we want to show that the projection of $bf(v)$ onto $bf(u)$ has length $x a + y b$.
See @fig-appendix-dotpf-proj.

#figure(
  image("figures/appendix-dotpf-proj.svg", width: 75%),
  caption: [Proof that the dot product is given by the projection],
) <fig-appendix-dotpf-proj>

The basic idea is to decompose $bf(v) = x ee_1 + y ee_2$.
The length of projection of $bf(v)$ onto $bf(u)$
can be decomposed then into the lengths of projections of $x ee_1$ and $y ee_2$.
(To see this, tilt your head so the green line is horizontal;
recall that the black quadrilateral is a rectangle, hence also a parallelogram).
In other words,
$ bf(u) dot bf(v) = bf(u) dot (x ee_1 + y ee_2)
  = x (bf(u) dot ee_1) + y (bf(u) dot ee_2). $
But we already did the special cases before:
$ bf(u) dot ee_1 &= a \
  bf(u) dot ee_2 &= b. $
Hence, we get the right-hand side is
$ bf(u) dot bf(v) = x a + y b, $
as advertised.
In summary, by using the black parallelogram, we were able to split $bf(u) dot bf(v)$
into two easy cases we already know how to do.

The same idea will work in $RR^3$ if you use $bf(v) = x ee_1 + y ee_2 + z ee_3$
instead, and replace the parallelogram with a parallelepiped,
in which case one now has $3$ easy cases.
And so on in $n$ dimensions.

#pagebreak()

= What does $i^i$ mean? <appendix-i-to-the-i>

When learning mathematics, I believe definitions are actually more important than theorems.
A lot of confusion comes from not having been given careful definitions of the objects.
(See #url("https://web.evanchen.cc/handouts/NaturalProof/NaturalProof.pdf") for more on that.)

So in general any time you are confused about whether an operation is "legal" ---
and this is true in all of math, not just 18.02 ---
*the first thing to really check whether you have been given a precise definition*.
The endless Internet debates on whether $0$ is even or whether $0.999... = 1$ or whether $1/x$ is
a continuous function (hint: yes) are all examples of people who don't know
the definitions of objects they're discussing.

== Real exponents, real base

With that in mind, let's fix $a > 0$ a positive real number and think about what $a^r$ should mean.

#defn[18.100 definition][
- When $n > 0$ is an integer, then $a^n := a dot ... dot a$, where $a$ is repeated $n$ times.
- Then we let $a^(-n) := 1 / a^n$ for each integer $n > 0$.
- When $m/n$ is a rational number, $a^(m/n)$ means the unique $b > 0$ such that $a^m = b^n$.
  (In 18.100, one proves this $b$ is unique and does exist.)
- It's less clear what $a^x$ means when $x in RR$, like $x = sqrt(2)$ or $x = pi$.
  I think usually one takes a limit of rational numbers $q$ close to $x$
  and lets $a^x := lim_(q -> x) a^q$.
  (In 18.100, one proves this limit does in fact exist.)
] <def18100>

== Complex exponents, real base

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
I think the professor even showed this in class:
$
  cos(theta) + i sin(theta)
  &= (1 - theta^2 / 2! + theta^4 / 4! - ...) + (theta - theta^3 / 3! + theta^5 / 5! - ...) i \
  &= 1 + (theta i) + (theta i)^2 / 2! + (theta i)^3 / 3! + (theta i^4) / 4! + (theta i)^5 / 5! \
  &= e^(i theta).
$

== Complex exponents, complex base

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

== Trig functions with complex arguments

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
  the odd $k$'s cancel and the even $k$'s don't, which gives you
  $ e^(i z) + e^(-i z) = 2  - 2 dot z^2/2! + 2 dot z^4/4! - 2 dot z^6/6! + ... . $
  So dividing by $2$, we see $cos(z)$ on the right-hand side, as needed.
  The argument with $sin$ is similar, but this time the even $k$'s cancel
  and you divide by $2i$ instead.
]

So for example, from @reimtrig, we conclude for example that
$ cos(i) = (e + 1/e) / 2. $
Strange but true.

== The future: what are 18.100 and 18.112 anyway?

First I need to tell you what analysis is.
When students in USA ask me what analysis is,
I sometimes say "calculus but you actually prove things".
But that's actually a bit backwards; it turns out that in many parts of the world,
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
  while toil and pathology rule the reals.
]

#pagebreak()

= Saddle point simulation code for @sec-saddle-sim <appendix-saddle-sim>

#raw(read("include/saddle-demo.py"), lang: "py")
