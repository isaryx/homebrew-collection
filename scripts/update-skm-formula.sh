#!/usr/bin/env bash
# Generate Formula/skm.rb from a GitHub release.
set -euo pipefail

if [[ -z "${BASH_VERSION:-}" ]]; then
  echo "run with bash: bash $0 <version>" >&2
  exit 1
fi

REPO="${SKM_REPO:-isaryx/skill-manager}"
VERSION="${1:?usage: $0 <version>  e.g. 0.2.0}"
TAG="v${VERSION}"
BASE="https://github.com/${REPO}/releases/download/${TAG}"

declare -A SLUG_SHA
while read -r hash file; do
  case "$file" in
    skm-${VERSION}-macos-arm64.tar.gz) SLUG_SHA[macos-arm64]="$hash" ;;
    skm-${VERSION}-macos-x86_64.tar.gz) SLUG_SHA[macos-x86_64]="$hash" ;;
    skm-${VERSION}-linux-arm64.tar.gz) SLUG_SHA[linux-arm64]="$hash" ;;
    skm-${VERSION}-linux-x86_64.tar.gz) SLUG_SHA[linux-x86_64]="$hash" ;;
  esac
done < <(curl -fsSL "${BASE}/SHA256SUMS")

for slug in macos-arm64 macos-x86_64 linux-arm64 linux-x86_64; do
  if [[ -z "${SLUG_SHA[$slug]:-}" ]]; then
    echo "missing checksum for skm-${VERSION}-${slug}.tar.gz in ${BASE}/SHA256SUMS" >&2
    exit 1
  fi
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cat > "${ROOT}/Formula/skm.rb" <<RUBY
class Skm < Formula
  desc "Manage AI agent skills from one local library"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "MIT"

  on_macos do
    on_arm do
      url "${BASE}/skm-${VERSION}-macos-arm64.tar.gz"
      sha256 "${SLUG_SHA[macos-arm64]}"
    end
    on_intel do
      url "${BASE}/skm-${VERSION}-macos-x86_64.tar.gz"
      sha256 "${SLUG_SHA[macos-x86_64]}"
    end
  end

  on_linux do
    on_arm do
      url "${BASE}/skm-${VERSION}-linux-arm64.tar.gz"
      sha256 "${SLUG_SHA[linux-arm64]}"
    end
    on_intel do
      url "${BASE}/skm-${VERSION}-linux-x86_64.tar.gz"
      sha256 "${SLUG_SHA[linux-x86_64]}"
    end
  end

  def install
    bin.install "skm"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/skm --version")
  end
end
RUBY

echo "wrote ${ROOT}/Formula/skm.rb"
