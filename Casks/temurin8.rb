cask "temurin8" do
  version '8,312,b07'
  sha256 "2428e7fbd0dfb7416783df89398c0ccc0fa883f4fabce0e9b83388bc2109268e"

  url "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u#{version.csv[1]}-#{version.csv[2]}/OpenJDK8U-jdk_x64_mac_hotspot_8u#{version.csv[1]}#{version.csv[2]}.pkg",
      verified: "github.com/adoptium/"

  name "Eclipse Temurin Java Development Kit"
  desc "JDK from the Eclipse Foundation (Adoptium)"
  homepage "https://adoptium.net/"

  pkg "OpenJDK8U-jdk_x64_mac_hotspot_8u#{version.csv[1]}#{version.csv[2]}.pkg"
  uninstall pkgutil: "net.temurin.8.jdk"
end