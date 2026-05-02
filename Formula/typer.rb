class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.3"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.3/typer-0.3.3-darwin-arm64.tar.gz"
      sha256 "f45ae3f09121eacabd1af3d0bb8ab3d901268a6c8af5b6e5565ff4d3c1a35cf7"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.3/typer-0.3.3-darwin-amd64.tar.gz"
      sha256 "4812ec1772e5a926b139cd131582c2e0a76d39f7fa0e40407d51e66fa9e6e89c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.3/typer-0.3.3-linux-arm64.tar.gz"
      sha256 "fc47d6c889c9de0b60cc90c62f1867019b47da701bc7a1f142a41f8bf20a9a42"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.3/typer-0.3.3-linux-amd64.tar.gz"
      sha256 "094f1aa6a2c762e61753406e3a899ab79a505f99ad5221307609875bb2d872d8"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.3", out
  end
end
