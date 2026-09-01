class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/isaryx/skill-manager"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.1/skm-0.3.1-macos-arm64.tar.gz"
      sha256 "ea4119f10bd822b3e72ae85933c32f5a2c1eabc331936344fe15363e9d37553e"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.1/skm-0.3.1-macos-x86_64.tar.gz"
      sha256 "e6ded524dc7e34878699ad635d7bf4533d8197f55682fcedf6c6082dacd5d39c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.1/skm-0.3.1-linux-arm64.tar.gz"
      sha256 "325be5b38a0560b57f47e0c1ca2fc1340c106239218138522cccdc9acbb34355"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.1/skm-0.3.1-linux-x86_64.tar.gz"
      sha256 "0193e00f2cd6e7d2d9193ae8ad8fcc799f4fd0740145abb74372fc69f9a6e15f"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skm --version")
  end
end
