class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/isaryx/skill-manager"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.3/skm-0.3.3-macos-arm64.tar.gz"
      sha256 "b5daeca1e4a7e4eb780f0d4fe9c623122d828efe50b3855a66828dbb0f2d0a70"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.3/skm-0.3.3-macos-x86_64.tar.gz"
      sha256 "0a80461d9f750780298b53ced01d391344939a814a0984178c19f87eaa26a223"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.3/skm-0.3.3-linux-arm64.tar.gz"
      sha256 "9a4e614e380dcbabbce6fbe5b4c3bc740e90a32d732539ab3da3472a551ee63c"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.3/skm-0.3.3-linux-x86_64.tar.gz"
      sha256 "ef5efaade9621df787f69d137db9cb90b945a2790361803773a53c0816a8a110"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skm --version")
  end
end
