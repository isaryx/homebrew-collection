# https://github.com/corretto/corretto-17/releases
cask "corretto17" do
  arch arm: "aarch64", intel: "x64"

  version "17.0.18.8.1"

  on_arm do
    sha256 "d4c1fb8a37523bb0ba722fdd1e46b3904d62860dc3868a553a202d556ddc734a"
  end
  on_intel do
    sha256 "aa5b451ccb8cfa90e55c0f38cee9f02183fafa8f905ddff71e1dd8034dff5e33"
  end

  url "https://corretto.aws/downloads/resources/#{version}/amazon-corretto-#{version}-macosx-#{arch}.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-17/releases"

  livecheck do
    url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-#{arch}-macos-jdk.pkg"
    strategy :header_match do |headers|
      headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-#{arch}\.pkg}i, 1]
    end
  end

  pkg "amazon-corretto-#{version}-macosx-#{arch}.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
