# https://github.com/corretto/corretto-17
cask "corretto17" do
  version "17.0.13.11.1"
  sha256 "dfc929ddc533472052132a88ad292aaf380f5afeb1b39ecaa8a776daecb51d99"

  url "https://corretto.aws/downloads/resources/#{version.sub(/-\d+/, "")}/amazon-corretto-#{version}-macosx-aarch64.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-11/releases"

  livecheck do
      url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-aarch64-macos-jdk.pkg"
      strategy :header_match do |headers|
        headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-aarch64\.pkg}i, 1]
      end
    end

  pkg "amazon-corretto-#{version}-macosx-aarch64.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
