class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.1.2"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.2/typer-0.1.2-darwin-arm64.tar.gz"
      sha256 "cfbce0b971b8eefe883e3565203271c39d42ee42650395716a075deb38f429d8"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.2/typer-0.1.2-darwin-amd64.tar.gz"
      sha256 "fdecc374131e0695340b2519d4eddab7840bf067cb184890343c6d811da682eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.2/typer-0.1.2-linux-arm64.tar.gz"
      sha256 "7403b2b20c6a21714d9cd844951c41482d2e353f287c9929635eaaf6c6f024ba"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.2/typer-0.1.2-linux-amd64.tar.gz"
      sha256 "3b1c2255c3e95670fcc1bd3d9411518b86cdd035a5f997dbf7b0714d5457f6ed"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.1.2", out
  end
end
