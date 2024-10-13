#import "@local/evan:1.0.0":*

= Type safety

Before we get started with the linear algebra and calculus,
I want to talk quickly about _types of objects_.
This is an important safeguard for the future in checking your work
and auditing your understanding of a topic;
a good instructor will point out, in your work, any time you make a type-error.

== [TEXT] Type errors

In mathematics, statements are usually either true or false. Examples of
false statements#footnote[Indiana Pi bill and 1984, respectively.]
include $ pi = 16 / 5 #h(2em) upright("or") #h(2em) 2 + 2 = 5 . $
However, it’s possible to write statements that are not merely false,
but not even "grammatically correct", such as the nonsense equations
$
  pi = mat(1, 0; 0, 1) , #h(2em)
  bf(i) + 3 bf(j) = cos (bf(k)), #h(2em)
  det vec(5, 11) != sqrt(2).
$
To call these equations false is misleading.
If your friend asked you whether $2 + 2 = 5$, you would say "no".
But if your friend asked whether $pi$ equals the $2 times 2$ identity matrix,
the answer is a different kind of "no";
really, it’s "your question makes no sense".

These three examples are *type errors*.
This term comes from programming: most programming languages have
different data types like integer, boolean, string, array, etc.,
and will usually#footnote[JavaScript is a notable exception.
  In JavaScript, you may know that `[]` and `{}` are an
  empty array and an empty object, respectively.
  Then `[]+[]` is the empty string, `[]+{}` is the string `‘[object Object]’`, `{}+[]` is `0`,
  and `{}+{}` is `NaN` (not a number).]
prevent you from doing anything idiotic like adding a string to an array.

Objects in mathematics work in a really similar way.
In the first weeks of 18.02, you will meet real numbers, vectors, and matrices;
these are all different types of objects, and certain operations are defined
(aka "allowed") or undefined (aka "not allowed")
depending on the underlying types.
Table @operations lists some common examples with vectors you've seen from precalculus.

#figure(
  table(
    columns: 5,
    align: (left,center,left,left,left,),
    table.header([Operation], [Notation], [Input 1], [Input 2], [Output],),
    table.hline(),
    [Add/subtract], [$a pm b$], [Scalar], [Scalar], [Scalar],
    [Add/subtract], [$bf(v) pm bf(w)$], [Length $d$
    vector], [Length $d$ vector], [Length $d$ vector],
    [Add/subtract], [$M pm N$], [$m times n$ matrix], [$m times n$
    matrix], [$m times n$ matrix],
    [Multiply], [$c bf(v)$], [Scalar], [Length $d$
    vector], [Length $d$ vector],
    [Multiply], [$a b$], [Scalar], [Scalar], [Scalar],
    [Multiply], [$M N$], [$m times n$ matrix], [$n times p$ matrix], [$m times p$ matrix],
    [Dot product], [$bf(v) dot.op bf(w)$], [Length $d$ vector], [Length $d$ vector], [Scalar],
    [Cross product], [$bf(v) times bf(w)$], [Length $3$ vector], [Length $3$ vector], [Length $3$ vector],
    [Length/mag.], [$lr(|bf(v)|)$], [Any vector], [_n/a_], [Scalar],
    [Determinant], [$det A$], [Any square matrix], [_n/a_], [Scalar],
  ),
  caption: [Common linear algebra operations. For 18.02, "scalar" and "real number" are synonyms.],
  kind: table
) <operations>

#digression[
  A common question at this point is how you are supposed to figure out
  whether a certain operation is allowed or not.
  For example, many students want to try and multiply two vectors together component-wise;
  why is
  $ vec(2, 3) vec(4, 5) =^? vec(8, 15) $
  not a legal sentence?
  It seems like it would make sense.

  The answer is that you _don't_ have to figure out — you are _told_;
  @operations isn't something that you derive.
  Instead, it's the set of _definitions_ which you have been given.

  (Or more sarcastically, it's all just a social construct.
  Well, it's bit more nuanced than that.
  Definitions aren't judged by "correctness";
  that doesn't make sense; you are allowed to make up whatever definitions you want.
  Instead, definitions are judged by whether they are _useful_.
  Which is obviously subjective, but it’s less subjective than you might guess.)
]

== [TEXT] Why you should care

There are two action items to take away from this section.

=== When learning a new object, examine its types first

What this means is that, every time you encounter a new kind of
mathematical object or operation (e.g. partial derivative),
*the first thing you should do is ask what types are at play*.
This helps give you a sanity check on your understanding of the new concept.

We'll use boxes like this throughout the box to do this:
#typesig[
  This is an example of a type signature box.
  When we want to make comments about the types of new objects,
  we'll put them in boxes like this.
]

=== Whenever writing an equation, make sure the types check out

Practically, what's really useful is that if you have a good handle on types,
then it *gives you a way to type-check your work*.
This is the analog of dimensional analysis from physics,
where you know you messed up if some equation has
$"kg" dot "meters" dot "seconds"^(- 2)$ on the left
but $"kg" dot "meters" dot "seconds"^(- 1)$ on the right.

For example, if you are reading your work and you see something like
#eqn[
  $ lr(|arrow(v) times arrow(p)|) = 9 arrow(p) $
  <wrong-type>
]
then you can immediately tell that there’s a mistake,
because the two sides are incompatible —
the left-hand side is a real number (scalar), but the right-hand side is a vector.

== [RECAP] Takeaways from type safety

- Throughout this book, every time you meet a new operation,
  make sure you know what types of objects it takes as input and which it takes as output.
- Whenever you write an equation, make sure it passes a type-check.
  You can catch a lot of errors like @wrong-type using type safety alone.

== [EXER] Practice with type safety

#todo[have a list of equations here, and ask to identify the type errors? or similar]
