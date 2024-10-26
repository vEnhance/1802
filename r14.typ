#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 14],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [26 October 2024],
)

#quote(attribution: [])[]


This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= From last time

If you missed Wednesday's recitation, some advice:

- For this class, take $dif A$ as a shorthand for $dif x dif y$. (See LAMV 25.1.)
- The result $dif x dif y = r dif r dif theta$ is a special case of _change of variables_,
  covered in tomorrow's lecture and recitation on Wednesday (led by Lichen).
- Write regions as inequalities, e.g. if you have the region cut out by $y=x^2$ and $y=x+2$,
  I would prefer to write $y >= x^2$ (above parabola) and $y <= x+2$ (below line).
- I suggest writing the variables into the integration signs, e.g.,
  rather than $int_0^2 int_(y/2)^1 e^(-x^2) dif x dif y$
  I think this is clearer as $int_(y=0)^2 int_(x=y/2)^1 e^(-x^2) dif x dif y$.

= Polar coordinates is a special case of change of variables (tomorrow)

The map
$ bf(T)_"polar" (r, theta) = (r cos theta, r sin theta). $
is so common you may as well memorize its Jacobian:
$ J_(bf(T)) &= mat(
    partial / (partial r) cos theta,
    partial / (partial r) sin theta;
    partial / (partial theta) (r cos theta),
    partial / (partial theta) (r sin theta))
  = mat(cos theta, sin theta; -r sin theta, r cos theta). \
  |det J_(bf(T))| &=
    det mat(cos theta, sin theta; -r sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
You should actually just remember the final result of this calculation
so you don't have to work it out again.
Hence $dif x dif y = r dif r dif theta$.

= Recitation questions from official course

/ 1.: Evaluate the iterated integral
  $int_0^2 int_(y \/ 2)^1 e^(- x^2) dif x dif y$.
/ 2.: Evaluate the integral $ iint_D (d A) / (3 + x^2 + y^2) $
  where $D$ is the region such that $x >= 0$, $y >= 0$ and
  $x^2 + y^2 <= 9$.
/ 3.: A shape has a density given by $delta (x , y) = sqrt(x^2 + y^2)$. What
  is the mass of the shape defined by $x^2 + (y - 1)^2 <= 1$?
/ 4.: Evaluate the integral
  $ iint_D frac(d A, sqrt(1 - x^2 - y^2)) $ where $D$ is the
  region such that $x >= 0$ and $x^2 + (y - 1 \/ 2)^2 <= 1 \/ 4$.
