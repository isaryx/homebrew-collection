cask "corretto11" do
    version "11.0.14.9.1"
    sha256 "3d76035ea371806eb8e2c809da3f588f30464d5784d0c161d504f69a0bf3446f"
  
    url "https://corretto.aws/downloads/resources/#{version.sub(/-\d+/, "")}/amazon-corretto-#{version}-macosx-x64.pkg"
    name "AWS Corretto JDK"
    desc "OpenJDK distribution from Amazon"
    homepage "https://corretto.aws/"
  
    pkg "amazon-corretto-#{version}-macosx-x64.pkg"
  
    uninstall pkgutil: "com.amazon.corretto.#{version.major}"
  end