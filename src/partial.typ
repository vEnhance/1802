#import "@local/evan:1.0.0":*

= Partial derivatives <sec-partial-derivative>

== [TEXT] The point of differentiation is linear approximation

In 18.01, when $f : RR -> RR$, you defined a *derivative* $f'(p)$ at each input $p in RR$,
which you thought of as the *slope* of the *tangent line* at $p$.
Think $f(5.01) approx f(5) + f'(5) dot 0.01$.
This slope roughly tells you, if you move a slight distance away from the input $p$,
this is how fast you expect $f$ to change.
To drill the point home again, in 18.01, we had
$ f(p + epsilon) = f(p) + f'(p) dot epsilon. $
See figure below.

#figure(
  image("figures/partial-slope.svg", width: auto),
  caption: [In 18.01, the slope $f'(p)$ tells you how quickly $f$ changes near $p$.],
)

The 18.01 derivative had type "scalar".
But for a _two-variable_ function, that's not enough.
For concreteness, let's take
$ f(x,y) = x^2+y^2 $
as our example function (for which we have drawn level curves before),
and consider some point $P = (3,4)$, so that $f(3,4) = 25$.

Then, what would a point "close" to $(3,4)$ mean?
The point $(3.01,4)$ is close, but so is $(3,4.01)$.
For that matter, so is $(3.006, 4.008)$ --- that's also a point at distance $0.01$ away!
So having a single number isn't enough to describe the rate of change anymore.

For a two-variable function, we would really want _two_ numbers, in the sense that
we want to fill in the blanks in the equation
$ f(3 + epsilon_x, 4 + epsilon_y) approx 25
  + ("slope in" x"-direction") dot epsilon_x
  + ("slope in" y"-direction") dot epsilon_y. $

#idea[
  For an $n$-variable functions, we have a rate of change in _each_ of the $n$ directions.
  Therefore, *we need $n$ numbers and not just one*.
]

The first blank corresponds to what happens if you imagine $y$ is held in place at $4$,
and we're just changing the $x$-value to $3.01$.
The second blank is similar.
So we need a way to calculate these; the answer to our wish is
what's called a _partial derivative_.

== [TEXT] Computing partial derivatives is actually just 18.01 <text-compute-partial>

The good news about partial derivatives is that *they're actually really easy to calculate*.
You pretty much just need to do what you were taught in 18.01
with one variable changing while pretending the others are constants.

Here's the definition:

#definition[
  Suppose $f(x,y)$ is a two-variable function.
  Then the _partial derivative with respect to $x$_, which we denote either $f_x$
  or $(partial f) / (partial x)$,
  is the result if we differentiate $f$ while treating $x$ as a variable $y$ as a constant.
  The partial derivative $f_y = (partial f) / (partial y)$ is defined the same way.

  Similarly, if $f(x,y,z)$ is a three-variable function,
  we write $f_x = (partial f) / (partial x)$ for the derivative when $y$ and $z$ are fixed.
]

#typesig[
  Each partial derivative has the same type signature as $f$. That is:

  - Given $f : RR^n -> RR$ which accepts *points* in $RR^n$ and outputs *scalars*.
  - Then the partial derivative $(partial f) / (partial x) = f_x$
    also accepts *points* in $RR^n$ and outputs *scalars*.
]

But that's a lot of words.
I think this is actually better explained by example.
In fact you could probably just read the examples and ignore the definition above.

#example(title: [Example: partial derivatives of $f(x,y) = x^3 y^2 + cos(y)$])[
  Let $f(x,y) = x^3 y^2 + cos(y)$.

  Let's compute $f_x$.
  Again, pretend $y$ is a constant, so look at the function
  $ x |-> y^2 dot x^3 + cos(y). $
  If we differentiate with respect to $x$, then $x^3$ becomes $3x^2$,
  and $cos(y)$ goes to $0$ (it doesn't have any $x$ stuff in it).
  So
  $ f_x = y^2 dot 3x^2. $

  Similarly, let's compute $f_y$.
  This time we pretend $x$ is a constant, and look at
  $ y |-> x^3 dot y^2 + cos(y). $
  This time $y^2$ becomes $2y$, and $cos(y)$ has derivative $-sin(y)$. So
  $ f_y = x^3 dot 2y - sin(y). $
]

#example(title: [Example: partial derivatives of $f(x,y,z) = e^(x y z)$])[
  Let $f(x,y,z) = e^(x y z)$ for a three-variable example.
  To compute $f_x$, think of the function
  $ x |-> e^(y z dot x) $
  where we pretend $y$ and $z$ are constants.
  Then the derivative is with respect to $x$ is just $y z e^(y z dot x)$
  (just like how the derivative of $e^(3 x)$ is $3 e^x$). In other words,
  $ f_x (x,y,z) = y z dot e^(x y z). $
  For analogous reasons:
  $
    f_y (x,y,z) &= x z dot e^(x y z) \
    f_z (x,y,z) &= x y dot e^(x y z).
  $
]

