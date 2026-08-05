# https://github.com/corretto/corretto-25/releases
cask "corretto25" do
  arch arm: "aarch64", intel: "x64"

  version "25.0.4.7.1"

  on_arm do
    sha256 "ded718c287ef3ea6b595576a6532f14ab9919137bc28453ff1b1fba491cbe4ad"
  end
  on_intel do
    sha256 "bbdf267d7bf4a258f53662b266b194d652588fa60895a8147b057c26ac277af2"
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
