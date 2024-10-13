#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Practice Midterm 2],
  subtitle: [18.02 MT2 Review Session],
  author: "Evan Chen",
  date: [10 October 2024],
)

You have 50 minutes to answer the following five questions.
Like the real exam, I suggest not using any notes/calculators/etc.
Full solutions are posted at #url("https://web.evanchen.cc/1802.html")
under the file `MT2` (not printed to save paper).

= Questions

/ Question 1.: A particle in the $x y$ plane has position given by
  $ bf(r)(t) = angle.l cos(t), cos(t) angle.r. $
  - Compute the speed of the particle at $t = pi/3$.
  - Compute the arc length of the trajectory from $t = 0$ to $t = 2 pi$.

/ Question 2.: Let $k > 0$ be a real number and let $ f(x,y) = x^2 + k y^2. $
  The level curve of $f$ for the value $21$ passes through the point $P = (1,2)$.
  - Compute $k$.
  - Compute the equation of the tangent line to this level curve at the point $P$.

/ Question 3.: Let $f(x,y) = x^(5y)$ for $x,y > 0$.
  Use linear approximation to estimate $f(1.001, 3.001)$ from the point $(1,1)$.

/ Question 4.:
  Determine all the saddle points of the function
  $ f(x,y) = cos(pi x) + y^4/4 - y^3/3 - y^2. $

/ Question 5.:
  Use Lagrange multipliers to compute the minimum and maximum possible value of $x + 2 y + 2 z$
  over real numbers $x$, $y$, $z$ satisfying $x^2 + y^2 + z^2 = 1$.
