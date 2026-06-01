class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.5"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.5/typer-0.5.5-darwin-arm64.tar.gz"
      sha256 "fc1f1cfcc36852e944a36557b4ebbc2cbc7405166661fe8dc6b9fe043ea1de5f"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.5/typer-0.5.5-darwin-amd64.tar.gz"
      sha256 "de9379b9d1d6d87e5ce551a904d8f742c919049b188a010baa34633005463d79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.5/typer-0.5.5-linux-arm64.tar.gz"
      sha256 "c2e24fda8ad2f93e45604a250828867f6ed2d7430a5c9b280f5c3d91a2b1a5af"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.5/typer-0.5.5-linux-amd64.tar.gz"
      sha256 "838348ba8b5e00f9a934d5727fc06effd2f685f2349adfb03390a5f7aae19f52"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.5", out
  end
end
