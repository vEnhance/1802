#import "@local/evan:1.0.0":*

= Double integrals

One common theme from 18.02 that you might have noticed in part Foxtrot is that,
unlike in 18.01 where you were hyper-focused on the function $f$ you were optimizing,
in 18.02 the _region_ you're working with deserves a lot of attention.
This will be true for the material in this section too ---
you ought to paying most attention to the region
before you even look at the function $f$ that's being integrated.

== [RECIPE] Integrating over rectangles

If you want to integrate over a rectangle, this is super easy.
It's basically like partial derivatives, where you pretend some variables are constant
and only one variable is going to vary at once.
It's easier to see an example before the recipe.

#warning(title: [Warning: Some sources might not write the variables in the $int$'s for you])[
  Rather than writing just $int_a^b f(t) dif t$,
  I will usually prefer to write $int_(t=a)^b f(t) dif t$,
  to make it easier to see which variable is integrated over.
  Not all sources will be nice enough to do this and will actually make you
  read the $dif x$ and $dif y$ backwards; e.g. if you see
  $ int_0^6 int_0^1  x y^2 dif x dif y $
  then this actually means
  $ int_0^6 (int_0^1  x y^2 dif x) dif y $
  so $0 <= x <= 1$ and $0 <= y <= 6$.
  For me reading backwards like this is annoying as hell,
  so I think it's just much easier to write
  $ int_(y=0)^6 int_(x=0)^1  x y^2 dif x dif y $
  and I recommend you use that notation instead.
  The advantage is that then you pretty much don't have to look at the
  $dif x dif y$ at the far right anymore;
  the information you need is all in one place at the far left.
]

#sample[
  Integrate $int_(y=0)^6 int_(x=0)^1  x y^2 dif x dif y. $
]
#soln[
  1. The first step is to compute the inner integral with respect to $x$,
    treating $y$ as a constant.

    The inner integral is: $ int_(x=0)^1 x y^2 dif x . $

    Since $y^2$ is treated as a constant with respect to $x$, we can factor
    it out of the integral: $ y^2 int_(x=0)^1 x dif x . $

    Now, compute $int_(x=0)^1 x dif x$:
    $ int_(x=0)^1 x dif x = [x^2 / 2]_0^1 = 1^2 / 2 - 0^2 / 2 = 1 / 2 . $

    Thus, the result of the inner integral is:
    $ y^2 dot 1 / 2 = y^2 / 2 . $

  2. Now, substitute the result of the inner integral into the outer integral:
    $ int_(y=0)^6 y^2 / 2 dif y &= 1 / 2 int_(y=0)^6 y^2 dif y  \
    &= 1/2 int_(y=0)^6 y^2 dif y = 1/2 [y^3 / 3]_0^6 = 1/2( 6^3 / 3 - 0^3 / 3) &= 36. $
]
Easy, right?
The general recipe is the same.

#recipe(title: [Recipe for integrating over a rectangle])[
  To integrate something of the form $int (int dif y) dif x$:
  1. Evaluate the inner integral as in 18.01, treating $x$ as constant.
    This should give you some expression in $x$ with no $y$'s left.
  2. Replace the inner integral with the result from the previous step
    to get an 18.01 integral with only $x$ in it. Integrate that.
]

Here's another example.
#sample[
  Evaluate the double integral:
  $ int_(x=0)^pi int_(y=0)^1 x cos (x y) dif y dif x . $
]
#soln[
  1. The first step is to compute the inner integral with respect to $y$,
    treating $x$ as a constant.
    The inner integral is: $ int_(y=0)^1 x cos (x y) dif y . $

    Since $x$ is treated as a constant with respect to $y$, we can factor
    $x$ out of the integral: $ x int_(y=0)^1 cos (x y) dif y . $

    Now, we compute $int_(y=0)^1 cos (x y) dif y$.
    $ int_(y=0)^1 cos (x y) dif u = [1/x sin (x y)]_0^1 = sin(x) / x. $

    Thus, the result of the inner integral is:
    $ x dot sin(x) / x = sin (x) . $

  2. Now, substitute the result of the inner integral into the outer
    integral: $ int_(x=0)^pi sin (x) dif x . $

    We know that $integral sin (x) dif x = - cos (x)$. Therefore:
    $ int_(x=0)^pi sin (x) dif x = [- cos (x)]_0^pi = - cos (pi) + cos (0) . $

    Using $cos (pi) = - 1$ and $cos (0) = 1$, we get:
    $ - (- 1) + 1 = 1 + 1 = 2 . $
]

