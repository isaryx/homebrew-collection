class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/isaryx/skill-manager"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.0/skm-0.2.0-macos-arm64.tar.gz"
      sha256 "981f516f628064fa0d8514687f88db6289552aaca6affc5b257048e6f7b05994"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.0/skm-0.2.0-macos-x86_64.tar.gz"
      sha256 "46fa9c252206590a1ac28725c50e873a0beaa280c43f6ebb87136039f1c8ad2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.0/skm-0.2.0-linux-arm64.tar.gz"
      sha256 "3f6dec8cb5483b0194562d4957323f45280bc5a10dc930cec2b8a3da1cc20a3d"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.2.0/skm-0.2.0-linux-x86_64.tar.gz"
      sha256 "f143c511de299487f2c141bd5e153e01a10369f429baf9a85bb91f2600cd590b"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skm --version")
  end
end
