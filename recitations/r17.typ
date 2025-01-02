#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 17],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [6 November 2024],
)


#quote(attribution: [Miss Wormwood in Calvin and Hobbes, October 1, 1993])[
  Calvin, your test was an absolute disgrace!
  It's obvious you haven't read any of the material.
  Our first president was *not* Chef Boy-Ar-Dee
  and you ought to be ashamed to have turned in such preposterous answers!
  ]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Finding potential functions (see LAMV section 16)

#recipe(title: [How to find an anti-gradient with two variables])[
  1. Let $f$ denote the gradient function.
  2. Integrate the given $(partial f) / (partial x)$ to get some equation of the
    form $f(x,y) = "expression"  + g(y)$ for some function $g(y)$.
  3. Put this into $(partial f) / (partial y)$ to find $g'(y)$.
  4. Integrate get $g(y) = "expression" + C$ for some constant $C$.
  5. Stitch everything together to output $f$.
]

Some examples were covered in class today, so here's one where we actually get stuck:
#question(title: [Impossible question])[
  Find $f$ such that $nabla f = vec(2 y, x)$.
]
#soln[
  We start by integrating $(partial f) / (partial x)$ with respect to $x$ to get
  $f(x,y) = int 2 y dif x = 2 x y + g(y)$
  to start.
  Then differentiating with respect to $y$ gives
  $(partial f) / (partial y) = partial / (partial y) (2 x y + g(y)) = 2 x + g'(y)$.
  So then we set this equal and get $2 x = g'(y) + x$
  and so we need to solve $g'(y) = x$
  which... wait! There's no way a function $g$ can satisfy that for _every_ $x$.
  What's going on?
  (It's tempting to write $g(y) = x y + C$, but that's a type error:
  These new function $g$ can only depend on its arguments.)

  In mathematics there's a concept of _proof by contradiction_:
  if you start from an assumption,
  and then do some logic and reasoning to reach an impossible conclusion,
  then the starting assumption was wrong.
  Here, the starting assumption that there was _some_ function $f$ such that $nabla f = vec(2y, x)$.
  Starting from this assumption we found that there was a function $g : RR -> RR$
  such that $g'(y) = x$ for every real number $x$, which is ridiculous.
  So our assumption was wrong: there can't be such function $f$.
  Not like 18.01 where "$f$ exists but is hard to write down";
  the function $f$ literally cannot exist.
]

Okay, so I bet you're all wondering now, "how can I tell if the question is impossible?".
Well, one strategy would just be to run the recipe I showed you and see if it works out.

- If you find a function $f$ that works, great.
- If you run into a contradiction, well, now you know it's impossible.

But that's a lot of work. We'd like a shortcut, and there is one.

#memo(title: [Memorize: Criteria for 2D anti-gradient to exist])[
  $vec(p(x,y), q(x,y))$ is conservative
  if and only if $(partial p) / (partial y) = (partial q) / (partial x)$
  (assume $p$ and $q$ are continuously differentiable).
]

One direction of this is the result $f_(x y) = f_(y x)$ you saw during the second derivative test.
The nice thing is that it works the other way too:
vector fields that pass this test will be conservative.

= Preview of Thu/Fri lectures (LAMV sections 29.5, 30.8, 31)

#figure(
  box(stroke: 1pt, inset: 2pt, image("figures/gcd-cut-gc2.svg", width: 50%)),
)

On Thursday, we'll introduce the *2D scalar curl*, the right highlighted Stokes arrow above.
- When you chain two red Stokes arrows in the poster, you always get $0$.
  Indeed the 2D scalar is $"RHS"-"LHS"$ of the criteria above.
- Every red Stokes arrow has a Stokes result;
  this time it will be *Green's theorem*.

On Friday you'll meet *2D flux* which I hate, but it is a rotated version of the work integral:
#definition(title: [Definition of 2D flux])[
  $ "2D flux" := int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot
    (90 degree "clockwise rotation of" bf(r)'(t)) dif t. $
]
The "$90 degree$ clockwise rotation of $bf(r)'(t)$" is so awkward
that you can bet people immediately made up a shorthand to sweep it under the rug.
I think the usual notation is
$ bf(n) dif s := (90 degree "clockwise rotation of" bf(r)'(t)) dif t $
so that the above thing will usually be condensed to
$oint_(cal(C)) bf(F) dot bf(n) dif s$.
Because 2D flux is a rotated work integral, you'll get a Green's theorem for 2D flux too.
Read LAMV 31.3 to see it.

= Recitation questions from the official course

/ 1.: Consider the vector field $bf(F) = (y^2 + 2x)bf(i) + a x y bf(j)$.
  - Find the curl of $bf(F)$.
  - For what values of $a$ is $bf(F)$ a conservative gradient field?
  - For those values of $a$ find a potential function.
/ 2.: Repeat Q1 for $bf(F) = e^(x+y)((x+a)bf(i) + x bf(j))$.
/ 3.: Consider the vector field $bf(G) = - y/(x^2+y^2) bf(i) + x/(x^2+y^2) bf(j)$.
  Calculate the curl of $bf(G)$.
  Show that $bf(G)$ is not a gradient vector field by calculating the line integral
    $int_(C) G · dif bf(r)$ for the closed curve $C$ given by the unit circle,
    oriented counterclockwise.