== [RECIPE] Doing $x y$-integration without a rectangle <sec-convert-x-y-integration>

In general, a lot of 2-D regions $cal(R)$ can still be done with $x y$ integration,
even when they aren't rectangles.
In that case, the integral is notated
$ iint_(cal(R)) f(x,y) dif x dif y := "integral of " f " over " cal(R) $
for whatever function $f$ you're integrating.
If the region is given by a few inequalities you can also write the region directly in,
i.e. $iint_(x^2+y^2<=1) f(x,y) dif x dif y$ would mean the integral of $f$
over the unit disk.

Here's how you do it.
#remark[
  A lot of other sources might write this as
  $iint_(cal(R)) f(x,y) dif A$ instead, which is shorter;
  it's understood that the area element $dif A$ is shorthand for $dif x dif y$.

  However, when you're starting off I will still explicitly write $dif x dif y$,
  because I don't want to hide the integration variables --- training wheels, I guess.
  That said, if you know what you're doing and want to write $dif A$ to save time, go for it!

  We'll talk more about the weirder $dif$ symbols later.
]

#recipe(title: [Recipe for converting to $x y$-integration])[
  1. Draw a picture of the region as best you can.
  2. Write the region as a list of inequalities.#footnote[I don't
    think other sources always write the inequalities the way I do.
    But I think this will help you a lot with making sure bounds go the right way.]
  3. Pick _one_ of $x$ and $y$, and use your picture to describe all the values it could take.
  4. Solve for the _other_ variable in all the inequalities.
]

#remark(title: [Remark: This recipe works fine for rectangles, too!])[
  You can do this recipe even with a rectangle.
  If you do, what the recipe tells you that for a rectangle you can integrate in either order:
  given the rectangle of points $(x,y)$ with $a <= x <= b$ and $c < y <= d$, we have
  $ int_(x=a)^b int_(y=c)^d f(x,y) dif y dif x
    = int_(y=c)^d int_(x=a)^b f(x,y) dif x dif y. $
  Sometimes this will be easier.
  One shape of exam question will to be choose $f$ such that the left-hand side
  is annoying to calculate directly but the right-hand side is easy to calculate,
  and ask for the left-hand side.
  So this is meant to test your ability to recognize when the other order is better
]

For example, let's take the region in Poonen's example 13.1:
#sample[
  Show both ways of setting up an integral of a function $f(x,y)$
  over the region bounded by $y-x=2$ and $y=x^2$.
]

#figure(
  image("figures/double-pararegion.png", width: auto),
  caption: [The region between $y=x^2$ and $y-x=2$.],
) <fig-pararegion>

