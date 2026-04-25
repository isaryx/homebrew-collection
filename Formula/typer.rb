class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.0.3"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.3/typer-0.0.3-darwin-arm64.tar.gz"
      sha256 "2210c080d287809cd7b8d15e5cb5478dbb5c4bdaf8e6b76cc48c726d57a6b6de"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.3/typer-0.0.3-darwin-amd64.tar.gz"
      sha256 "85a5b082c0c14b3b147879ac50bec9d538d76b3ec5005a840969f2750b4c0f3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.3/typer-0.0.3-linux-arm64.tar.gz"
      sha256 "65cce86c2a00964a3b08df135d2fa7133c7d44633af1fa584641a24dffb42b4a"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.3/typer-0.0.3-linux-amd64.tar.gz"
      sha256 "a7c42f7824eaf0b132a0aa5ad867967c3692574993418a6166f4bb00e4ea1853"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.0.3", out
  end
end
