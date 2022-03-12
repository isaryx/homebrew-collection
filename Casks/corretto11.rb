cask "corretto11" do
  version "11.0.15.2.1"
  sha256 "a03045b0853aa03a875efff018022d86080c9d18a94a9f7f61357305dc511f41"

  url "https://corretto.aws/downloads/resources/#{version.sub(/-\d+/, "")}/amazon-corretto-#{version}-macosx-x64.pkg"
  name "AWS Corretto JDK"
  desc "OpenJDK distribution from Amazon"
  homepage "https://corretto.aws/"

  livecheck do
      url "https://corretto.aws/downloads/latest/amazon-corretto-#{version.major}-x64-macos-jdk.pkg"
      strategy :header_match do |headers|
        headers["location"][%r{/amazon-corretto-(\d+(?:\.\d+)+)-macosx-x64\.pkg}i, 1]
      end
    end

  pkg "amazon-corretto-#{version}-macosx-x64.pkg"

  uninstall pkgutil: "com.amazon.corretto.#{version.major}"
end