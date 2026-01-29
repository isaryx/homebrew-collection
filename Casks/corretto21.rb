# https://github.com/corretto/corretto-21/releases
cask "corretto21" do
  arch arm: "aarch64", intel: "x64"

  version "21.0.10.7.1"

  on_arm do
    sha256 "d0ca3c3afe2858572c436d1afaa23b7ca3781476ce8c3f80dac8a275a77d50d6"
  end
  on_intel do
    sha256 "8a34da4a34dd50ab7302f624cd9870d7fe38a5a70227980e6c597cb46268c2e6"
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
