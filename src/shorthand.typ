#import "@local/evan:1.0.0":*

= All the gazillion weird $dif$ shorthands

== [TEXT] The shorthand $dif A := dif x dif y$ for area

Up to here I've been pretty careful to always write
$ iint_(cal(R)) f(x,y) dif x dif y$
to make it obvious what the integration variables are.

However, some of you are probably already starting to
get tired of writing $dif x dif y$ and $dif y dif x$.
In particular, I advised you earlier that you should prefer to write
$ int_(x=0)^5 int_(y=0)^(3) f(x,y) dif y dif x $
rather than the harder-to-read $int_0^5 int_0^3 f(x,y) dif y dif x$.
Those of you who took my advice may not want to waste the time of remembering whether
it's $dif y dif x$ or $dif x dif y$ at the end, since it doesn't matter for you anymore.
For that reason, at this point I hereby bestow on you the following definition:
#definition(title: [Definition of $dif A$])[
  We let $dif A$ be a shorthand for either $dif x dif y$ or $dif y dif x$,
  whichever one is appropriate for the given context.
]
So now you can just write:
$ int_(x=0)^5 int_(y=0)^(3) f(x,y) dif A. $
I guess that saves two characters.

#tip(title: [Tip: Variable names are often omitted too])[
  In fact, when you use shorthand, you may even leave out $x$ and $y$ from $f$ and just write
  $ int_(x=0)^5 int_(y=0)^(3) f dif A. $
  So any time shorthand is being used,
  don't be surprised if the variable names are missing altogether.
]

Be careful about overdoing this shorthand!
For example, if you are working with _polar_ coordinates, then in fact
$ dif A = dif x dif y = r dif r dif theta $
as we just saw. Note the extra factor of $r$!
Seriously, $dif A != dif r dif theta$!

If you trust yourself to not forget about the factor of $r$,
or if you're doing a calculation for which the actual variables don't matter,
you can also use $dif A$ here.
For example, you might write
$ iint_("unit disk") dif A = pi $
to say the area integral of the unit disk is $pi$.
(Pure mathematicians might appreciate how this does not commit to any choice of coordinates.)

But if you do this, be honest with yourself about whether you trust yourself with the shorthand:
#quote[A bad workman blames his tools.]

== [TEXT] ... and six more shorthands

When we talk about vector fields or even just arc length, there are more new types of integrals.
And people have all sorts of analogous shorthands.
If you read enough different books, you'll probably eventually see all of
$dif bf(r)$, $dif A$, $dif V$, $dif s$, $dif S$, $dif bf(S)$,
in various online books.
I can't imagine how annoying this is to someone learning the subject for the first time.

#figure(
  table(
    columns: 4,
    align: left,
    table.header([Symbol], [Name], [Used in], [Abbreviation for]),
    [$dif A$], [Area], [Double/area integrals],
      [$dif x dif y$ (in polar, replaced immediately with $r dif r dif theta$)],
    [$dif s$], [Arc length], [Scalar-field line integrals \ (in @ch-scalint)],
      [$|bf(r)'(t)| dif t$ \ where $bf(r)(t)$ parametrizes a path],
    [$dif bf(r)$], [Line element], [Vector-field line integrals \ (in @ch-work)],
      [$bf(r)'(t) dif t$\ where $bf(r)(t)$ parametrizes a path],
    [$dif S$], [Surface area], [Scalar-field surface integrals \ (in @ch-scalint)],
      [$|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)| dif u dif v$ \ where $bf(r)(u,v)$ parametrizes a surface],
    [$bf(n) dif S$ \ or $dif bf(S)$], [Surface normal], [Vector-field surface integrals \ (in @ch-flux)],
      [$(partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$ \ where $bf(r)(u,v)$ parametrizes a surface],
    [$dif V$], [Volume], [Triple/volume integrals \ (in @ch-triple)],
      [$dif x dif y dif z$],
    [$bf(n) dif s$], [Outward normal], [Only 2D flux (in @ch-2dflux)],
      [$(90 degree "clockwise rotation of" bf(r)'(t)) dif t$]
  ),
  caption: [A bunch of shorthands you'll meet later.
    Note that pretty much there is one shorthand for each kind of integral in @poster-triangle.
    In Part India when the upgraded poster @poster-stokes is introduced,
    each of the new kinds of integrals (the purple pictures) also has a new shorthand.],
  kind: table
) <table-shorthand>

So here's the deal.

- First, I'm going to make the following table of what all these shorthands mean.
  The result is @table-shorthand.
  Feel free to print it and have it with you.
  Note that you haven't met most of these yet, so only the first row will make sense for now.
- Second, I'm going to avoid the shorthand when I first introduce things --- for example,
  I deliberately avoided any shorthand on @poster-triangle
  and the later @poster-stokes ---
  but later on I'll start to use it as you get more practice.
- Third, in each place where the shorthand _could_ be used for the first time, I'll mention it.
  That is, I'll let you know every time a new row of the table is introduced.

But again, I think the thing to take away is that each of these is a shorthand.
So if you don't like shorthands, you can just always replace it with the thing it stands for.

#digression(title: [Digression on differential forms])[
  Calling these a shorthand is a bit of a white lie,
  in that there is actually a rhyme and reason to all these $dif$ symbols.
  Most of them are what are called _differential forms_ or _densities_,
  and you can make a precise definition of what these are.
  But this is so far beyond the scope of 18.02 I won't spend any more space on it.
]
