cask "corretto11" do
    arch = Hardware::CPU.intel? ? "x64" : "aarch64"
  
    version "11.0.14.9.1"
    md5 "43126576de874ea7c4f9aa3b04dd140a"
  
    url "https://corretto.aws/downloads/resources/11.0.14.9.1/amazon-corretto-11.0.14.9.1-macosx-x64.pkg"
    name "AWS Corretto JDK"
    desc "OpenJDK distribution from Amazon"
    homepage "https://corretto.aws/"
  
    pkg "amazon-corretto-11.0.14.9.1-macosx-x64.pkg"
  
    uninstall pkgutil: "com.amazon.corretto.11"
  end