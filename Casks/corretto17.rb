# https://github.com/corretto/corretto-17/releases
cask "corretto17" do
  arch arm: "aarch64", intel: "x64"

  version "17.0.20.8.1"

  on_arm do
    sha256 "d4113af4b78e7083c7318fbec0b441a71538aae6b8e2014d720b2bfcb03044a1"
  end
  on_intel do
    sha256 "4b8e2b4e24cc8701cc863761d0da6c89ea51bf79bc5035081ca670fad7890342"
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
