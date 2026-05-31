class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.5.2"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.2/typer-0.5.2-darwin-arm64.tar.gz"
      sha256 "394f725530aa80c38f437713acce10a1d868d7b832378c3440083a6cb3aa3181"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.2/typer-0.5.2-darwin-amd64.tar.gz"
      sha256 "15ef6796c0b6ac07498dd7e6d895d612e959764db2b105b583a8b5a84643ddd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.5.2/typer-0.5.2-linux-arm64.tar.gz"
      sha256 "2db98cff80106440d69566ccb0fbdffd8881162a9689cfc2982ec906688dd60b"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.5.2/typer-0.5.2-linux-amd64.tar.gz"
      sha256 "10ba3e916a5581d5b1c11bc5fd41deda2a544f48a08dbb4a187c0e22c45d6d75"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.5.2", out
  end
end
