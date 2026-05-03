class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.4.3"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.3/typer-0.4.3-darwin-arm64.tar.gz"
      sha256 "d40aa2e1e96b97a4e0af832f6b1b7717a30dc43181d3d51d7b25ce5f3149d8e4"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.3/typer-0.4.3-darwin-amd64.tar.gz"
      sha256 "d595ec9d5d6e5fbbddb7c36193a093a1ce6b35818e1e8e400c35120d0803c7b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.4.3/typer-0.4.3-linux-arm64.tar.gz"
      sha256 "a813e71f5afde4ea2020d88ade0a634a9f67278bd2092180b0e42c77747c7a9f"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.4.3/typer-0.4.3-linux-amd64.tar.gz"
      sha256 "a0ebb05ee12bbb0fa0de9f805abce75d170fb1a998b0a8709274ee68f9fce48a"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.4.3", out
  end
end
