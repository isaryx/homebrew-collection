class CorrettoAT11 < Formula
  desc "Amazon Corretto 11 (OpenJDK distribution)"
  homepage "https://github.com/corretto/corretto-11"
  version "11.0.31.11.1"

  on_macos do
    on_arm do
      url "https://corretto.aws/downloads/resources/11.0.31.11.1/amazon-corretto-11.0.31.11.1-macosx-aarch64.tar.gz"
      sha256 "e31cc1fd9b42bf40ec0682a027c024599ac1d84bf2447ab1f32b4caa94c08faa"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/11.0.31.11.1/amazon-corretto-11.0.31.11.1-macosx-x64.tar.gz"
      sha256 "ce278c17516502934179faff7e6d64aac0bab0e48633c792b59b70893b56a0e6"
    end
  end

  on_linux do
    on_arm do
      url "https://corretto.aws/downloads/resources/11.0.31.11.1/amazon-corretto-11.0.31.11.1-linux-aarch64.tar.gz"
      sha256 "8ee5fba821463363dc76a18049e338d12c74752430a743aa405af126a62218da"
    end
    on_intel do
      url "https://corretto.aws/downloads/resources/11.0.31.11.1/amazon-corretto-11.0.31.11.1-linux-x64.tar.gz"
      sha256 "70f6ff3668f27d1052f9e26c7a00d601774a556a49e6e9e7faa9d510ae1d0dbe"
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
