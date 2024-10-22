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
  but I think it's just much easier to read as
  $ int_(y=0)^6 int_(x=0)^1  x y^2 dif x dif y $
  and recommend you use that notation instead.
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
    $ int_0^1 x dif x = [x^2 / 2]_0^1 = 1^2 / 2 - 0^2 / 2 = 1 / 2 . $

    Thus, the result of the inner integral is:
    $ y^2 dot 1 / 2 = y^2 / 2 . $

  2. Now, substitute the result of the inner integral into the outer integral:
    $ int_(y=0)^6 y^2 / 2 dif y &= 1 / 2 int_(y=0)^6 y^2 dif y  \
    &= 1/2 int_0^6 y^2 dif y = 1/2 [y^3 / 3]_0^6 = 1/2( 6^3 / 3 - 0^3 / 3) &= 36. $
]
Easy, right?
The general recipe is the same.

#recipe(title: [Recipe for integrating over a rectangle])[
  To integrate something of the form $int (int dif y) dif x$:
  1. Evaluate the inner integral as in 18.01, treating $x$ as constant.
  2. You should get something only depending on $x$. Integrate it as in 18.01.
]
#remark[
  It's also okay to integrate in the other order,
  and in some cases this will be easier:
  $ int_(x=a)^b int_(y=c)^d f(x,y) dif y dif x
    = int_(y=c)^d int_(x=a)^b f(x,y) dif x dif y. $
  Sometimes this will be easier.

  We'll flesh out this idea next section,
  where we'll show to $x y$-integrate over a much bigger class of regions,
  not necessarily rectangles.
  One general theme is that you have a _choice_ which variable you want
  to be inner and which to be outer, and one choice is often easier than the other..
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
    integral: $ int_0^pi sin (x) dif x . $

    We know that $integral sin (x) dif x = - cos (x)$. Therefore:
    $ int_0^pi sin (x) dif x = [- cos (x)]_0^pi = - cos (pi) + cos (0) . $

    Using $cos (pi) = - 1$ and $cos (0) = 1$, we get:
    $ - (- 1) + 1 = 1 + 1 = 2 . $
]

== [RECIPE] Doing $x y$-integration when you don't have a rectangle

In general, a lot of regions can still be done with $x y$ integration,
even when they aren't rectangles.
Here's how you do it.

#recipe(title: [Recipe for converting to $x y$-integration])[
  1. Draw a picture of the region as best you can.
  2. Write the region as a list of inequalities.#footnote[I don't
    think other sources always write the inequalities the way I do.]
  3. Pick _one_ of $x$ and $y$, and use your picture to describe all the values it could take.
  4. Solve for the _other_ variable in all the inequalities.
]

(Step 2 is not the way that it's presented in Poonen or the actual course,
but I find writing it as inequalities makes it much easier to think about.)

For example, let's take the region in Poonen's example 13.1:
#sample[
  Show both ways of setting up an integral of a function $f(x,y)$ over the region $y-x=2$ and $y=x^2$.
]
#soln[
  Here's a picture of that region:

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

  Now the path diverges.
  Again, you can get two different things depending on which way you want to do slicing.

  / If $x$ is outer:
    First, let's imagine we let $x$ be the outer integral.
    Then from the picture, you can see $-1 <=  x <= 2$.
    If we solve for $y$, we find its region is
    $ x^2 <= y <= x+2. $
    Hence, we get the double integral as
    $ int_(x=-1)^2 int_(y=x^2)^(x+2) f(x,y) dif y dif x. $
    On the other hand, let's imagine we used $y$ first.
    From the picture, we see that $y$ ranges from $0$ all the way up to $4$.
    (So in what follows I'll write $y >= 0$ to make notation better.

  / If $y$ is outer:
    This is gnarly: when you solve for $x$ you get _three_ inequalities:

    - $y <= x^2$ solves to $-sqrt(y) <= x <= sqrt(y)$
    - $y - x <= 2$ solves to $y-2 <= x$.

    If you know how the max function works, you could even write this as
    $ max(y-2, -sqrt(y)) <= x <= sqrt(y). $
    The point is the lower endpoint for $x$ behaves differently with cases.
    For $y <= 1$, the bound of $-sqrt(y)$ triumphs over the bound of $y-2$.
    But for $y >= 1$, the bound of $y-2$ is the more informative inequality.
    So if we wanted to write this as a double integral, we would actually have to split into two:
    $ int_(y=0)^1 int_(x=-sqrt(y))^(sqrt(y)) f(x,y) dif x dif y
      + int_(y=1)^4 int_(x=y-2)^(sqrt(y)) f(x,y) dif x dif y. $

  So if you were actually given a concrete function, you probably want to do the first approach.
]



#pagebreak()

= Change of variables

#pagebreak()

= Parametrized integrals


#sample[
  Compute the line integral of the vector field
  $bf(F) (x , y) = vec(2 x , 3 y)$ along the curve $C$
  which is the upper half of the circle $x^2 + y^2 = 1$, oriented counterclockwise.
]

#soln[
  The line integral of a vector field $bf(F)$ along a curve $C$
  is given by: $ int_C bf(F)(bf(r)(t)) dot bf(r)'(t) dif t $
  Parametrize the curve $C$ as $bf(r) (t) = (cos t , sin t)$, where $t in [0 , pi]$.

  First we compute $bf(r)'(t)$ which is $ bf(r)'(t) dif t = (- sin t, cos t) $.
  Meanwhile, the values of $bf(F)$ along the curve rae
  $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t , 3 sin t) $

  Hence, the dot product being integrated is
  $ bf(F) (bf(r) (t)) dot bf(r)'(t)
    &= (2 cos t) (- sin t) + (3 sin t) (cos t) \
    &= - 2 cos t sin t + 3 sin t cos t = cos t sin t $

  Integrate with respect to $t$ from $0$ to $pi$:
  $ int_0^pi cos t sin t dif t $

  Using the identity $cos t sin t = 1 / 2 sin (2 t)$, we rewrite the integral:
  $ int_0^pi cos t sin t dif t &= 1 / 2 int_0^pi sin (2 t) dif t \
    &= 1 / 2 [- 1 / 2 cos (2 t)]_0^pi \
    &= 1 / 2 [- 1 / 2 cos (2 pi) + 1 / 2 cos (0)] \
      &= 1 / 2 [- 1 / 2 (1) + 1 / 2 (1)] = 0. #qedhere $
]

#pagebreak()
