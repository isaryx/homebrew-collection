# https://github.com/corretto/corretto-11/releases
cask "corretto11" do
  arch arm: "aarch64", intel: "x64"

  version "11.0.32.9.1"

  on_arm do
    sha256 "5f0f80bbdf1266097431cd5ba91bce7a19f0b8f392e083f350559192a8fa3fb5"
  end
  on_intel do
    sha256 "956d8d1a164fc3269339807f71642eda6225dc369dbd411573d38d6644a300e9"
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
