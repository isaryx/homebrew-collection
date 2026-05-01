class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.1"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.1/typer-0.3.1-darwin-arm64.tar.gz"
      sha256 "2db0bcac590ef0863f996ea5f69485f90e150e1f809946c26aba700e3206ca32"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.1/typer-0.3.1-darwin-amd64.tar.gz"
      sha256 "d100d8e95ca06125a21440dcff733d036cc6e4904a102052621f056d5e089ea6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.1/typer-0.3.1-linux-arm64.tar.gz"
      sha256 "9677f9006022c4c8d55f8d0099045dfe948264975eaf3d6fff6bdeda265f0fcd"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.1/typer-0.3.1-linux-amd64.tar.gz"
      sha256 "7e016e96ac36fa4426aa9e1a2e028325bd4da55ee497e49b4d760a38b1f2bfa6"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.1", out
  end
end
