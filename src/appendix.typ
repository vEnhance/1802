#import "@local/evan:1.0.0":*

= Appendix

This entire section is not for exam, obviously.

== If you are thinking of majoring in math... <appendix-math-major>

During the course, one of the students asked me about academic advice
saying they wanted to become a math major at MIT.
If that also describes you, here's what I told them.
The course numbers here are with respect to MIT,
but this advice should hold equally well at other universities.

=== The two starter topics are algebra and analysis, not calculus

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

=== Proof-writing

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

=== The three phases of math education (from Tao's blog)

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


== Proof that the algebraic definition of dot product matches the geometric one <appendix-dotpf>

We have two definitions in play and we want to show they coincide, which makes notation awkward.
So in what follows, our notation $bf(u) dot bf(v)$ will always refer to the
_geometric_ definition; that is $bf(u) dot bf(v) := |bf(u)| |bf(v)| cos theta$.
And our goal is to show that it matches the algebraic definition.

We will assume that $|bf(u)| = 1$ (i.e. $bf(u)$ is a unit vector)
so that $bf(u) dot bf(v)$ is the length of the projection of $bf(v)$ onto $bf(u)$.
This is OK to assume because in the general case one just scales everything by $|bf(u)|$.

=== Easy special case

As a warmup, try to show that if $bf(u) = vec(a,b)$ is any vector, then $bf(u) dot bf(e)_1 = a$.
(This is easy. The projection of $bf(u)$ onto $bf(e)_1$ is literally $a$.)

=== Main proof

#figure(
  image("figures/r02-dotproof.png", width: 75%),
  caption: [Proof that the dot product is given by the projection],
)

For concreteness, specialize to $RR^2$ and consider $bf(u) dot bf(v)$
where $bf(u) =  vec(a,b)$ is a unit vector (i.e. $bf(u) = 1$),
and $bf(v) = vec(x,y)$ is any vector in $RR^2$.
Then we want to show that the projection of $bf(v)$ onto $bf(u)$ has length $x a + y b$.

The basic idea is to decompose $bf(v) = x bf(e)_1 + y bf(e)_2$.
The length of projection of $bf(v)$ onto $bf(u)$
can be decomposed then into the lengths of projections of $x bf(e)_1$ and $y bf(e)_2$.
(To see this, tilt your head so the green line is horizontal;
recall that the black quadrilateral is a rectangle, hence also a parallelogram).
In other words,
$ bf(u) dot bf(v) = bf(u) dot (x bf(e)_1 + y bf(e)_2)
  = x (bf(u) dot bf(e)_1) + y (bf(u) dot bf(e)_2). $
But we already did the special cases before:
$ bf(u) dot bf(e)_1 &= a \
  bf(u) dot bf(e)_2 &= b. $
Hence, we get the right-hand side is
$ bf(u) dot bf(v) = x a + y b, $
as advertised.
In summary, by using the black parallelogram, we were able to split $bf(u) dot bf(v)$
into two easy cases we already know how to do.

The same idea will work in $RR^3$ if you use $bf(v) = x bf(e)_1 + y bf(e)_2 + z bf(e)_3$
instead, and replace the parallelogram with a parallelepiped,
in which case one now has $3$ easy cases.
And so on in $n$ dimensions.

== Saddle point simulation code for @sec-saddle-sim <appendix-saddle-sim>

#raw(read("include/saddle-demo.py"), lang: "py")
