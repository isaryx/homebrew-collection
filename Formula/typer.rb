class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.1/typer-0.1.1-darwin-arm64.tar.gz"
      sha256 "c9b02d02d47201b766696d0783241a9a14bebcb0e8b1a901998dfeee1f04625f"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.1/typer-0.1.1-darwin-amd64.tar.gz"
      sha256 "fca5abcf4de75ad6e6ab414c6aa31f14c2db88acebb1d6ebfd17a9da2ae779d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.1/typer-0.1.1-linux-arm64.tar.gz"
      sha256 "f02eb10f88050c1bd820fd25b5952cf4b85a7b94ea6462504424ff477e81b7f5"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.1/typer-0.1.1-linux-amd64.tar.gz"
      sha256 "375a69c5289c40056fba2c956bad6bad76b9f76f233337f348da80251bbc3f13"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.1.1", out
  end
end
