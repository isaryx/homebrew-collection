---
name: test-homebrew
description: >-
  Test a Homebrew formula or cask locally. Use when validating Formula/ or
  Casks/, checking install steps, or confirming a package works before release.
---

# Test Homebrew Package

Run commands. Report pass/fail with output. Logs: `~/Library/Logs/Homebrew/{name}/`

Package must be in a tap — not a bare `./Formula/foo.rb` path.

## Formula

1. Read `Formula/{name}.rb`
2. Install from source:

```bash
brew install --build-from-source isaryx/collection/{name}
```

3. If link failed, unlink the conflicting formula, then `brew link isaryx/collection/{name}` (`brew test` requires a linked formula)
4. Test:

```bash
brew test isaryx/collection/{name}
```

Versioned formulae (`thrift@0.22`, etc.): only one linked at a time. Restore the user's previously linked version when done.

## Cask

1. Read `Casks/{name}.rb`
2. Install:

```bash
brew install --cask isaryx/collection/{name}
```

3. Verify the installed artifact (app in `/Applications`, CLI on `PATH`, `java -version`, etc.)
