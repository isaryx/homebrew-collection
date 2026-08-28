class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/isaryx/skill-manager"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.1/skm-0.2.1-macos-arm64.tar.gz"
      sha256 "534ea6834aaf1dfd14ed7b78c364e184424a7b770d1d64f59a9ec9a0ea43c84d"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.1/skm-0.2.1-macos-x86_64.tar.gz"
      sha256 "6d69a787f1b0c384b8d3623c7e891d9cfd9adb6f49d29cc56a2709730eb31717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.1/skm-0.2.1-linux-arm64.tar.gz"
      sha256 "c6f4fe5f3aeb8e26578331ff255c8f99eee991867b55beeb055f36f9e6edfa9f"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.1/skm-0.2.1-linux-x86_64.tar.gz"
      sha256 "9ef8e1adae1d5142d91bb26d09b019eecec5813528d9f7084425bb76a40cc47a"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skm --version")
  end
end
