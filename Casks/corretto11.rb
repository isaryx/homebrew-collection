# https://github.com/corretto/corretto-11/releases
cask "corretto11" do
  arch arm: "aarch64", intel: "x64"

  version "11.0.30.7.1"

  on_arm do
    sha256 "f5addaf5e6351e17ef88c7f7afb1ef571f41bd77444b4d0afef16333d5366e8f"
  end
  on_intel do
    sha256 "ff050df95529417b75f44e0a06b9f47f61f3dc462bd10c024b45364ff2b240ee"
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
