#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [18.02 Mock Half-Final],
  author: "Evan Chen",
  date: [13 October 2024],
  maketitle: false,
)


#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final

- Since 3-hour exams constitute cruel and unusual punishment,
  this is only 90 minutes long. There will be eight questions.
  We cover all post-midterm 3 topics and a random subset of earlier topics.

- Like the real exam, I suggest not referring to any notes/calculators/etc.

- Solutions are posted in Section 45 of my LAMV book at #url("https://web.evanchen.cc/1802.html").
]

#pagebreak()

#block[
#show heading: set align(center)
#set heading(numbering: none)

= 18.02 Mock Half-Final Questions

/ 1.:
  Give an example of a complex number $z$ whose
  real and imaginary part are both negative such that $z^3 = - 1000 i$.
  Write your answer in rectangular form.

/ 2.:
  Compute the unique real number $a$ for which the matrix
  $M = mat(1,1;a,6)$ has an eigenvalue of $2$.
  For this value of $a$, compute the other eigenvalue of $M$ and its corresponding eigenvector.

/ 3.:
  The four points $(b,0,0)$, $(0,b,0)$, $(0,0,b)$, and $(2,3,6)$ lie on a plane $cal(P)$.
  Compute $b$, and compute the distance from $(1,2,3)$ to $cal(P)$.

/ 4.:
  Give an example of a saddle point of the function $f(x,y) = cos(x) + sin(y)$
  and sketch the level curve of $f$ through passing that saddle point.
  Do the same for an example of a local maximum.

/ 5.:
  Compute the maximum and minimum value of $x^2+2y^2+4x$ over the region $x^2+y^2 <= 9$.

/ 6.:
  Compute $int_(0)^1 int_(x)^1 int_(y)^1 e^(z^3) dif z dif y dif x$.
  (Recommended approach: change the order of integration.)

/ 7.:
  Compute the real number $c$ for which
  $bf(F)(x,y,z) = angle.l 7 cos(x), thin cos(y) cos(2z), thin c sin(y) sin(2z) angle.r$
  is conservative.
  For that $c$, compute the maximum possible value of a line integral
  $int_(cal(C)) bf(F) dot dif bf(r)$ across all possible choices of some curve $cal(C)$ in $RR^3$.

/ 8.:
  Let $bf(F)(x,y,z) = angle.l x + e^y + z^3, thin e^x + y + z^3, thin z angle.r$.
  Let $cal(S)$ be the surface defined by $x^2+y^2=100$ and $1 <= z <= 2$,
  with normal vector oriented outwards (thus $cal(S)$ is the curved part of a cylinder).
  Compute the divergence of $bf(F)$.
  Then compute the flux of $bf(F)$ through $cal(S)$.
  (Recommended approach: add two "lids" to $cal(S)$, calculate flux through the lids by hand,
  then use the divergence theorem.)

Solutions are posted in Chapter N of #url("https://web.evanchen.cc/textbooks/lamv.pdf").
]


#pagebreak()

= Solutions draft

== Solution to question 1 (complex numbers)

We'll just find all the answers to $z^3 = -1000 i$ and then identify the relevant one.
In polar form, write
$ z^3 = - 1000 i = 1000 dot (cos 270 degree + i sin 270 degree). $
Take the cube roots with the standard recipe:
the magnitudes should be $root(3, 1000) = 10$
and the arguments should start from $(270 degree) / 3 = 90 degree$
and be spaced $120 degree$ apart.
That is, the three cube roots should be
$ z_1 &= 10 (cos 90 degree + i sin 90 degree) \
  z_2 &= 10 (cos 210 degree + i sin 210 degree) \
  z_3 &= 10 (cos 330 degree + i sin 330 degree). $

Of these three answers, we want the one
whose real and imaginary part are both negative.
Only $z_2$ works; in rectangular form it is
$ z_2 = 10 (- sqrt(3) / 2 - i 1 / 2) = #boxed[$ - 5sqrt(3) - 5 i $] $
(and this is the only possible example).


== Solution to Q2 (matrix eigenvalues)

