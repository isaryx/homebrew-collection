class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/isaryx/skill-manager"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.2/skm-0.3.2-macos-arm64.tar.gz"
      sha256 "fd301d1a4e49a1130216adab3c1eb37c8dd5f6bacec1910887972adad525d222"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.2/skm-0.3.2-macos-x86_64.tar.gz"
      sha256 "0963c3f6e7b82185f6c1505cedd20f8930b01aa224e6caeeb2be82dcc4d65eff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.2/skm-0.3.2-linux-arm64.tar.gz"
      sha256 "b83698825d994df06a610432d663f32144ca1770b54ca65590c2d09ec31ce162"
    end
    on_intel do
      url "https://github.com/isaryx/skill-manager/releases/download/v0.3.2/skm-0.3.2-linux-x86_64.tar.gz"
      sha256 "00238503bc191e75a1c3fd4d346fe4f19fa1502ee917e064656b0c7d2312655e"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skm --version")
  end
end