#soln[
  See @fig-pararegion.
  There are two intersection points that it's pretty clear we'll want to know,
  so we can solve for those intersection points by solving the system and add them to our picture:
  $ cases(y-x=2, y=x^2) &==> x+2 = x^2 ==> x = -1 " or " x = 2 \
    &==> (x,y) = (-1,1) " or " (x,y) = (2,4). $
  I'll also mark $(0,0)$, the bottom of the parabola.

  So we want the part of the plane that lies _above_ the parabola $y=x^2$
  but _below_ the line $y-x=2$.
  So I think you'll find things easier to think about if you consider the region
  as the system of inequalities
  $ y >= x^2 \
    y - x &<= 2. $

  Now there are two ways to do the slicing, depending on which of $x$ and $y$ you want outside.

  / If $x$ is outer:
    First, let's imagine we let $x$ be the outer integral.
    Then from the picture, you can see $-1 <=  x <= 2$.
    If we solve for $y$, we find its region is
    $ x^2 <= y <= x+2. $
    See @fig-pararegion-vert.

    #figure(
      image("figures/double-para-vert.png", width: auto),
      caption: [Dissecting @fig-pararegion vertically, which is pretty nice.
      There's a single top lid (blue) and a bottom lip (purple)
      so that for each given $x$ the slice of $y$ (drawn in green) is easy to describe.],
    ) <fig-pararegion-vert>

    Hence, we get the double integral as
    $ int_(x=-1)^2 int_(y=x^2)^(x+2) f(x,y) dif y dif x. $

  / If $y$ is outer:
    On the other hand, let's imagine we used $y$ first.
    From the picture, we see that $y$ ranges from $0$ all the way up to $4$.
    (So in what follows I'll write $y >= 0$ to make notation better.)

    But $x$ is gnarly. The issue is that when you solve for $x$ you get _three_ inequalities:

    - $y <= x^2$ solves to $-sqrt(y) <= x <= sqrt(y)$
    - $y - x <= 2$ solves to $y-2 <= x$.

    See @fig-pararegion-horiz.

    #figure(
      image("figures/double-para-horiz.png", width: auto),
      caption: [Dissecting @fig-pararegion horizontally, which is less nice: there are cases.
      Above the line $y=1$, you have a blue wall to the left and a curved arc to the right.
      But below $y=1$, you instead have a red arc of the parabola to the left,
      and a blue arc of the parabola to the right.],
    ) <fig-pararegion-horiz>


    If you know how the max function works, you could even write this as
    $ max(y-2, -sqrt(y)) <= x <= sqrt(y). $
    The main issue is that the lower endpoint for $x$ behaves differently with cases.
    For $y <= 1$, the bound of $-sqrt(y)$ triumphs over the bound of $y-2$.
    But for $y >= 1$, the bound of $y-2$ is the more informative inequality.
    So if we wanted to write this as a double integral, we would actually have to split into two:
    $ int_(y=0)^1 int_(x=-sqrt(y))^(sqrt(y)) f(x,y) dif x dif y
      + int_(y=1)^4 int_(x=y-2)^(sqrt(y)) f(x,y) dif x dif y. $
]

== [TEXT] Example with a concrete function $f$

In the previous example we showed how one would integrate a random function $f$
over the region between the line $y-x=2$ and the parabola $y=x^2$.
Again, this process is only based on the region --- it doesn't depend on $f$.

To flesh things out, let's pick an example function $ f(x,y) = 2x+4y $
as Poonen did, and show how we would find the integral.

#sample[
  Consider the region $cal(R)$ we just described,
  the set of points between bounded between $y-x=2$ and $y=x^2$.
  Integrate $iint_(cal(R)) (2x+4y) dif x dif y$ over this region.
]
#soln[
  As we saw, there are two different ways to set it up.
  We'll do the one that's nice (and show the worse one afterwards for comparison),
  where we have $x$ on the outside.

  We are given the integral
  $ int_(x = - 1)^2 int_(y = x^2)^(x + 2) (2 x + 4 y) dif y dif x. $

  1. The first step is to compute the inner integral with respect to $y$,
    treating $x$ as a constant.

    The inner integral is:
    $ int_(y = x^2)^(x + 2) (2 x + 4 y) dif y . $

    We can split this integral into two parts:
    $ int_(y = x^2)^(x + 2) 2 x dif y + int_(y = x^2)^(x + 2) 4 y dif y . $

    - The first term is:
      $ 2 x int_(y = x^2)^(x + 2) 1 dif y = 2 x [y]_(y = x^2)^(y = x + 2) = 2 x ((x + 2) - x^2). $

    - The second term is:
      $ 4 int_(y = x^2)^(x + 2) y dif y = 4 [y^2 / 2]_(y = x^2)^(y = x + 2) = 4 ((x + 2)^2 / 2 - (x^2)^2 / 2)  = 2(x^2 + 4x + 4 - x^4). $
    Thus, the inner integral is:
    $ 2 x (x + 2 - x^2) + 2 (x^2 + 4 x + 4 - x^4) = - 2 x^4 - 2 x^3 + 4 x^2 + 12 x + 8 . $

  2. Now, we compute the outer integral:
    $ & int_(x = - 1)^2 (- 2 x^4 - 2 x^3 + 4 x^2 + 12 x + 8) dif x \
      &= lr([-2 x^5 / 5 - 2 dot x^4/4 + 4 x^3/3 + 12 dot x^2/2 + 8x])_(x=-1)^2. $
    This is a lot of arithmetic, sorry.
    One way is to work term by term:
    $
    -2 [x^5 / 5]_(x = - 1)^(x = 2) &= - 2 (32 / 5 - (- 1)^5 / 5) = - 2 dot 33 / 5 = - 66 / 5 \
    -2 [x^4 / 4]_(x = - 1)^(x = 2) &= - 2 (16 / 4 - 1 / 4) = - 2 dot 15 / 4 = - 15 / 2 \
    4 [x^3 / 3]_(x = - 1)^(x = 2) &= 4 (8 / 3 - (- 1)^3 / 3) = 4 dot 9 / 3 = 12 \
    12 [x^2 / 2]_(x = - 1)^(x = 2) &= 12 dot 3 / 2 = 18 \
    8 dot (2 - (- 1)) &= 8 dot 3 = 24.
    $
    Add these to get the answer: $ -66/5 -15/2 + 12 + 18 + 24 = 333/10. $
]

