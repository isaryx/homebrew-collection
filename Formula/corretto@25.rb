class CorrettoAT25 < Formula
  desc "Amazon Corretto 25 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-25"
  version "25.0.3.9.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/25.0.3.9.1/amazon-corretto-25.0.3.9.1-macosx-aarch64.tar.gz"
      sha256 "614107ed76e9fb86d62d8cf2686a9cc4b3a11c019502ca3ba605fc5d51f4d7bb"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/25.0.3.9.1/amazon-corretto-25.0.3.9.1-macosx-x64.tar.gz"
      sha256 "0cfef7feb0f4d7d352881b08d527c22840b8fb5eaaa7552b25619edb449d6d94"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/25.0.3.9.1/amazon-corretto-25.0.3.9.1-linux-aarch64.tar.gz"
      sha256 "8b1fd78bbd1f188f3884f580be674727174635252c0d4d6dfa7cd15de51879ce"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/25.0.3.9.1/amazon-corretto-25.0.3.9.1-linux-x64.tar.gz"
      sha256 "00486fa402136f8d40512b101c645dd4db9be2b5535171530ad241cd96c1223d"
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
