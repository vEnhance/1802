# Contributing

Please submit [pull requests](https://github.com/vEnhance/1802/pulls)!
Things that you can help with:

1. Find some typos! There are plenty. This book is new and still being tested.
2. Draw some more figures. The figures are made in Asymptote, check the
   `figures/` directory.
3. Help fill in solutions to the exercises or other gaps in the text.
4. Suggest new exercises for the text, especially interesting ones.
5. Anything else, really.

For minor typo fixes, you can probably just use the GitHub web editor
to generate the pull request,
so you don't have to download anything.

If you want to make more involved changes,
you probably want to `git clone` a local copy of the repository.
See [README.md](README.md) for some instructions on installation.

## Conventional commits for pull requests

If you make a pull request, please follow
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
in the title of the pull request.
See [conv-commit.yml](.github/workflows/conv-commit.yml)
for the GitHub action that enforces this.
For most of you, this means that the PR title should say either

- `fix: [short description here]` (if you are fixing an issue)
- `feat: [short description here]` (if you are introducing a new feature)

depending on whether you are fixing an issue or doing something new,
respectively. Some other custom types are supported too,
see [Evan's dotfiles for a list](https://github.com/vEnhance/dotfiles/blob/main/commit-types.md).
