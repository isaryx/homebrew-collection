# https://github.com/corretto/corretto-25/releases
cask "corretto25" do
  arch arm: "aarch64", intel: "x64"

  version "25.0.1.8.1"

  on_arm do
    sha256 "b1112d1991daed37952b22a866e0ff5cf951513edaded3c3b876636a12211d4c"
  end
  on_intel do
    sha256 "68c40e36aaa53114818333e34d35599a49e252e5abc1b48604e4fc3ee1e869cc"
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
