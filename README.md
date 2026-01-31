# isaryx Collection

A curated Homebrew tap for versioned development tools and JDK distributions.

## Quick Start

```bash
brew tap isaryx/collection
```

## Packages

### Formulae

| Formula | Description | Version |
|---------|-------------|---------|
| `thrift@0.20` | Apache Thrift framework | 0.20.0 |
| `thrift@0.22` | Apache Thrift framework | 0.22.0 |

### Casks

| Cask | Description | Version | Notes |
|------|-------------|---------|-------|
| `corretto11` | Amazon Corretto JDK 11 | 11.0.30.7.1 | LTS |
| `corretto17` | Amazon Corretto JDK 17 | 17.0.18.8.1 | LTS |
| `corretto21` | Amazon Corretto JDK 21 | 21.0.10.7.1 | LTS |
| `corretto25` | Amazon Corretto JDK 25 | 25.0.2.10.1 | LTS |
| `bitbar` | Menu bar scripting | 1.10.1 | Deprecated, see [xbar](https://github.com/matryer/xbar) |
| `shuttle` | SSH shortcut menu | 1.2.9 | |

All Corretto casks support both Apple Silicon and Intel Macs.

## Install Examples

```bash
# Thrift
brew install isaryx/collection/thrift@0.22

# Corretto JDK
brew install --cask isaryx/collection/corretto21

# Set JAVA_HOME (add to your shell profile)
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
```

## License

MIT
