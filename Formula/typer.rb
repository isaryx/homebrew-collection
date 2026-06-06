class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.6"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.6/typer-0.5.6-darwin-arm64.tar.gz"
      sha256 "2c1a70ee28e36219a6dc19cf88c4929487fe936d93df64c4bec5d354d1f1dc1e"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.6/typer-0.5.6-darwin-amd64.tar.gz"
      sha256 "1f1641fbe6b72e108066c83b72e7d13bc6d9086f39546baed3491aba39378842"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.6/typer-0.5.6-linux-arm64.tar.gz"
      sha256 "5f183ef5b5c4d32c2b779f6e553bee43a5496b70f6ec64c5bc6872f76439f5bc"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.6/typer-0.5.6-linux-amd64.tar.gz"
      sha256 "1bbb67f67e31c63cddf2a62ca78e87b873b8d084d2a73b9f9b30f1136104eb8b"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.6", out
  end
end
