---
name: bump-tap
description: >-
  Bump a package version in this Homebrew tap. Use when releasing or updating
  a formula or cask in Formula/ or Casks/.
---

# Bump Tap Package

1. Open `Formula/{name}.rb` or `Casks/{name}.rb` — read it first, keep its structure
2. Confirm the upstream release exists (stop if 404)
3. Update `version`, `url`/`mirror`, `sha256`, and version checks in `test` only
4. Fetch checksums; verify at least one with `shasum -a 256`

```bash
curl -sL "https://github.com/{owner}/{repo}/releases/download/v{VERSION}/checksums.txt"
curl -sL "<url>" | shasum -a 256
```

**Dry run** (default): show diff, verify checksums, no file edits, no commit.

**Apply + commit**: only when explicitly asked. Check `git log -- <file>` for message style.
