# https://github.com/corretto/corretto-21/releases
cask "corretto21" do
  arch arm: "aarch64", intel: "x64"

  version "21.0.12.8.1"

  on_arm do
    sha256 "59567c0fbe11f595cd3377c67a82ce85ded1614e8a5618cf389f7cb325893d87"
  end
  on_intel do
    sha256 "248f1c3520a039d74514472be5fcea3c7efeba9ba324220aae41f4f5def57c1c"
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
