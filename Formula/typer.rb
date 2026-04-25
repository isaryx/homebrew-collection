class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.0.2"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.2/typer-0.0.2-darwin-arm64.tar.gz"
      sha256 "0a51cf2223d45f89a8d769a81c965e0cef0ff515ae27771ac4b559286f043c81"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.2/typer-0.0.2-darwin-amd64.tar.gz"
      sha256 "fcfbde4f5b0e7516094a8e31b2b571af0aaf3a19abd019a6f291d214342b7575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.2/typer-0.0.2-linux-arm64.tar.gz"
      sha256 "23d1f3d5c0fdc6002f9366c753c0073b05eada50ad1b7651b9e6f846524eb56d"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.0.2/typer-0.0.2-linux-amd64.tar.gz"
      sha256 "ce5912edadee52a6ad42930d4faf491b3c22d10555ef3a4dfc6824cca9603841"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.0.2", out
  end
end
