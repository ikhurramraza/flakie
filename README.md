# Flakie

![Lint](https://github.com/ikhurramraza/flakie/actions/workflows/lint.yml/badge.svg)
![Test](https://github.com/ikhurramraza/flakie/actions/workflows/test.yml/badge.svg)
![Release](https://github.com/ikhurramraza/flakie/actions/workflows/release.yml/badge.svg)

Runs the provided command to calculate its flakyness.

## 💿 Installation

```bash
gem install flakie
```

## 🚀 Publishing

1. Bump the version in `lib/flakie/version.rb` file in a PR.

2. Create and push tag to GitHub.

```bash
git tag --sign -a "v[VERSION_TAG]" -m "v[VERSION_TAG]"

git push origin "v[VERSION_TAG]"
```

3. Wait for Release GitHub action to complete.
