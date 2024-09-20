#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 6],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [23 September 2024],
)

#quote(attribution: [Clara Oswald, in Doctor Who])[Run, you clever boy, and remember.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- Optional midterm 1 review session on Thu, 4:30pm-6:30pm. Led by me, Vinjay, and Sebastian.
- Please fill out the survey at #url("https://forms.gle/AsXPweCbJ1Nvzp3k7") when you can.
- I made a Discord server. If you didn't get the link emailed to you, ask me to join.
- Remember that September 30 is the last day to switch sections freely on Canvas.

= It's a miracle that multiplication in $CC$ has geometric meaning

We let $CC$ denote the set of complex numbers (just as $RR$ denotes the real numbers).
We often draw complex numbers as $RR^2$, and you can make a lot of analogies.

#align(center)[
  #table(
    columns: 3,
    table.header([*Concept*], [*For $RR^2$*], [*For $CC$*]),
    [Notation], [$bf(v)$], [$z$],
    [Components], [$vec(x, y)$], [$x + y i$],
    [Length], [Length $|bf(v)|$], [Abs val $|z|$],
    [Direction], [(slope, maybe?)], [argument $theta$],
    [Length $1$], [unit vector], [$e^(i theta) = cos theta + i sin theta$],
    [Multiply], [_NONE_], [$z_1 z_2$]
  )
]

If you read every row but the last, $CC$ would just seem like an $RR^2$ cosplay.
The last row is the miracle.

- All the way back in R01, when I warned you about type safety,
  I repeatedly stressed you that you *cannot multiply two vectors in $RR^n$ to get another vector*.
  You had a "dot product", but it spits out a number.
  Honestly, you shouldn't think of dot product as multiplication; the name sucks.

- Of course, the classic newbie mistake (which you better not make on your midterm)
  is to define a product on vectors component-wise:
  why can't $vec(x_1, dots.v, x_n)$ and $vec(y_1, dots.v, y_n)$ have "product"
  $vec(x_1 y_1, dots.v, x_n y_n)$?
  Well, in 18.02, every definition we made with a vector had to have some geometric picture
  to go with it in order for us to consider it worthy of attention (see table at start of `r03.pdf`).
  This definition has no geometric meaning.

- However, there is a big miracle for $CC$. For complex numbers, you can define multiplication by
  $(a+b i)(c+d i) = (a c - b d) + (a d + b c) i$ and there is
  _an amazing geometric interpretation_.

Unfortunately, AFAIK there is no English word for
"complex number whose absolute value is one" (err, CNWAVIO?),
the same way there is for "unit vector".
For 18.02, we instead use
$ e^(i theta) := cos theta + i sin theta $
as the "word"; whenever you see $e^(i theta)$, draw it as unit vector $cos theta + i sin theta$.

It's worth pointing out the notation $e^(i theta)$ should strike you as _nonsense_.
What meaning does it have to raise a number to an imaginary power?
Does $i^i$ have a meaning?#footnote[Answer: you don't want to know.
  Maulik explained in class how to do some cases:
  you start by _redefining_ exponentiation as $e^x = sum x^k / k!$.
  This redefinition is sweeping a lot of the work under the rug;
  for example, it's not obvious $sum x^k / k! sum y^k / k! = sum (x+y)^k / k!$,
  but if you know enough 18.100/18.112, you can do enough book-keeping and derive Euler's formula.
  But then when the exponent is non-real, all goes haywire.]
When starting out, I would actually think of the notation $e^(i theta)$ as a _mnemonic_,
i.e. a silly way to remember the following result:
#theorem[
  If you multiply two CNWAVIO's, you get the CNWAVIO with the angles added:
  $ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) <==>
    cos (theta_1 + theta_2) + i sin (theta_1 + theta_2)
    = (cos theta_1 + i sin theta_1) (cos theta_2 + i sin theta_2). $
  More generally, multiplying two complex numbers multiplies the norms and adds the angles.
]
This is (in my opinion) by far the biggest miracle that happens in precalculus.

Corollary: $e^(i n theta) = (e^(i theta))^n
<==> (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)$,
so it's easy to take $n$th roots, see Maulik's notes for the example $z^2 = 2i$.

= Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
Depending on what you are trying to do, some forms are easier to work with than others.

#align(center)[
  #table(
    columns: 3,
    align: left,
    table.header([*Operation*], [*In rectangular*], [*In polar*]),
    [$z_1 plus.minus z_2$], [Yes, component-wise], [Usually unpleasant],
    [$z_1 z_2$], [Yes, expand], [Yes, easy],
    [$z_1 slash z_2$], [Yes, but needs $1/(c+d i) = (c - d i) / (c^2+d^2)$ trick], [Yes, easy],
    [$n$th root of $z_1$], [No, literally impossible], [Yes, easy],
  )
]


= Recitation problems from Prof Maulik

#todo[To be written.]

#pagebreak()

= Post-recitation notes