== [SIDENOTE] What it looks like if you integrate the hard way

In the previous sample question, we picked $x$ to be the outer integral
so that we didn't have to do cases or deal with square roots.
This was pretty clearly a good choice.

For contrast, I'll show you what happens if you have $y$ in the outer integral instead ---
just to make a point that things can get ugly.
(You can read it if you want the practice with iterated integrals,
or skip it if you believe me.)
To reiterate, we will directly calculate

$ int_(y=0)^1 int_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y
  + int_(y=1)^4 int_(x=y-2)^(sqrt(y)) (2x+4y) dif x dif y. $

- We calculate the first hunk $ int_(y=0)^1 int_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y. $

  1. The first step is to compute the inner integral with respect to $x$,
    treating $y$ as a constant.
    The inner integral is:
    $ int_(x = - sqrt(y))^(sqrt(y)) (2 x + 4 y) dif x . $

    We can split this into two integrals:
    $ int_(x = - sqrt(y))^(sqrt(y)) 2 x dif x + int_(x = - sqrt(y))^(sqrt(y)) 4 y dif x . $

    - The first term is:
    $ 2 int_(x = - sqrt(y))^(sqrt(y)) x dif x = 2 [x^2 / 2]_(x = - sqrt(y))^(x = sqrt(y)) = 2 dot ((sqrt(y))^2 / 2 - (- sqrt(y))^2 / 2) . $

    - The second term is:
    $ 4 y int_(x = - sqrt(y))^(sqrt(y)) 1 dif x = 4 y [x]_(x = - sqrt(y))^(x = sqrt(y)) = 4 y (sqrt(y) - (- sqrt(y))) = 4 y dot 2 sqrt(y) = 8 y^(3 / 2) . $

    Thus, the inner integral is: $ 0 + 8 y^(3 / 2) = 8 y^(3 / 2) . $

  2. Now, we compute the outer integral:
    $ int_(y = 0)^1 8 y^(3 \/ 2) dif y . $
    We use the power rule for integration:
    $ integral y^(3 \/ 2) dif y = y^(5 \/ 2) / 5 / 2 = 2 / 5 y^(5 \/ 2) . $

    Thus, the outer integral becomes:
    $ 8 int_(y = 0)^1 y^(3 / 2) dif y = 8 dot 2 / 5 [y^(5 / 2)]_(y = 0)^(y = 1) = 8 dot 2 / 5 dot (1^(5 / 2) - 0^(5 / 2)) = 8 dot 2 / 5 = 16/5 . $

  Hence the first hunk is $ int_(y=0)^1 int_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y = 16/5 = 3.2. $

