class Typer < Formula
  desc "Cross-platform typing trainer CLI"
  homepage "https://github.com/isaryx/typer"
  version "0.2.0"
  on_macos do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.0/typer-0.2.0-darwin-arm64.tar.gz"
      sha256 "ca67d4fde40881aad62946355c0066d597395ddc4bb705240694072817a1e924"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.0/typer-0.2.0-darwin-amd64.tar.gz"
      sha256 "e366a917e824f1fcde86d61ec38f549888622bcce36acebf8ec80e57f5d59b32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.0/typer-0.2.0-linux-arm64.tar.gz"
      sha256 "0cfcbbed811e7561b52237cc752f9554723c228d63dc22a33aa54e2858dbca74"
    end
    on_intel do
      url "https://github.com/isaryx/typer/releases/download/v.0.2.0/typer-0.2.0-linux-amd64.tar.gz"
      sha256 "234543efcdf098c8b6053ee7dedd98afbb8b64bd498e40d4e954e680ff9f1dc7"
    end
  end

  def install
    bin.install Dir["typer-*"].first => "typer"
  end

  test do
    out = shell_output("#{bin}/typer version")
    assert_match "0.2.0", out
  end
end
