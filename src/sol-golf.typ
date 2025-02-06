#import "@local/evan:1.0.0":*

= Solutions to Part Golf

== Solution to @exer-slicing-standard (practice with slicing)

#recall-thm(<exer-slicing-standard>)

Let $cal(R)$ be the region bounded by the curves $y = sqrt(x)$ and $y = x^3$.
We wish to compute the integral
$ I = iint_(cal(R)) x^(100) y^(200) dif x dif y . $

To determine the limits of integration,
we find the intersection points by solving $sqrt(x) = x^3$
Squaring both sides gives $x = x^6 ==> x(x^5-1) = 0$, so $x=0$ or $x=1$.
That is, the intersection points are $(0,0)$ and $(1,1)$.
A sketch of the region is shown in @fig-sol-golf-double-sol1.

#figure(
  image("figures/sol-golf-double-sol1.svg", width: auto),
  caption: [The region between $y = sqrt(x)$ and $y = x^3$.],
) <fig-sol-golf-double-sol1>

From the figure, we can describe the region $cal(R)$ with the inequalities
$ 0 <= x^3 <= y <= sqrt(x) <= 1. $

#h3[Integrating with $x$ inside and $y$ outside]

The values of $y$ go from $0$ to $1$.
For each fixed $y$, the values of $x$ range from
$ y^2 <= x <= y^(1\/3) $
so the integral is:
$ I = int_(y = 0)^1 int_(x = y^2)^(y^(1 \/ 3)) x^(100) y^(200) dif x dif y . $
Evaluating the inner integral:
$ int_(x = y^2)^(y^(1 \/ 3)) x^100 dif x = [x^101 / 101]_(x = y^2)^(y^(1\/3))
  = y^(101 \/ 3) / 101 - y^202 / 101 . $
Now, integrating over $y$:
$ I &= int_(y = 0)^1 (y^(101 \/ 3) / 101 - y^202 / 101) y^200 dif y \
    &= 1 / 101 (int_(y=0)^1 y^(701\/3) dif y - int_(y=0)^1 y^(402) dif y) \
    &= 1 / 101 (3/704 - 1/403) = #boxed[$ 5 / 283712 $]. $

#h3[Integrating with $y$ inside and $x$ outside]

The values of $x$ go from $0$ to $1$.
For a fixed $x$, the values of $y$ range from
$ x^3 <= y <= x^(1\/2) $
so the integral is
$ I = int_(x = 0)^1 int_(y = x^3)^(x^(1 \/ 2)) x^(100) y^(200) dif y dif x . $

Evaluating the inner integral:
$ int_(y = x^3)^(sqrt(x)) y^200 dif y = [y^201 / 201]_(y = x^3)^(y = sqrt(x))
  = x^(201\/2) / 201 - x^603 / 201 . $
Now, integrating over $x$:
$ I &= int_(x = 0)^1 x^100 (x^(201\/2) / 201 - x^603 / 201) dif x \
  &= 1/201 (int_(x=0)^1 x^(401\2) dif x - int_(x=0)^1 x^(703) dif x) \
  &= 1/201 (2/403 - 1/704) = #boxed[$ 5 / 283712 $]. $

== Solution to @exer-slicing-mass (center of mass of a region)

#recall-thm(<exer-slicing-mass>)

The region is really similar to the one in the preceding exercise, and can be described as
$ 0 <= x^2 <= y <= sqrt(x) <= 1 $
for the same reason, as shown in @fig-sol-golf-double-sol2.
(It's exactly the same as the last exercise except $x^3$ was changed to $x^2$,
so one just replaces all the $3$'s with $2$'s).

#figure(
  image("figures/sol-golf-double-sol2.svg", width: auto),
  caption: [The region between $y=sqrt(x)$ and $y=x^2$.],
) <fig-sol-golf-double-sol2>

First, to compute the area of $cal(R)$, we can write
$ op("Area")(cal(R)) = int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) 1 dif y dif x
  &= int_(x=0)^1 (sqrt(x) - x^2) dif x \
  &= [2/3 x^(3\/2) - 1/3 x^3]_(x=0)^1 = 1/3. $

The $x$-coordinate of the center of mass is therefore given by
$ dash(x) = 1 / (op("Area")(cal(R))) int_(cal(R)) x dif A
  &= 1 / (1\/3) int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) x dif y dif x \
  &= 3 int_(x = 0)^1 x (sqrt(x) - x^2) dif x \
  &= 3 [2/5 x^(5/2) - 1/4 x^4]_(x=0)^1 = 9/20. $

As for the $y$-coordinate, we get instead
$ dash(y) = 1 / (op("Area")(cal(R))) int_(cal(R)) y dif A
  &= 1 / (1\/3) int_(x = 0)^1 int_(y=x^2)^(sqrt(x)) y dif y dif x \
  &= 3 int_(x = 0)^1 [y^2/2]_(y=x^2)^(sqrt(x)) dif x \
  &= 3/2 int_(x = 0)^1 (x-x^4) dif x \
  &= 3/2 [1/2 x^(2) - 1/5 x^5]_(x=0)^1 = 9/20. $

Thus, the center of mass of the region is: $ #boxed[$ (9/20, 9/20) $]. $

== Solution to @exer-swapint-fifth (double integral with 5th root)

#recall-thm(<exer-swapint-fifth>)

Writing as a region, this is
$ cal(R) = cases(0 <= y <= 1, y <= x <= root(5, y)). $
The values of $x$ could range anywhere in $0 <= x <= 1$.
For a fixed $x$, the value $y$ needs to satisfy four conditions: $0 <= y <= 1$
and also $x^5 <= y <= x$.
But in fact $ 0 <= x^5 <= y <= x <= 1 $
so we can compress this to just:
$ cal(R) = cases(0 <= x <= 1, x^5 <= y <= x). $
Thus, the new limits of integration become:
$ int_(x = 0)^1 int_(y = x^5)^x (x y^2) / (1 - x^12) dif y dif x $

We now compute the inner integral with respect to $y$:
$ int_(y = x^5)^x y^2 dif y = [y^3 / 3]_(y = x^5)^(y = x) $
Substituting the limits of integration:
$ 1 / 3 (x^3 - (x^5)^3) = 1 / 3 (x^3 - x^15) $

Now substitute this result into the outer integral:
$ int_(x = 0)^1 (x) / (1 - x^12) dot 1 / 3 (x^3 - x^15) dif x $
Simplifying:

$ 1 / 3 int_(x = 0)^1 (x) / (1 - x^12) (x^3 - x^15) dif x
  &= 1 / 3 int_(x = 0)^1 (x^4 - x^16) / (1 - x^12) dif x \
  &= 1/3 int_(x = 0)^1 x^4 dif x \
  &= 1/3 (1/5 - 0) = 1/15. $
