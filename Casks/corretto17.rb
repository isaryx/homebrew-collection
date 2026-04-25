# https://github.com/corretto/corretto-17/releases
cask "corretto17" do
  arch arm: "aarch64", intel: "x64"

  version "17.0.19.10.1"

  on_arm do
    sha256 "75a91b76889b5a148a903bb021210ecb2f00cc63c1bea1d330ffbbace238dbf7"
  end
  on_intel do
    sha256 "fc6b69a1fc8be3893b14ed64a473e8eab5664121f691600e551eb74a3d056ccf"
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
