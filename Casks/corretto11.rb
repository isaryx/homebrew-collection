cask "corretto11" do
    arch = Hardware::CPU.intel? ? "x64" : "aarch64"
  
    version "11.0.14.9.1"
    sha256 "3d76035ea371806eb8e2c809da3f588f30464d5784d0c161d504f69a0bf3446f"
  
    url "https://corretto.aws/downloads/resources/11.0.14.9.1/amazon-corretto-11.0.14.9.1-macosx-x64.pkg"
    name "AWS Corretto JDK"
    desc "OpenJDK distribution from Amazon"
    homepage "https://corretto.aws/"
  
    pkg "amazon-corretto-11.0.14.9.1-macosx-x64.pkg"
  
    uninstall pkgutil: "com.amazon.corretto.11"
  end