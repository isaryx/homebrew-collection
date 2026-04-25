# https://github.com/corretto/corretto-25/releases
cask "corretto25" do
  arch arm: "aarch64", intel: "x64"

  version "25.0.3.9.1"

  on_arm do
    sha256 "f4fccb2f96f979f848c133091f9624fb0dfdd97ba34318f2ab8cab568591fc58"
  end
  on_intel do
    sha256 "4181f9b02d461d1e321ed651f92b9685444aa2ccbf434ea5fe9d15c7e57129ae"
  end

  url "https://corretto.aws/downloads/resources/#{version}/amazon-corretto-#{version}-macosx-#{arch}.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://github.com/corretto/corretto-25/releases"

  livecheck do
    url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-#{arch}-macos-jdk.pkg"
    strategy :header_match do |headers|
      headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-#{arch}\.pkg}i, 1]
    end
  end

  pkg "amazon-corretto-#{version}-macosx-#{arch}.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end
