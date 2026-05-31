class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.3"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.3/typer-0.5.3-darwin-arm64.tar.gz"
      sha256 "ce3347fd4557844ec00cb13615d46b69e7952673c506aa6e70585ab1b5f808a7"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.3/typer-0.5.3-darwin-amd64.tar.gz"
      sha256 "b515e24d719cf37f960a4970f10b520b690e931cb3b2820248f1777145d163cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.3/typer-0.5.3-linux-arm64.tar.gz"
      sha256 "c3e10a72daf6bfda14b5ee7d546645253b1cf7934d0aa2e5ffa2a83dd4ec8718"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.3/typer-0.5.3-linux-amd64.tar.gz"
      sha256 "0e046151538ad31c468fd72b7aa4ac8709a8e57087870796686c03eef486951b"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.3", out
  end
end
