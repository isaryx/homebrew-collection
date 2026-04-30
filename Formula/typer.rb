class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.2.1"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.1/typer-0.2.1-darwin-arm64.tar.gz"
      sha256 "dfb9ca2eeba16a7f127bcd679683fc136b95b898e2eacaaf068ccd683346d4da"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.1/typer-0.2.1-darwin-amd64.tar.gz"
      sha256 "960bfe8a12688629c9a7dc3dfffd31f96e9b696b49610edfdef148f027fed428"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.1/typer-0.2.1-linux-arm64.tar.gz"
      sha256 "a8a6eda97d571fa7c41ad0029388454b21ba499e60c6663f4c7f637073a0b69a"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.1/typer-0.2.1-linux-amd64.tar.gz"
      sha256 "117850d0ec13bdeee923bcd0a245bce012ebda6e2d3f0d5937e1b52e7b12ea9f"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.2.1", out
  end
end
