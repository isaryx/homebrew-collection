class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.3.2"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.2/typer-0.3.2-darwin-arm64.tar.gz"
      sha256 "2bf54841189d111330a62575433d43c82f431a0d171a2b0c9716365acedca117"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.2/typer-0.3.2-darwin-amd64.tar.gz"
      sha256 "6d2df500fa61839b9be512af1e32c575253671f207ad6f9008e349f1b229c41a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v0.3.2/typer-0.3.2-linux-arm64.tar.gz"
      sha256 "1e43eba3b538e0d896ff60a93337ff6ca068393746396fc7b1be61ae233346d5"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v0.3.2/typer-0.3.2-linux-amd64.tar.gz"
      sha256 "51e096c3c5371ae69786eb8d7bebe722a3aeb64a09c7a2eddfdaf53f3f7c2274"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.3.2", out
  end
end