- We calculate the second hunk $ int_(y=0)^1 int_(x=y-2)^(sqrt(y)) (2x+4y) dif x dif y. $
  1. The first step is to compute the inner integral with respect to $x$,
    treating $y$ as a constant.
    The inner integral is:
    $ int_(x = y - 2)^(sqrt(y)) (2 x + 4 y) dif x . $

    We can split this into two integrals:
    $ int_(x = y - 2)^(sqrt(y)) 2 x dif x + int_(x = y - 2)^(sqrt(y)) 4 y dif x . $

    - The first term is:
      $ int_(x = y - 2)^(sqrt(y)) 2 x dif x = 2 [x^2 / 2]_(x = y - 2)^(x = sqrt(y)) = ((sqrt(y))^2 - (y - 2)^2) . $
      Simplifying:
      $ (y - (y^2 - 4 y + 4)) = y - (y^2 - 4 y + 4) = y - y^2 + 4 y - 4 = - y^2 + 5 y - 4 . $

    - The second term is:
      $ 4 y int_(x = y - 2)^(sqrt(y)) 1 dif x = 4 y (sqrt(y) - (y - 2)) = 4 y (sqrt(y) - y + 2) = 4 y (sqrt(y) - y + 2) . $
      Thus, the inner integral is:
      $ (- y^2 + 5 y - 4) + 4 y (sqrt(y) - y + 2) = - y^2 + 5 y - 4 + 4 y sqrt(y) - 4 y^2 + 8 y . $

    Simplifying we get the inner integral to be $ - 5 y^2 + 13 y + 4 y sqrt(y) - 4 . $

  2. Now, we compute the outer integral:
    $ int_(y = 1)^4 (- 5 y^2 + 13 y + 4 y sqrt(y) - 4) dif y . $

    To keep things organized, we integrate each term individually:
    $
    int_(y = 1)^4 - 5 y^2 dif y &= - 5 [y^3 / 3]_(y = 1)^(y = 4) = - 5 dot (64 / 3 - 1 / 3) = - 5 dot 63 / 3 = - 105 \
    int_(y = 1)^4 13 y dif y &= 13 [y^2 / 2]_(y = 1)^(y = 4) = 13 dot (16 / 2 - 1 / 2) = 13 dot 15 / 2 = 97.5 \
    int_(y = 1)^4 4 y sqrt(y) dif y &= 4 int_(y = 1)^4 y^(3 \/ 2) dif y = 4 dot [2 / 5 y^(5 \/ 2)]_(y = 1)^(y = 4) = 4 dot 2 / 5 (32 - 1) = 248 / 5 = 49.6 \
    int_(y = 1)^4 - 4 dif y &= - 4 [y]_(y = 1)^(y = 4) = - 4 (4 - 1) = - 12.
    $

    Now, add up the integrals: $ - 105 + 97.5 + 49.6 - 12 = 30.1 . $

- The final answer is $3.2 + 30.1 = 33.3$ as expected.

So we got the same answer, no surprise, but it took a lot more work to get it.

== [TEXT] A few physical interpretations of integrals

Depending on what function $f$ is chosen, the integral may have some physical meaning.
We give a few examples here:

=== Area

If you choose $f = 1$ you get area.

#recipe(title: [Recipe for area])[
  To find the area of a region $cal(R)$, use
  $ op("Area")(cal(R)) = iint_(cal(R)) 1 dif x dif y. $
]

#sample[
  Consider the region $cal(R)$ we just described,
  the set of points between bounded between $y-x=2$ and $y=x^2$.
  Compute its area.
]
#soln[
  We'll write this as
  $ int_(x = - 1)^2 int_(y = x^2)^(x + 2) 1 dif y dif x. $
  The inner integral is easy $int_(y=x^2)^(x+2) dif y = (x+2)-x^2$.
  So the answer is
  $ int_(x = - 1)^2 (x+2-x^2) dif x =
    lr([x^2/2 + 2x - x^3/3])_(x=-1)^(x=2)
    = (2+4-8/3) - (1/2-2+1/3) = 9/2. #qedhere $
]

=== Mass and center of mass

If you imagine your region $cal(R)$ as a blob of some substance (concrete, wood, water, etc.),
then you could also imagine it has a _density_ at each point in the region
(say, in grams per square meter).
In 18.02 we usually denote the density by $rho$,
which is a function taking each point $P$ in the region $cal(R)$ and outputting its density.

In that case, the total mass of $cal(R)$ is the integral of the densities:
$ op("mass")(cal(R)) = iint_(cal(R)) rho(x,y) dif x dif y. $
Given a region you can also consider the _center of mass_.
The idea/definition is that the $x$-coordinate of the center of mass should be
the weighted average of the $x$-coordinates of the points in the region,
and is usually denoted $dash(x)$:
$ dash(x) := x"-coord of the center of mass" = 1/(op("mass")(cal(R))) iint_(cal(R)) x dot rho(x,y) dif x dif y. $
And the same for the others.
Let's repeat this in recipe form.

