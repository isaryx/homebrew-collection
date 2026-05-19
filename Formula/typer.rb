class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.4.4"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.4/typer-0.4.4-darwin-arm64.tar.gz"
      sha256 "5c2c5e40b2efe1a4445c2d13692a2b49c0b1e677b0000dd723ccf350d30a53c0"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.4/typer-0.4.4-darwin-amd64.tar.gz"
      sha256 "26d5651387c185cf1da7785fc4338351ce2365d356341ce589f3e571f44d6b95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.4/typer-0.4.4-linux-arm64.tar.gz"
      sha256 "d90ae3afe8f29f1bcf718c55c19855c6c2b7713265a59bda4a2505b48d6700bb"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.4/typer-0.4.4-linux-amd64.tar.gz"
      sha256 "1a0b5454f9b62f11652b6845d0f02344ace2392893291fc660b18cf838dac8a3"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.4.4", out
  end
end
