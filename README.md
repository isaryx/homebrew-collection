# isaryx Collection

A curated collection of Homebrew formulae and casks for development tools and utilities.

## Installation

### Tap the repository

```bash
brew tap isaryx/collection
```

### Install a formula or cask

```bash
# Install a formula
brew install <formula>

# Install a cask
brew install --cask <cask>
```

Or install directly without tapping:

```bash
# Install a formula directly
brew install isaryx/collection/<formula>

# Install a cask directly
brew install --cask isaryx/collection/<cask>
```

## Available Packages

### Formulae

| Formula        | Description                                                       | Version |
|----------------|-------------------------------------------------------------------|---------|
| `thrift@0.20`  | Apache Thrift framework for cross-language services development   | 0.20.x  |
| `thrift@0.22`  | Apache Thrift framework for cross-language services development   | 0.22.x  |

### Casks

| Cask          | Description                                                      | Latest Version |
|---------------|------------------------------------------------------------------|----------------|
| `bitbar`      | Put the output from any script or program in your macOS menu bar | -              |
| `corretto11`  | Amazon Corretto OpenJDK 11 distribution                          | -              |
| `corretto17`  | Amazon Corretto OpenJDK 17 distribution                          | -              |
| `corretto21`  | Amazon Corretto OpenJDK 21 distribution                          | -              |
| `corretto25`  | Amazon Corretto OpenJDK 25 distribution                          | -              |
| `shuttle`     | Simple SSH shortcut menu for macOS                               | -              |

## Usage Examples

### Installing Apache Thrift

```bash
# Install specific version of Thrift
brew install isaryx/collection/thrift@0.22

# Use in your project
thrift --version
```

### Installing Amazon Corretto JDK

```bash
# Install Corretto JDK 21
brew install --cask isaryx/collection/corretto21

# Verify installation
java -version
```

### Installing macOS Utilities

```bash
# Install BitBar for menu bar scripting
brew install --cask isaryx/collection/bitbar

# Install Shuttle for SSH shortcuts
brew install --cask isaryx/collection/shuttle
```

## Development

### Adding New Formulae

1. Create a new formula file in the `Formula/` directory
2. Follow Homebrew's [formula cookbook](https://docs.brew.sh/Formula-Cookbook)
3. Test the formula locally
4. Submit a pull request

### Adding New Casks

1. Create a new cask file in the `Casks/` directory
2. Follow Homebrew's [cask cookbook](https://docs.brew.sh/Cask-Cookbook)
3. Test the cask locally
4. Submit a pull request

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you have suggestions for improvements or new packages to add.

## License

This repository is licensed under the MIT License.