#recipe(title: [Recipe for total mass and center of mass])[
  Suppose $cal(R)$ is a region and $rho$ is a density function for the region.

  1. The total mass is given by $op("mass")(cal(R)) = iint_(cal(R)) rho(x,y) dif x dif y. $
  2. The center of mass is the point $(dash(x), dash(y))$ defined by
  $ (dash(x), dash(y)) := lr(( (iint_(cal(R)) x dot rho(x,y) dif x dif y) / (op("mass")(cal(R))),
    (iint_(cal(R)) y dot rho(x,y) dif x dif y) / (op("mass")(cal(R))))). $
]

(It took considerable self-restraint to not title the recipe "Mass Tech".)

#typesig[
  If $cal(R)$ is a region in $RR^2$,
  - Then a density function $rho : cal(R) -> RR_(>= 0)$
    should take on nonnegative values.
    (For physicists: in SI units, you might imagine it as grams per square meter.)
  - The mass is a nonnegative real number (grams).
  - The center of mass is also a _point_ inside $cal(R)$. (Draw this as a dot, not an arrow.)
]

#todo[Write some example]

#remark[
  Unsurprisingly if $rho = 1$ is constant (imagine 1 gram per square meter),
  then the mass of the region $cal(R)$ is just $iint_(cal(R)) dif x dif y$, i.e. the area.
  (So a region whose area is $17$ square meters and where the density is
  1 gram per square meter in the whole substance should be $17$ grams.)
]


== [SIDENOTE] What's the analogy to "area under the curve" from 18.01?

In 18.01, you were told that the integral $int_(x=a)^b f(x) dif x$
denotes the area under the curve $y = f(x)$ from $x = a$ to $x = b$.

In 18.02, if you have $iint_(cal(R)) f(x,y) dif x dif y$,
and you want to interpret it analogously,
what you would do is look at the surface $z = f(x,y)$ in an $x y z$-plane,
where you imagine the $x y$-plane and the region $cal(R)$ at the bottom, and $z$ being a height.
Then the double integral analogously calculates the volume underneath the surface.

However, we won't actually use this interpretation much in 18.02.
As I said before, in 18.02 we usually prefer to draw pictures
where all the axis variables are treated with equal respect.
(Whereas the 18.01 picture I just mentioned uses $x$ as input and $y$ as output;
the two axes don't play the same role.)
So picturing the double integral with things like mass or center of mass
is more in line with the 18.02 spirit, even though there is no 18.01 analog.

== [RECIPE] Swapping the order of integration

If you're an instructor teaching multivariable calculus,
one trope for generating exam questions
is to take some region $cal(R)$ that can be sliced both horizontally and vertically,
but for which one way is much easier to integrate than the other.
For the problem statement, you give the student the integral written in the "bad" order.
The solution is to convert _back_ into a region $cal(R)$,
and then use this to recover the "good" order.
Put in recipe form:
#recipe(title: [Recipe for swapping the order of integration])[
  If you are given $int_(x=?)^? int_(y=?)^? f(x,y) dif y dif x$
  and you wish to switch the order of integration the other way:

  1. Convert the limits of integration back into inequality/region format,
    getting some region $cal(R)$.
  2. Re-apply the recipe from @sec-convert-x-y-integration
    using the other variable as the outer one now.
]

#sample[
  Evaluate the double integral:
  $ int_(x = 0)^2 int_(y = x/2)^(1) e^(y^2) dif y dif x . $
]

