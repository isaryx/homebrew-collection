class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.6"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.6/typer-0.3.6-darwin-arm64.tar.gz"
      sha256 "1ce6dc407146efdc1adda9536a4de5f368103960527c7854f89ce696aaaef17c"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.6/typer-0.3.6-darwin-amd64.tar.gz"
      sha256 "f70cb3380e8354ccdf5ae342391b6d0393cd8fa4cf7c3f7e4bc06c8181e35656"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.6/typer-0.3.6-linux-arm64.tar.gz"
      sha256 "a8217140d6e05e112c1d0489cf3400b7ee9223b43bb11fd5b816d751aaa181ab"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.6/typer-0.3.6-linux-amd64.tar.gz"
      sha256 "2614faad8021c69351b9147231d7c47ec9c81203563e3d941586607bfde72b8e"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.6", out
  end
end
