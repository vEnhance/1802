#import "@local/evan:1.0.0":*

#show: evan.with(
  title: [Notes for 18.02 Recitation 24],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [11 December 2024],
)


#quote(attribution: [Linus Torvalds])[
  And I am not a visionary. I do not have a five-year plan. I'm an
  engineer. I'm perfectly happy with all the people who are
  walking around and just staring at the clouds and looking at the stars and saying, "I want to
  go there." But I'm looking at the ground, and I want to fix the pothole that's right in front
  of me before I fall in. This is the kind of person I am.
]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

= Course evaluations

Please complete course evaluations at
#url("https://registrar.mit.edu/subjectevaluation")
if you haven't already.
(As of Tuesday morning, we're at 23% response rate; it'd be nice to get that up.)

= Final exam

- As listed on #url("finals.mit.edu"), it's Thursday, December 19, 2024 from 9am-12noon.

- It's about 13-14 questions, so about 2.5x midterm length. Don't be too surprised if you finish early!

- It's cumulative, but with a slight emphasis on post-midterm 3 content.
  - I think what this means is that every topic from after midterm 3 is guaranteed to appear,
    and then some uniform-random subset of other topics from MT1/MT2/MT3 will also appear.
  - So: potential functions, divergence theorem, and surface flux are _guaranteed_ to appear.
    - The surface flux is likely to be one of the cases from table of cross products
      I computed for you: a graph $z = f(x,y)$, a cylinder, a sphere, or a flat plane.
  - However, crummy Stokes' theorem
    $oint_(cal(C)) bf(F) dif bf(r) = iint_(cal(S)) op("curl") bf(F) dot bf(n) dif S$
    is *excluded* from the final.

- By this point, my *LAMV book should be essentially feature-complete*.
  (Over the last week, I finally back-filled in the linear algebra part.)
  There are still some gaps with examples and figures but the base content should be all there.

- My study advice remains the same: *know all the recipes*.
  I've tried to put them all in purple boxes for you in my notes for this reason.
  I suspect only a small number of the final exam questions will really require thought.
  For the majority of the questions, follow the cookbook and you'll be fine.

= Review session and office hours

- There should be a review session (possibly two), but time/location/instructor are TBD.
- I will hold extended office hours from *10am - 12noon* on *Monday, December 16th*
  and *Wednesday, December 18th*. Room still TBD.
  (Some other TA's will host office hours too.)

= Life after 18.02

== Take-aways

Probably in a few years most of you won't remember much from this class anymore.
However, I hope that you still take away a few higher-level things from your time here:

- Understanding how to study a new subject and organize it in your head is a
  really useful meta-skill and I hope 18.02 gave you practice with that.
  (We covered a lot of ground in this class!)
  The world changes so quickly now that it's not enough to have fixed skillsets anymore.
  So it can be worth your time to learn subjects to develop this power alone,
  even if you don't actually ever use the content-level knowledge again.
- If you liked my writing, I hope you learned something about what good writing can be like.
- And if you any of you end up becoming teachers one day,
  whether as a TA somewhere down the line, or eventually a full-time instructor or professor,
  I hope you picked up a bit about pedagogy from me!

== The MIT math department

Some hints about the math department here (with the obvious personal biases):

- In my opinion, 18.01/18.02/18.03/18.06 are the least fun classes
  in the math department by a big margin.#footnote[
    In case you haven't figured out yet, I think in most departments at MIT,
    the non-GIR classes are usually much cooler than the intro ones.
    A lot of it is because of the class size.
  ]
  Consequently, if you're *deciding whether to take more math classes*
  (either for interest or as a possible major/minor),
  my advice is to *ignore your 18.02 experience in deciding*.
  - In particular, some of you have told me privately you feel like you're just memorizing formulas
    and don't understand why any of them are true.
    For these students in particular, I think you'd enjoy other Course 18 classes a lot more.
- If you are interested in taking the actually fun math classes,
  you basically want to get proof experience ASAP and then start exploring from there.
  At MIT, the spring class *18.090* is meant for this.
  You can take it directly after 18.02 (i.e. no further prerequisites).
- At MIT, math majors are easier to get than you might think, because
  *the math major requirements are extremely lax*. For the
  #link("https://math.mit.edu/academics/undergrad/major/course18/general.html")[General Option],
  you just take any _eight_ classes beyond GIR's.#footnote[
    There are also "Pure" and "Applied" options for the math major,
    but I've never figured out why they exist and nobody has been able to explain to me.
    In particular, when I was a student they were a superset of the General requirements
    (i.e. it was impossible to complete either of these and not also fulfill General).
    So everyone would just do the General option.
  ]
  In other words, *you can get a math major by taking about one math class per semester*.
  - This is why double majors with math are so common at this school.
  - In contrast, a minor is six classes. Personally, if you're going to take six classes,
    I think you might as well take two more to upgrade the minor to a major.

Chapter 54 of LAMV has some more spelled-out advice along these lines.

= Goodbye

Incidentally, besides being the last recitation for this class,
today is also a special day for me because I'm defending my thesis at 12:30pm,
completing my last semester at MIT after 10 years.
(The defense is open to the public, but if you come,
I promise you won't understand anything I say.)

Unrelatedly: if you're around for IAP you should totally do Mystery Hunt,
it's part of the experience of being an MIT student!
Details at #url("https://www.mitmh2025.com/").
A lot of the dorms or student groups on campus should have teams that you can join.
