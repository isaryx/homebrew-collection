class CorrettoAT17 < Formula
  desc "Amazon Corretto 17 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-17"
  version "17.0.20.8.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/17.0.20.8.1/amazon-corretto-17.0.20.8.1-macosx-aarch64.tar.gz"
      sha256 "786a9bbb94d2d077ca5618a80eec4c1a909595fbe24b617d57f50d360f96990e"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/17.0.20.8.1/amazon-corretto-17.0.20.8.1-macosx-x64.tar.gz"
      sha256 "36b2e4f270e8b70aafe8c1ec8c254cc323675fd911d1d3f49981e3f18f73e638"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/17.0.20.8.1/amazon-corretto-17.0.20.8.1-linux-aarch64.tar.gz"
      sha256 "7e3f37d58e39f5879e3c10412177b75ccbf85b54b267b1c06d7da19a28cf9cfc"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/17.0.20.8.1/amazon-corretto-17.0.20.8.1-linux-x64.tar.gz"
      sha256 "89b50d4ef5d27ce1f8e5cad616525e14f7665b7b4a1ffca85381b0e21401034f"
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
