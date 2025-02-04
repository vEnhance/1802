#import "@local/evan:1.0.0":*

= Solutions to Part Golf

== Solution to @exer-swapint-fifth

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