#soln[
  To evaluate this integral, note that integrating $e^(y^2)$ directly with
  respect to $y$ is not feasible using standard methods from 18.01.
  Thus, we need to swap the order of integration.

  First convert this back into region format:
  $ cal(R) = cases(0 <= x <= 2, x/2 <= y <= 1). $
  We see that $y$ goes in the range $0 <= y <= 1$.
  Solving for $x$ in terms of $y$ gives three conditions:
  in addition to $0 <= x <= 2$ we need $x <= 2y$.
  Since $y <= 1$, we can ignore the condition $x <= 2$,
  and the region can be rewritten to
  $ cal(R) = cases(0 <= y <= 1, 0 <= x <= 2 y). $
  Turning this _back_ into a double integral gives
  $ int_(y=0)^1 int_(x=0)^(2y) e^(y^2) dif y dif x. $

  #todo[figure]

  The inner integral is with respect to $x$,
  but the integrand $e^(y^2)$ is independent of $x$.
  Therefore, the inner integral becomes:
  $ int_(x = 0)^(2 y) e^(y^2) dif x = 2 y e^(y^2) . $
  Thus, it remains to calculate
  $ int_(y=0)^1 2y e^(y^2) dif y dif x. $

  And now things are different: $2 y e^(y^2)$ _does_ have a valid anti-derivative.
  If you use the 18.01 method or even just are good at guessing,
  you can find the indefinite 18.01 integral
  $ int 2 y e^(y^2) dif y = e^(y^2) + C. $
  So the final answer to the problem is
  $ int_(y=0)^1 2y e^(y^2) dif y dif x = lr([e^(y^2)])_(y=0)^(y=1) = e^1 - 1. #qedhere $
]

#sample[
  Let $ k = root(5, 37/3 pi) approx 2.078. $
  Evaluate the double integral:
  $ int_(y = 0)^(k^2) int_(x = sqrt(y))^k y sin (x^5) dif x dif y $
]
#soln[
  Integrating $sin(x^5)$ is not reasonable, so we swap the order of integration and pray.
  The region being integrated is
  $ cal(R) = cases(0 <= y <= k^2, sqrt(y) <= x <= k). $
  The values of $x$ range all the way from $0$ to $k$.
  Solving for $y$, we see that we have three constraints,
  $0 <= y$, $y <= x^2$ and $y <= k^2$.
  But since $x <= k$, the condition $y <= k^2$ is redundant.
  The region can be rewritten as simply
  $ cal(R) = cases(0 <= x <= k, 0 <= y <= x^2). $

  Convert back into a double integral:
  $ int_(x = 0)^k int_(y = 0)^(x^2) y sin (x^5) dif y dif x. $

  We now compute the inner integral with respect to $y$:
  $ int_(y = 0)^(x^2) y sin (x^5) dif y . $

  Since $sin (x^5)$ is independent of $y$, we can factor it out of the integral:
  $ sin (x^5) int_(y = 0)^(x^2) y dif y = sin (x^5) [y^2 / 2]_(y = 0)^(y = x^2) . $
  Substituting the limits of integration:
  $ sin (x^5) dot x^4 / 2 . $

  Now substitute this result into the outer integral:
  $ int_(x = 0)^k x^4 / 2 sin (x^5) dif x . $

  Let’s perform the 18.01 $u$-substitution $u = x^5$,
  so $dif u = 5 x^4 dif x$, or $dif x = (dif u) / (5 x^4)$.
  The limits of integration change as follows:
  - When $x = 0$, $u = 0$.
  - When $x = k$, $u = 37/3 pi$.
  Thus, knowing that $int sin(u) = -cos(u) + C$, the integral becomes:
  $ 1 / 2 int_(u = 0)^(37/3 pi) sin(u) / 5 dif u
    &= 1 / 10 int_(u = 0)^(37/3 pi) sin(u) dif u \
    &= 1 / 10 (- cos (37/3 pi) + cos (0)) . $
  Using $cos (37/3 pi) = 1 / 2$ and $cos (0) = 1$, we get:
  $ 1 / 10 (- 1 / 2 + 1) = 1 / 10 dot 1 / 2 = 1 / 20 . #qedhere $
]

== [EXER] Exercises

#exer[
  Let $cal(R)$ be the region between the curves $y = sqrt(x)$ and $y = x^3$.
  Compute $iint_(cal(R)) x^(100) y^(200) dif x dif y$ in both ways.
]

#exer[
  Let $cal(R)$ be the region between the curves $y = sqrt(x)$ and $y = x^2$.
  Assume $cal(R)$ has constant density.
  Calculate its center of mass.
]
#exer[
  Evaluate the double integral:
  $ int_(y=0)^1 int_(x=y)^(root(5, y)) (x y^2) / (1-x^(12)) dif x dif y. $
] <exer-swapint-fifth>


#exer[
  Evaluate the double integral:
  $ int_(x = 0)^(pi/4) int_(y = x)^(min(pi/4, sqrt(x))) (x sin (y)) / (y^4 - y^2) dif y dif x. $
] <exer-swapint-min>
