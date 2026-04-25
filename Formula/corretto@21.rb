class CorrettoAT21 < Formula
  desc "Amazon Corretto 21 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-21"
  version "21.0.11.10.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/21.0.11.10.1/amazon-corretto-21.0.11.10.1-macosx-aarch64.tar.gz"
      sha256 "c6c9ba09ef0ae741aa04cfbd5ef8a6b75dd2d26034a1de0808ee7976a04446ea"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/21.0.11.10.1/amazon-corretto-21.0.11.10.1-macosx-x64.tar.gz"
      sha256 "fb08b09af67ca930d6868405263259d5e43faab89216f6886780e544fd700f00"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/21.0.11.10.1/amazon-corretto-21.0.11.10.1-linux-aarch64.tar.gz"
      sha256 "bc419602d71d819bce147239fbdc48bfbc900fa1d60693537fb9a22bd6b86475"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/21.0.11.10.1/amazon-corretto-21.0.11.10.1-linux-x64.tar.gz"
      sha256 "5b4dc8817df13f88f9bfc434e5d018adb535889ff2fe0ccf758bcebcc216f394"
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
