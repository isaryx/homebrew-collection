class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.0/typer-0.1.0-darwin-arm64.tar.gz"
      sha256 "2d1050aefafc6754e6681faac2d2d674b16dfbc9254fb22e4aa87263946e04fc"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.0/typer-0.1.0-darwin-amd64.tar.gz"
      sha256 "6d3a891fb7e068a41f8797752187d1b86263c7b126bacd68bda1092bb5967360"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.0/typer-0.1.0-linux-arm64.tar.gz"
      sha256 "9cae20d4b8def740f1d5965a9b181c8287592b3348d8177f69e56900d8df1e54"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.0/typer-0.1.0-linux-amd64.tar.gz"
      sha256 "c12f697d90fbe232020946f8be4f4cb51c27ed1a913866133e9b633f6d57d699"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.1.0", out
  end
end
