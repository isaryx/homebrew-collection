cask "temurin8" do
  url "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_mac_hotspot_8u312b07.pkg",
      verified: "github.com/adoptium/"
  sha256 "2428e7fbd0dfb7416783df89398c0ccc0fa883f4fabce0e9b83388bc2109268e"

  name "Eclipse Temurin Java Development Kit"
  desc "JDK from the Eclipse Foundation (Adoptium)"
  homepage "https://adoptium.net/"

  pkg "OpenJDK8U-jdk_x64_mac_hotspot_8u312b07.pkg"
  uninstall pkgutil: "net.temurin.8.jdk"
end