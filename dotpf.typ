#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Appendix: dot product proof],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: datetime.today(),
)

Poonen proves this using the law of cosines.
Here is an outline of a proof that doesn't involve any trigonometry.
(Not all the details are filled in here.)
You are not expected to understand this for homework or exams.

We have two definitions in play and we want to show they coincide, which makes notation awkward.
So in what follows, our notation $bf(u) dot bf(v)$ will always refer to the
_geometric_ definition; that is $bf(u) dot bf(v) := |bf(u)| |bf(v)| cos theta$.
And our goal is to show that it matches the algebraic definition given in class.

We will assume that $|bf(u)| = 1$ (i.e. $bf(u)$ is a unit vector)
so that $bf(u) dot bf(v)$ is the length of the projection of $bf(v)$ onto $bf(u)$.
This is OK to assume because in the general case one just scales everything by $|bf(u)|$.

= Easy special case

As a warmup, try to show that if $bf(u) = vec(a,b)$ is any vector, then $bf(u) dot bf(e)_1 = a$.
(This is easy. The projection of $bf(u)$ onto $bf(e)_1$ is literally $a$.)

= Proof

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
