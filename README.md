# Evan's 18.02 Materials from Fall 2024

18.02 is multivariable calculus at MIT.

Originally, this was a repository for [DLC](https://w.wiki/B6m3)'s
that I wrote when teaching 18.02 recitation.
Gradually, it involved into a separate textbook by me,
because I was dissatisfied with the textbook provided by the actual course.

The outputted textbook can be downloaded at the following link:

> https://web.evanchen.cc/textbooks/lamv.pdf

For other historical pieces,
see the [18.02 recitation page on evanchen.cc](https://web.evanchen.cc/1802.html).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) if you'd like to help out

## Compiling

### Install Typst and packages

The main text is written in [Typst 0.13](https://typst.app).
It uses the custom package
[evan@1.0.0](https://github.com/vEnhance/dotfiles/blob/main/typst/packages/local/evan/1.0.0),
which you will have to download and install in a place Typst can find it like
`~/.local/share/typst/packages/local/`.

### Asymptote

The figures are all in `figures/`.
These are [Asymptote figures](https://web.evanchen.cc/asyguide.html).

### Compiling

Run `make all` for most targets.
LaTeX should be compiled separately using e.g. `latexmk`.
