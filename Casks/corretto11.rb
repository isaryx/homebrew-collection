# https://github.com/corretto/corretto-11/releases
cask "corretto11" do
  arch arm: "aarch64", intel: "x64"

  version "11.0.31.11.1"

  on_arm do
    sha256 "cb02bd6f26d4a9649f0e9d9e2c06cc3e22793782f1aad77ec15a2aa8e8d8b96e"
  end
  on_intel do
    sha256 "b63be13766c674bd199d6896462843048da42f67e85d109b1b51f9671bdaa44f"
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
