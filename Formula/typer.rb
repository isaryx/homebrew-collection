class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.4.2"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.2/typer-0.4.2-darwin-arm64.tar.gz"
      sha256 "1d51d732ec2bc2f45eb42b7d926c46400e94a3c3154f14d728a5d30688b1daa1"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.2/typer-0.4.2-darwin-amd64.tar.gz"
      sha256 "70869ae41d30522dc7a94d3aaeec8c8c24d2dbcbdb505fd901d40755254ba6d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.2/typer-0.4.2-linux-arm64.tar.gz"
      sha256 "8e0ca43cfc5e3b5c05fc08abc97bfb4c280c21d5aaabdd6fc086aa63e2c6f685"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.2/typer-0.4.2-linux-amd64.tar.gz"
      sha256 "f2f84070da5153c6cbfd68bffcf152094aba0bebb840926dd842900f41f69a1b"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.4.2", out
  end
end
