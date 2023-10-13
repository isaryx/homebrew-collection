cask "corretto11" do
  version "11.0.20.9.1"
  sha256 "bbb6dbb917b8def5fa2c7e94a52c8b92020d6e38c5f55634296facff3168e4b4"

  url "https://corretto.aws/downloads/resources/#{version.sub(/-\d+/, "")}/amazon-corretto-#{version}-macosx-x64.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-11/releases"

  livecheck do
      url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-x64-macos-jdk.pkg"
      strategy :header_match do |headers|
        headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-x64\.pkg}i, 1]
      end
    end

  pkg "amazon-corretto-#{version}-macosx-x64.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