#example(title: [Example: partial derivatives of $f(x,y) = x^2 + y^2$ and linear approximation])[
  Let's go back to
  $ f(x,y) = x^2+y^2 $
  which we used in our earlier example as motivation, at the point $P = (3,4)$.

  Let's fill in the numbers for the example $f(x,y) = x^2+y^2$ we chose.
  By now, you should be able to compute that
  $
  f_x (x,y) &= 2x \
  f_y (x,y) &= 2y \
  $

  Now, let's zoom in on just the point $P = (3,4)$.
  We know that
  $
  f(P) = 3^2 + 4^2 = 25 \
  f_x (P) = 2 dot 3 = 6 \
  f_y (P) = 2 dot 4 = 8.
  $
  So our approximation equation can be written as
  #eqn[
    $ (3 + epsilon_x)^2 + (4 + epsilon_y)^2 approx 25 + 6 epsilon_x + 8 epsilon_y. $
    <example-circle-3-4>
  ]
  If you manually expand both sides, you can see this looks true.
  The two sides differ only by $epsilon_x^2$ and $epsilon_y^2$,
  and the intuition is that if $epsilon_x$ and $epsilon_y$ were small numbers,
  then their squares will be negligibly small.

  We'll return to @example-circle-3-4 later when we introduce the gradient.
]

== [RECIPE] Computing partial derivatives <recipe-compute-partial>

You probably can already figure out the recipe from the sections above,
but let's write it here just for completeness.

#recipe(title: [Recipe for calculating partial derivatives])[
  To compute the partial derivative of a function $f(x,y)$ or $f(x,y,z)$
  or $f(x_1, ..., x_n)$ with respect to one of its input variables,

  1. Pretend all the other variables are constants,
    and focus on just the variable you're taking the partial derivative to.
  2. Calculate the derivative of $f$ with respect to just that variable like in 18.01.
  3. Output the derivative you got.

  This is easy, and only requires 18.01 material.
]

We just saw three examples where we computed the partials for $f(x,y) = x^3 y^2 + cos (y)$,
$f(x,y,z) = e^(x y z)$, and $f(x,y) = x^2+y^2$.
Here are a bunch more examples that you can try to follow along:

#sample[
  Calculate the partial derivatives of $f(x,y,z) = x+y+z$.
]
#soln[
  The partial derivative with respect to $x$ is obtained by differentiating
  $ x |-> x + y + z. $
  Since we pretend $y$ and $z$ are constants, we just differentiate $x$ to get $1$.
  The same thing happens with $y$ and $z$.
  Hence
  $
  f_x (x,y,z) &= 1 \
  f_y (x,y,z) &= 1 \
  f_z (x,y,z) &= 1. #qedhere
  $
]

#sample[
  Calculate the partial derivatives of $f(x,y,z) = x y + y z + z x$.
]
#soln[
  We differentiate with respect to $x$ first, where we view as the function
  $ x |-> (y + z) x + y z $
  pretending that $y$ and $z$ are constants.
  This gives derivative $f_x (x,y,z) = y + z$.
  Similarly, $f_y (x,y,z) = x + z$ and $f_z (x,y,z) = x + y$.
  So
  $
  f_x (x, y, z) &= y + z  \
  f_y (x, y, z) &= z + x  \
  f_z (x, y, z) &= x + y. #qedhere
  $
]

#sample[
  Calculate the partial derivatives of $f(x,y) = x^y$, where we assume $x,y > 0$.
]
#soln[
  If we view $y$ as a constant and $x$ as a variable, then
  $ x |-> x^y $
  is differentiated by the "power rule" to get $y x^(y-1)$.
  However, if we view $x$ as constant and $y$ as a variable, then
  $ y |-> x^y = e^(log x dot y) $
  ends up with derivative $log x dot e^(log x dot y) = log x dot x^y$.
  (Remember, in this book $log$ denotes the _natural log_.)
  Hence
  $
    f_x (x,y) &= y x^(y-1) \
    f_y (x,y) &= log x dot x^y. #qedhere
  $
]

== [EXER] Exercises

#exer[
  Find all the partial derivatives of the following functions, defined for $x,y,z > 0$:

  - $f(x,y,z) = x / y + y / z + z / x$
  - $f(x,y,z) = sin(x y z)$
  - $f(x,y,z) = x^y + y^z + z^x$.
]
