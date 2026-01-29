# https://github.com/corretto/corretto-11/releases
cask "corretto11" do
  arch arm: "aarch64", intel: "x64"

  version "11.0.29.7.1"

  on_arm do
    sha256 "233008d87989692ada759ce061269425da636f09d305ec527ef49d0b70cea261"
  end
  on_intel do
    sha256 "9aea81e586474f28ef12a2b16ad5b31a82bf4fb3728d534f4fe7012d9b7d17bb"
  end

  url "https://corretto.aws/downloads/resources/#{version}/amazon-corretto-#{version}-macosx-#{arch}.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-11/releases"

  livecheck do
    url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-#{arch}-macos-jdk.pkg"
    strategy :header_match do |headers|
      headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-#{arch}\.pkg}i, 1]
    end
  end

  pkg "amazon-corretto-#{version}-macosx-#{arch}.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
