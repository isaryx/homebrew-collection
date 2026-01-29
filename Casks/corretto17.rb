# https://github.com/corretto/corretto-17/releases
cask "corretto17" do
  arch arm: "aarch64", intel: "x64"

  version "17.0.17.10.1"

  on_arm do
    sha256 "adc66d1cdd597a59b065abc059bcf51d3f71c2df2d1e78b2a00bda65898544f6"
  end
  on_intel do
    sha256 "08b4c11575e80127bbbdcdaa881cdbcc216b2f759228044dc295c3ad78b063c5"
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
