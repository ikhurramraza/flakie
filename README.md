# Flakie

Runs the provided command to calculate its flakyness.

## 💿 Installation

```bash
gem install flakie
```

## 🚀 Publishing

1. Bump the version in `lib/flakie/version.rb` file in a PR.

2. Create and push tag to GitHub.

```bash
git tag --sign -a "v[VERSION_TAG]" -m "[VERSION_TAG]"

git push origin "v[VERSION_TAG]"
```

3. Wait for Release GitHub action to complete.
