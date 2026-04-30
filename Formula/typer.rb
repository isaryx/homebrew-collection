class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.1.3"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.3/typer-0.1.3-darwin-arm64.tar.gz"
      sha256 "d40decd3432e09273bab2b01b7598b4a747baa9d9d99b43d7e2ee6a5a761c004"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.3/typer-0.1.3-darwin-amd64.tar.gz"
      sha256 "e11a065e4497be4c9cb56fd0923171961fa439085de1edea53bce3b5b31eb382"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.3/typer-0.1.3-linux-arm64.tar.gz"
      sha256 "7ed3a7c6302e3af0c69ff30dc22477c127bb6b60af41da3e637de04dd53fb36f"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.1.3/typer-0.1.3-linux-amd64.tar.gz"
      sha256 "ed1841fa8e2d9a95d94082e3198f49976d08196d6f8e03b510cf1ed30445cc9f"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.1.3", out
  end
end
