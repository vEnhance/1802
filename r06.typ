#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 6],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [23 September 2024],
)

#quote(attribution: [Clara Oswald, in Doctor Who])[Run, you clever boy, and remember.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- Optional midterm review, 4-270, Thu 4:30pm-6:30pm. Led by me, Vinjay, and Sebastian.
- Please fill out the survey at #url("https://forms.gle/AsXPweCbJ1Nvzp3k7") when you can.
- I made a Discord server. If you didn't get the link emailed to you, ask me to join.
- Remember that September 30 is the last day to switch sections freely on Canvas.

= It's a miracle that multiplication in $CC$ has geometric meaning

Let $CC$ denote the set of complex numbers (just as $RR$ denotes the real numbers).
It's important that realize that, *until we add in complex multiplication,
$CC$ is just an elaborate $RR^2$ cosplay*.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Concept], [For $RR^2$], [For $CC$]),
    [Notation], [$bf(v)$], [$z$],
    [Components], [$vec(x, y)$], [$x + y i$],
    [Length], [Length $|bf(v)|$], [Abs val $|z|$],
    [Direction], [(slope, maybe?)], [argument $theta$],
    [Length $1$], [unit vector], [$e^(i theta) = cos theta + i sin theta$],
    [Multiply], [_NONE_], [✨ $z_1 z_2$ ✨]
  ),
  kind: table
)

- All the way back in R01, when I warned you about type safety,
  I repeatedly stressed you that you *cannot multiply two vectors in $RR^n$ to get another vector*.
  You had a "dot product", but it spits out a number.
  (Honestly, you shouldn't think of dot product as a "product"; the name sucks.)

- Of course, the classic newbie mistake (which you better not make on your midterm)
  is to define a product on vectors component-wise:
  why can't $vec(x_1, dots.v, x_n)$ and $vec(y_1, dots.v, y_n)$ have "product"
  $vec(x_1 y_1, dots.v, x_n y_n)$?
  Well, in 18.02, every vector definition needed a corresponding geometric picture
  for us to consider it worthy of attention (see table at start of `r03.pdf`).
  This definition has no geometric meaning.

- However, there is a big miracle for $CC$. For complex numbers, you can define multiplication by
  $(a+b i)(c+d i) = (a c - b d) + (a d + b c) i$ and there is
  _an amazing geometric interpretation_.

Unfortunately, AFAIK there is no English word for
"complex number whose absolute value is one" (err, CNWAVIO?),
the same way there is for "unit vector".
For 18.02, we instead use
$e^(i theta) := cos theta + i sin theta$
as the "word"; whenever you see $e^(i theta)$, draw it as unit vector $cos theta + i sin theta$.

It's worth pointing out the notation $e^(i theta)$ should strike you as _nonsense_.
What meaning does it have to raise a number to an imaginary power?
Does $i^i$ have a meaning?#footnote[Answer: *you don't want to know*.
  Maulik explained in class how to do some cases:
  you start by _redefining_ exponentiation as $e^x = sum x^k / k!$.
  This redefinition sweeps much work under the rug;
  e.g. $sum x^k / k! sum y^k / k! = sum (x+y)^k / k!$ needs to be proved.
  But if you know 18.100/18.112, you can do enough book-keeping and prove everything.

  However, when the _base_ is non-real, everything goes haywire, e.g.
  $i^i = (e^(i pi slash 2))^i = e^(-pi slash 2)$
  and $i^i = (e^(5 pi i slash 2))^i = e^(-5 pi slash 2)$.
]
When starting out, I would actually think of the notation $e^(i theta)$ as a _mnemonic_,
i.e. a silly way to remember the following result:
#theorem[
  If you multiply two CNWAVIO's, you get the CNWAVIO with the angles added:
  $ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) <==>
    cos (theta_1 + theta_2) + i sin (theta_1 + theta_2)
    = (cos theta_1 + i sin theta_1) (cos theta_2 + i sin theta_2). $
  More generally, multiplying two complex numbers multiplies the norms and adds the angles.
] <miracle>
This is IMO the biggest miracle in all of precalculus.
Corollary: $e^(i n theta) = (e^(i theta))^n
<==> (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)$,
allows taking $n$th roots; Maulik showed $z^2 = 2i$ in class.

= Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
Depending on what you are trying to do, some forms are easier to work with than others.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Operation], [In rectangular], [In polar]),
    [$z_1 plus.minus z_2$],
      [✅ Component-wise like in $RR^2$],
      [❌ Unless $z_1$ is a real multiple of $z_2$],
    [$z_1 z_2$], [✅ Expanding], [✅ by @miracle],
    [$z_1 slash z_2$], [✅ Use $1/(c+d i) = (c - d i) / (c^2+d^2)$ trick then multiply], [✅ by @miracle],
    [$n$#super[th] root of $z_1$], [❌ Not recommended for $n > 1$], [✅ by @miracle corollary],
  ),
  kind: table
)

= Recitation problems from Prof Maulik

/ 1.: For each of the following points, convert it from Cartesian to polar or
  vice versa:
    - $(x , y) = (- sqrt(3) , 1)$
    - $(r , theta) = (3 , pi \/ 6)$
    - $(x, y) = (- sqrt(6) , - sqrt(2))$
/ 2.: Show that $sin (theta) = frac(1, 2 i) (e^(i theta) - e^(- i theta))$ and
  $cos (theta) = 1 / 2 (e^(i theta) + e^(- i theta))$. Use this to write
  $(sin (theta))^3$ in terms $sin (3 theta)$ and $sin (theta)$.
/ 3.: Consider the complex number $f (t) = frac(t + 2 i, 1 - 3 i)$ where $t$ is real.
  - Find the real and imaginary part of $f (t)$.
  - Find $overline(f (t))$ and $lr(|f (t)|)^2$.
/ 4.: Use polar form to find the fourth powers of $2 + 2 i$ and
  $- 3 + i sqrt(3)$. Graph these numbers and their fourth powers on the
  complex plane.
/ 5.: (If you have time) Consider the matrix
  $A = mat(0, - 1; 1, 0)$. In class, working with real
  numbers, this had no eigenvectors. But now we can treat it as a matrix
  with complex number entries. Find complex number eigenvalues for $A$ and
  for each one, find an eigenvector in $CC^2$, i.e. a
  two-component vector $vec(z, w)$ where $z$, $w$ are complex numbers.

#pagebreak()

= Post-recitation notes

#todo[To be written.]
