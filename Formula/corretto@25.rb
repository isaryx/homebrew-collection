class CorrettoAT25 < Formula
  desc "Amazon Corretto 25 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-25"
  version "25.0.4.7.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/25.0.4.7.1/amazon-corretto-25.0.4.7.1-macosx-aarch64.tar.gz"
      sha256 "41e185be6b230cff4e9c85d33f9b092274a32e42113087f26d3b2e4f7909ab78"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/25.0.4.7.1/amazon-corretto-25.0.4.7.1-macosx-x64.tar.gz"
      sha256 "840b857016f2ab1a60a2aa5a68584b1da55f4ab953c1e2a207bde0a5114f683d"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/25.0.4.7.1/amazon-corretto-25.0.4.7.1-linux-aarch64.tar.gz"
      sha256 "90a07c1c693ac9333a8a6ec79432f0d13c0564fec6617b0222d43f86858f65b8"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/25.0.4.7.1/amazon-corretto-25.0.4.7.1-linux-x64.tar.gz"
      sha256 "1d03a3bd5091728492d92f0ef341aca7d8885ece9a150119558f3e3d62b58745"
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
