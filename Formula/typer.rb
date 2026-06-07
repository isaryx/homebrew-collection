class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.6.0"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.6.0/typer-0.6.0-darwin-arm64.tar.gz"
      sha256 "6df5b3a71ed64ad425bc70ac920aa7ddafa35ed4e90e8b0d202511db734a9059"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.6.0/typer-0.6.0-darwin-amd64.tar.gz"
      sha256 "5c0db908bdf9bb83a74bbecd44a517c7f9e065443f4d554ce21fd0af60150564"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.6.0/typer-0.6.0-linux-arm64.tar.gz"
      sha256 "aa6ed17b539e8920c7ac3166efe66aa9db5e172007f128fa4c3eda7447c2923d"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.6.0/typer-0.6.0-linux-amd64.tar.gz"
      sha256 "68be9609719dcee72b7704321fa7a9da3aeb2027166c4040f4dcb0bcac8ea38c"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer --version")
    assert_match "0.6.0", out
  end
end
