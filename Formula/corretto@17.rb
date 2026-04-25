class CorrettoAT17 < Formula
  desc "Amazon Corretto 17 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-17"
  version "17.0.19.10.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/17.0.19.10.1/amazon-corretto-17.0.19.10.1-macosx-aarch64.tar.gz"
      sha256 "3ba2ab957f60e33c6164d7330b1f6c9f48b5ffd60e4cc9bbcc67def319c29a29"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/17.0.19.10.1/amazon-corretto-17.0.19.10.1-macosx-x64.tar.gz"
      sha256 "6d3b3e367e1a77b9867bc1b5aa925b1f05d76a0ec62b075e375fa91fdcea0e93"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/17.0.19.10.1/amazon-corretto-17.0.19.10.1-linux-aarch64.tar.gz"
      sha256 "1b9f75b5a2f740ab3305577858e2fc87dad827b60678d4573234d6357be59fa8"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/17.0.19.10.1/amazon-corretto-17.0.19.10.1-linux-x64.tar.gz"
      sha256 "d0f1b880445691425511c3aa62cb89889f03a71c2a43597a3df174fc01d3f3a0"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      For some Java-based tools, you may need:
        export JAVA_HOME=#{opt_libexec}
    EOS
  end

  test do
    assert_match version.major.to_s, shell_output("#{bin}/java -version 2>&1")
  end
end
