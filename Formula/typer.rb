class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.1/typer-0.0.1-darwin-arm64.tar.gz"
      sha256 "fa195f105f930d892d7b9f6bf6e25910abeeedc259e578041dbf68fea6c40beb"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.1/typer-0.0.1-darwin-amd64.tar.gz"
      sha256 "52cbef3078e13f8387b24c8f95f44d69f17a4ca82a9f6d104f6fb7f148c42fc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.1/typer-0.0.1-linux-arm64.tar.gz"
      sha256 "d479569ef1fa6d807fb4dc07a267557e2c6380ccb24c831e6e4a0df07788f2ff"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.1/typer-0.0.1-linux-amd64.tar.gz"
      sha256 "eb9caebcc691f5934f424620a721cf8997561f3cb2946369784a881bf2d3e7c9"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.0.1", out
  end
end
