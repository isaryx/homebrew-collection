class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.1"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.1/typer-0.5.1-darwin-arm64.tar.gz"
      sha256 "be5461628aad0de583acf1fb21ec21cb18ae7f74742af30289b652571f176775"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.1/typer-0.5.1-darwin-amd64.tar.gz"
      sha256 "258650212f88f88060210cc704b662fb93ca85826f562a200e0aa440a5092faf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.1/typer-0.5.1-linux-arm64.tar.gz"
      sha256 "e3423edd5912808f57f9255194031812505843e296bc9dbc1a53341868111187"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.1/typer-0.5.1-linux-amd64.tar.gz"
      sha256 "cf5c9d1b07d7c07d7fc6008ad2ee2e24a066af16f6bb799e90b8e269a428d94b"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.1", out
  end
end
