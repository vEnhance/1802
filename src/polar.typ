#import "@local/evan:1.0.0":*

= Polar coordinates

== [TEXT] Polar coordinate is a special case of change of variables

Last section one of the transition maps we used was
$ bf(T)_"polar" (r, theta) = (r cos theta, r sin theta). $
This map is so common that you should actually memorize its area scaling factor.
Remember from last section we computed
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
Colloquially, it can be written like so:

#memo(title: [Memorize: The Jacobian for polar coordinates])[
  When converting from Cartesian coordinates $(x,y)$ to polar coordinates $(r,theta)$
  you should replace $dif x dif y$ to $r dif r dif theta$.
  Colloquially, we write
  $ dif x dif y = r dif r dif theta. $
]

Many other sources will write $dif A$ as a shorthand for _both_:
so if you have $(x,y)$ coordinates then $dif A = dif x dif y$,
while if you have polar coordinates then $dif A = r dif r dif theta$.
(They're equal, after all.)
Again, this can be made more precise later on in life once you have access
to a new object called a _differential form_,
but for now just treat it as a mnemonic for one really common change of variables,
rather than a formal statement.
I'm still going to avoid writing $dif A$ for now,
so that when you see $dif x dif y$ or $dif y dif x$ you know you're _supposed_
to make a change of variables
(and won't accidentally write $dif r dif theta$ with the factor of $r$ missing).

The upshot is that in practice:
#idea[
  Once you remember that $dif x dif y$ turns into $1 dif r dif theta$,
  you can jump into problems directly in polar coordinates,
  skipping the $x$ and $y$ altogether.
]

For example, if you want to find the area of the unit disk,
you know in polar coordinates the unit disk is $0 <= r <= 1$ and $0 <= theta <= 2pi$,
so you can just directly think via the integral
$ int_(r=0)^1 int_(theta=0)^(2 pi) r dif theta dif r $
and not even bother writing the $x y$-version $iint_(x^2+y^2<=1) dif x dif y$.
Compared to back in @sec-chvar-polar, it's the same thing;
it's just a shift in mindset where you go from
"take an $x y$-picture and translate into polar coordinates"
to "take a picture and write it directly in polar coordinates".
