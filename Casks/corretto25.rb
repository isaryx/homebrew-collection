# https://github.com/corretto/corretto-25/releases
cask "corretto25" do
  arch arm: "aarch64", intel: "x64"

  version "25.0.2.10.1"

  on_arm do
    sha256 "cee9506927e1fb798aedd2d488f3961c43c0b3766a259fb8fd03c18b6cd66f24"
  end
  on_intel do
    sha256 "2c21446eec58bf80d8cfbf3c002a8d50a4077960e193d74fdc024f5f4c9dd7e8"
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
