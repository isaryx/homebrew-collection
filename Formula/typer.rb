class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.4"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.4/typer-0.5.4-darwin-arm64.tar.gz"
      sha256 "d230468e40ccdc72da3e880423c8cedda3a3cb98e693ad384e003a4a3b6f408b"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.4/typer-0.5.4-darwin-amd64.tar.gz"
      sha256 "211c84e3bc150e97b4c91f91a97345e7c171cdfbf8574ed3e690521f5251546d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.4/typer-0.5.4-linux-arm64.tar.gz"
      sha256 "81dfd28aa7a3aca2e94453aa3a4f336ca106ce513de56cc231a1cecdf10996ee"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.4/typer-0.5.4-linux-amd64.tar.gz"
      sha256 "996ee1b5ed957c31bba680c8a5a8a28f097d977a1a6d54f503d6644500134837"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.4", out
  end
end
