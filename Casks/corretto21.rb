# https://github.com/corretto/corretto-21/releases
cask "corretto21" do
  arch arm: "aarch64", intel: "x64"

  version "21.0.11.10.1"

  on_arm do
    sha256 "21f97a420152554b2e35f892f22a1d1f9460aacbef1badcf9c48dbea8f7ab6c7"
  end
  on_intel do
    sha256 "3b946d1cf350702f7bea14a4cfc26d3db163889b1a03feda058948b48ee07717"
  end

  url "https://corretto.aws/downloads/resources/#{version}/amazon-corretto-#{version}-macosx-#{arch}.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-21/releases"

  livecheck do
    url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-#{arch}-macos-jdk.pkg"
    strategy :header_match do |headers|
      headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-#{arch}\.pkg}i, 1]
    end
  end

  pkg "amazon-corretto-#{version}-macosx-#{arch}.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
