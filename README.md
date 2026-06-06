# isaryx Collection

Homebrew tap for versioned dev tools and JDK distributions.

```bash
brew tap isaryx/collection
brew install isaryx/collection/thrift@0.23
brew install --cask isaryx/collection/corretto21
```

## Packages

**Formulae:** `thrift@0.20`, `thrift@0.22`, `thrift@0.23`, `typer`

**Casks:** `corretto11`, `corretto17`, `corretto21`, `corretto25`, `bitbar`, `shuttle`

Corretto casks support Apple Silicon and Intel. `bitbar` is deprecated — see [xbar](https://github.com/matryer/xbar).

## Agent skills

Cursor agent skills for maintaining this tap live in `.agents/skills/`:

| Skill | Purpose |
|-------|---------|
| `check-tap` | Audit tap versions against upstream |
| `bump-homebrew` | Bump a formula or cask version |
| `test-homebrew` | Install and test a formula or cask locally |

## License

MIT