=== Solution with bare-hands

Given that $2$ is an eigenvalue of $M$,
we should have $det (M - 2 I) = 0$.
Write
$ 0 = det(M - 2 I) = detmat(1 - 2, 1; a, 6 - 2) = detmat(- 1, 1; a, 4)
  = -4 - a ==> #boxed[$ a=  -4 $]. $

Now let's go back to the characteristic polynomial again.
The eigenvalues are those $lambda$ such that
$ 0 = detmat(1 - lambda, 1; -4, 6 - lambda)
  = (1 - lambda)(6 - lambda) + 4 = lambda^2 - 7 lambda + 10. $
We know that $lambda = 2$ is one root of the quadratic;
the other one is $#boxed[$ lambda = 5 $]$.

=== Solution using trace and determinant shortcut

Let $lambda_2$ be the other eigenvalue.
If you happen to remember that the trace is the sum of the eigenvalues,
while the determinant was the product of the eigenvalues,
then this question can be done even more quickly:

$ lambda_2 + 2 = op("Trace") M &= 1 + 6 \
  lambda_2 dot 2 = det M &= detmat(1, 1; a, 6) = 6 - a. $
The first equation implies $lambda_2 = 5$; then the second implies $a = -4$.

== Solution to Q3 (plane)

We start by determining the equation of the plane through
$P_1 = (b,0,0)$, $P_2 = (0,b,0)$ and $P_3 = (0,0,b)$.
You might be able to guess the equation just by looking,
but if you didn't see it, you could also use the cross product
$ (P_2 - P_1) times (P_3 - P_1)
  &= vec(-b,b,0) times vec(-b,0,b)
  = vec(b^2, b^2, b^2) = b^2 vec(1,1,1). $
Therefore, $vec(1,1,1)$ is a normal vector to the plane,
so the plane's equation should be $x+y+z = "const"$.
The plane should pass through $(b,0,0)$ and so on; hence the plane's equation is
$ x + y + z = b. $

In order for this to also pass through $(2,3,6)$,
we need $b = 2 + 3 + 6 = #boxed[$ 11 $]$.

It remains to calculate the distance from $(0,0,0)$ to the plane $x+y+z=11$.
If you use the point-to-plane formula for this, you get
$ abs(1+2+3-11) / (sqrt(1^2+1^2+1^2)) = #boxed[$ 5/sqrt(3) $]. $

If you didn't remember this formula, you should instead
compute the length of the projection of the vector
$bf(v) = (1,2,3) - (2,3,6) = angle.l -1,-1,-3 angle.r$
(you can replace $(2,3,6)$ with any other point on the plane,
like $(0,0,11)$ or similar) along the direction of $bf(n) = angle.l 1,1,1 angle.r$.
Doing this by hand gives
$ (bf(v) dot bf(n)) / (|bf(n)|)
  = (angle.l -1,-1,-3 angle.r dot angle.l 1,1,1 angle.r) / sqrt(3)
  = -5 / sqrt(3) $
like before, although as I've described before,
we're really just repeating the proof of the point-to-plane formula.

== Solution to Q4

Let $f(x,y) = cos(x) + sin(y)$.
The gradient is given by
$ nabla f = angle.l -sin(x), cos(y) angle.r. $
So a critical point occurs at any point for which $sin(x) = cos(y) = 0$.

To identify a saddle point, we compute the double derivatives:
$ f_(x x) &= -cos(x) \
  f_(x y) &= 0 \
  f_(y y) &= -sin(y). $
It's enough to pick any $(x,y)$ for which $f_(x x)$ and $f_(y y)$ have opposite sign.
One example would be $(x,y) = #boxed[$ (0, (3pi)/2) $]$, among many others.

In fact, the complete list of saddle points is given as follows:
whenever $m$ and $n$ are integers where $m+n$ is odd, the point
$ (x,y) = (m pi, (n + 1/2) pi) $
is a saddle point, and these are all saddle points.
The previous example was the special case$m = 0$ and $n = 1$.

== Solution to Q5

== Solution to Q6

== Solution to Q7

== Solution to Q8
