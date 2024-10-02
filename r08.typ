#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 8],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [30 September 2024],
)

#quote(attribution: [Calvin in _Calvin and Hobbes_])[I like maxims that don't encourage behavior modification.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Calculus of multiple variables

== Multivariate domains vs multivariate codomains

In 18.01, you did calculus on functions $F : RR -> RR$.
So "multivariable calculus" could mean one of two things to start:

- Work with $F : RR -> RR^n$ instead (i.e. make the codomain multivariate).
- Work with $F : RR^n -> RR$ instead (i.e. make the domain multivariate).

What you should know now is *the first thing is WAY easier than the second*.
We're pretty much only going to spend 1-2 lectures on the first
and then switch to the second kind for the rest of 18.02.

== Components

Why is $F : RR -> RR^n$ so much easier?
Because there's pretty much only one thing you need to ever do:
#align(center)[
  *TLDR Just always use components.*
]
That is, if $F : RR -> RR^3$ (say), basically 90%+ of the time what you do is write
$ F(t) = angle.l f_1(t), f_2(t), f_3(t) angle.r
  = f_1(t) bf(e)_1 + f_2(t) bf(e)_2 + f_3(t) bf(e)_3 $
and then just do single-variable calculus or calculations on each $f_i$.
Need to differentiate $F$? Differentiate each component.
Need to integrate $F$? Integrate each component.
Need the absolute value of $F$? Square root of sum of components. And so on.
(See @brainfart on page 3 for another example.)

== Adding two vectors

There's a shape of question that comes up in 18.02 sometimes where you need to parametrize
some curve that has two different things influencing it.
90%+ of the time you just add the two vectors.

The cycloid you saw in class was one hard-ish example of this.
The curve looked scary.
But you just ignore the shape, and just think about the equation
$ bf(r)(t) = angle.l t v , a angle.r + angle.l a cos theta(t), a sin theta(t) angle.r. $
Working out the angle is a bit annoying;
but the point is no calculus or theory is involved, just work out the geometry.
Then when you want the velocity, just differentiate $bf(r)(t)$, and so on.

= Recitation problems from official course

/ 1: A hunter walks toward the origin along the positive $x$-axis, with unit
  speed; at time $t = 0$ they are at $x = 10$. Their arrow (of unit length)
  is aimed always toward a rabbit hopping with constant velocity
  $sqrt(5)$ in the first quadrant along the line $y = 2 x$; at time
  $t = 0$ it is at the origin.
/ 1a: Write down the vector-valued function $bf(A) (t)$ for the arrow at time $t$.
  (Clarification: this vector starts from the hunter's location, points towards the rabbit, and has length $1$.)
/ 1b: The hunter shoots and (thankfully) misses when closest to the rabbit; when does that happen?
/ 2: Remember the product rule for the derivative:
  $(f (t) g (t))' = f' (t) g (t) + f (t) g' (t)$.
  Let $bf(a) (t) , bf(b) (t) in bb(R)^3$ be two vector-valued functions of $t$.
/ 2a: Show how taking the derivative interacts with dot product:
    $ (bf(a) (t) dot.op bf(b) (t))' = bf(a)' (t) dot.op bf(b) (t) + bf(a) (t) dot.op bf(b)' (t). $
/ 2b: Show how taking the derivative interacts with cross product:
    $ (bf(a) (t) times bf(b) (t))' = bf(a)' (t) times bf(b) (t) + bf(a) (t) times bf(b)' (t). $
/ 3: A point $P$ moves in space, with position vector
  $bf(r) (t) = arrow(O P) = 3 cos (t) bf(i) + 5 sin (t) bf(j) + 4 cos (t) bf(k)$.
/ 3a: Show it moves on the surface of a sphere centered at the origin.
/ 3b: Show it also moves on a plane through the origin (so with the first
    part, actually moves on a great circle given by intersecting the plane
    with the sphere).
/ 3c: Show its speed is constant.
/ 3d: Show the acceleration is directed toward the origin.

Also: I'm authorized to go over any midterm problems people want to see
(now or in office hours).

= If you're thinking about majoring in course 18...

After the review session on Thursday evening#footnote[Which by the way was a disaster,
  so if you didn't come, good call.
  I'll try to come up with a better plan in the future,
  since I apparently volunteered to lead the next two.
  Suggestions welcome.
  Right now I'm thinking literally to run a mock exam for 50 minutes
  and then go over solutions afterwards, given the number of people attending.],
one student mentioned to me they were thinking about majoring in course 18.
Here's the advice I gave.

It may come as a surprise to you that 18.02 isn't a
real prerequisite (even indirectly) for most serious math classes ($18.x y z$ for $x >= 1$).
The two most important areas to take in pure math are *18.100* (real analysis)
and *18.701--18.702* (algebra); these are sort of the barrier between
the world of pre-university math and serious math.
Once you clear these two classes, the floodgates open and the world of
modern math is yours to explore.

I'm of the impression that *18.02 is not designed for future math majors*; it's a GIR.
For example, if you take 18.701, the instructor will literally _throw away_ the "definitions"
of linear transformations (and others) you learned in 18.02/18.06/etc. and replace them
with the "correct" ones. You've seen me do this already.
Similarly, you will have completely new (and rigorous) definitions of derivatives and integrals.
In some sense, 18.100 is really _redoing_ all of 18.01 and 18.02 with actual proofs.

A prerequisite to both 18.100 and 18.701--18.702 isn't any particular theory, but proof experience.
It used to be that they just threw you to the wolves in 18.100 and you learned by trial by fire
(which for the record I thought was idiotic).#footnote[This historical reason
  is AFAIK why 18.100 is officially listed as one of the possible prerequisites for 18.701.
  It doesn't make any sense subject-wise; rather it means "know what a proof is".]
However, I've been told in recent years there's a class called *18.090*
that tries to teach this instead.
This class is new enough I don't even have any secondhand accounts,
but if Poonen is on the list of instructors I trust him.

#pagebreak()

= Post-recitation notes

== From the instructor's Slack

Me trying to do question 1a.#footnote[As it happened,
  I was sitting around in the ill-fated flight UA 499 from Newark to Boston
  when I sent this, which was delayed until around 11:00pm.
  I got home way later than I should have.
  If I seem cranky this morning, that's probably why.]

#figure(
  image("figures/brainfart.png", width: 95%),
  caption: [Seriously, just do everything componentwise.],
) <brainfart>
