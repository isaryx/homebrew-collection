class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.5"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.5/typer-0.3.5-darwin-arm64.tar.gz"
      sha256 "08c9d3bf73790dcf0bc19159da76aa5a92b41c8ae18be8fe5982d7092e52fae2"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.5/typer-0.3.5-darwin-amd64.tar.gz"
      sha256 "e92b01836bc63a6a8b0ac99a1969adef88ac799a28e15520fa48065187385873"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.5/typer-0.3.5-linux-arm64.tar.gz"
      sha256 "54f0338790a9b5d4f9dc601fc80b5bf8371754fd98993929c457c0418bb2b33f"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.5/typer-0.3.5-linux-amd64.tar.gz"
      sha256 "752b7ad50646ae7409dc4830b7e336dc02ffdc1a5b394b6a45faa0bf5a50b57d"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.5", out
  end
end
