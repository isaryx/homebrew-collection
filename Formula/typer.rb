class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.4"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.4/typer-0.3.4-darwin-arm64.tar.gz"
      sha256 "222a49666b3ebe833ff54390b3bcc5c74ce9fb5471729e3d50a5b661890e1e63"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.4/typer-0.3.4-darwin-amd64.tar.gz"
      sha256 "f66e8b428fed5d5db57ef18bb9c626cadd0417e36b72d52ed903e94dc80f2a2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.4/typer-0.3.4-linux-arm64.tar.gz"
      sha256 "e0ea8a6d575705af269155e527c44d1b65594156b222503ab143adbcbca14b0c"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.4/typer-0.3.4-linux-amd64.tar.gz"
      sha256 "7f29c164c80d8bdeef55b91ad222a05f802c90b11b4b32cab9c9a7186395d03b"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.4", out
  end
end
