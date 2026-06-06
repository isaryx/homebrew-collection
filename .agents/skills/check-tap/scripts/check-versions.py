#!/usr/bin/env python3
"""Check tap package versions against upstream."""

from __future__ import annotations

import json
import re
import sys
import urllib.error
import urllib.request
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
CASKS_DIR = ROOT / "Casks"
FORMULA_DIR = ROOT / "Formula"

LTS_MAJORS = [8, 11, 17, 21, 25, 29, 33]
HARD_SKIP = frozenset({"bitbar", "shuttle"})

CORRETTO_RE = re.compile(r"/amazon-corretto-(\d+(?:\.\d+)+)-macosx-", re.I)
VERSION_RE = re.compile(r'^\s+version\s+"([^"]+)"', re.M)
URL_RE = re.compile(r'url\s+"([^"]+)"')
HOMEPAGE_RE = re.compile(r'homepage\s+"([^"]+)"')
GITHUB_RE = re.compile(r'github\.com/([^/]+/[^/"\']+)')
THRIFT_URL_RE = re.compile(r"thrift/(\d+\.\d+\.\d+)/")


@dataclass
class Package:
    kind: str
    name: str
    version: str
    homepage: str = ""
    url: str = ""


@dataclass
class CheckResult:
    package: Package
    upstream: str | None
    status: str
    note: str = ""


def fetch_json(url: str) -> object | None:
    req = urllib.request.Request(url)
    req.add_header("User-Agent", "homebrew-collection-check-tap/1.0")
    req.add_header("Accept", "application/vnd.github+json")
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            return json.load(resp)
    except (urllib.error.URLError, json.JSONDecodeError, TimeoutError):
        return None


def read_package(path: Path, kind: str) -> Package | None:
    text = path.read_text()
    version_match = VERSION_RE.search(text)
    if version_match:
        version = version_match.group(1)
    else:
        url_match = URL_RE.search(text)
        if not url_match:
            return None
        thrift = THRIFT_URL_RE.search(url_match.group(1))
        version = thrift.group(1) if thrift else "unknown"

    hp = HOMEPAGE_RE.search(text)
    url_match = URL_RE.search(text)
    homepage = hp.group(1) if hp else ""
    url = url_match.group(1) if url_match else ""

    return Package(kind=kind, name=path.stem, version=version, homepage=homepage, url=url)


def discover_packages() -> list[Package]:
    packages: list[Package] = []
    for directory, kind in ((CASKS_DIR, "cask"), (FORMULA_DIR, "formula")):
        for path in sorted(directory.glob("*.rb")):
            pkg = read_package(path, kind)
            if pkg:
                packages.append(pkg)
    return packages


def corretto_upstream(major: int) -> str | None:
    url = (
        f"https://corretto.aws/downloads/latest/"
        f"amazon-corretto-{major}-aarch64-macos-jdk.pkg"
    )
    req = urllib.request.Request(url, method="HEAD")
    req.add_header("User-Agent", "homebrew-collection-check-tap/1.0")
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            match = CORRETTO_RE.search(resp.url)
            return match.group(1) if match else None
    except (urllib.error.URLError, TimeoutError):
        return None


def github_latest_tag(repo: str) -> str | None:
    data = fetch_json(f"https://api.github.com/repos/{repo}/releases/latest")
    if isinstance(data, dict) and data.get("tag_name"):
        return str(data["tag_name"]).lstrip("v")
    data = fetch_json(f"https://api.github.com/repos/{repo}/tags?per_page=1")
    if isinstance(data, list) and data:
        return str(data[0]["name"]).lstrip("v")
    return None


def github_release_tags(repo: str, limit: int = 30) -> list[str]:
    data = fetch_json(
        f"https://api.github.com/repos/{repo}/releases?per_page={limit}"
    )
    if not isinstance(data, list):
        return []
    return [
        tag
        for release in data
        if (tag := str(release.get("tag_name", "")).lstrip("v"))
        and re.fullmatch(r"\d+\.\d+\.\d+", tag)
    ]


def latest_with_prefix(tags: list[str], prefix: str) -> str | None:
    matches = [t for t in tags if t == prefix or t.startswith(f"{prefix}.")]
    if not matches:
        return None
    return sorted(matches, key=lambda v: [int(x) for x in v.split(".")])[-1]


def compare(pkg: Package, upstream: str | None, note: str = "") -> CheckResult:
    if upstream is None:
        return CheckResult(pkg, None, "upstream unavailable", note)
    if pkg.version == upstream:
        return CheckResult(pkg, upstream, "up to date", note)
    return CheckResult(pkg, upstream, "behind", note)


def check_package(pkg: Package, all_packages: list[Package]) -> CheckResult:
    name = pkg.name

    if name in HARD_SKIP or re.fullmatch(r"corretto@\d+", name):
        return CheckResult(pkg, None, "skipped")

    if re.fullmatch(r"corretto\d+", name):
        major = int(name.removeprefix("corretto"))
        formula = next(
            (p for p in all_packages if p.name == f"corretto@{major}"), None
        )
        upstream = corretto_upstream(major)
        if formula and formula.version != pkg.version:
            return CheckResult(pkg, upstream, "cask/formula mismatch")
        note = "LTS" if major in LTS_MAJORS else ""
        return compare(pkg, upstream, note)

    if name.startswith("thrift@"):
        prefix = name.split("@", 1)[1]
        tags = github_release_tags("apache/thrift")
        upstream = latest_with_prefix(tags, prefix)
        note = ""
        if tags:
            latest = sorted(tags, key=lambda v: [int(x) for x in v.split(".")])[-1]
            if not latest.startswith(prefix):
                note = f"newer line available: {latest}"
        return compare(pkg, upstream, note)

    gh = GITHUB_RE.search(pkg.homepage) or GITHUB_RE.search(pkg.url)
    if gh:
        return compare(pkg, github_latest_tag(gh.group(1).removesuffix(".git")))

    return CheckResult(pkg, None, "unchecked")


def next_lts_after(max_lts: int) -> int | None:
    for i, major in enumerate(LTS_MAJORS):
        if major == max_lts and i + 1 < len(LTS_MAJORS):
            return LTS_MAJORS[i + 1]
    return None


def print_report(results: list[CheckResult]) -> int:
    stale = unchecked = 0
    corretto_majors: list[int] = []

    print("# Tap version check\n")
    print(f"Tap root: {ROOT}\n")
    print("## Packages")
    print("| Kind | Package | Tap | Upstream | Status | Notes |")
    print("|------|---------|-----|----------|--------|-------|")

    for result in results:
        if result.status == "skipped":
            continue

        pkg = result.package
        if result.status == "unchecked":
            unchecked += 1
        elif result.status != "up to date":
            stale += 1

        if re.fullmatch(r"corretto\d+", pkg.name):
            corretto_majors.append(int(pkg.name.removeprefix("corretto")))

        print(
            f"| {pkg.kind} | `{pkg.name}` | {pkg.version} | "
            f"{result.upstream or '—'} | {result.status} | {result.note or '—'} |"
        )

    if corretto_majors:
        print()
        print_corretto_extras(max(corretto_majors), set(corretto_majors))

    print("\n## Summary")
    if stale == 0 and unchecked == 0:
        print("All checked packages match upstream.")
    else:
        if stale:
            print(f"- {stale} package(s) behind upstream or unavailable")
        if unchecked:
            print(f"- {unchecked} package(s) unchecked")
        print("- Use bump-homebrew to update")

    return 1 if stale else 0


def print_corretto_extras(max_lts: int, supported: set[int]) -> None:
    print("## Java extras")

    next_fr = max_lts + 1
    while next_fr in LTS_MAJORS:
        next_fr += 1
    if next_fr not in supported and (fr_up := corretto_upstream(next_fr)):
        print(f"- JDK {next_fr} (feature release): {fr_up} — not in tap")

    next_lts = next_lts_after(max_lts)
    if next_lts is None:
        return
    lts_up = corretto_upstream(next_lts)
    if lts_up and next_lts not in supported:
        print(f"- JDK {next_lts} (LTS): {lts_up} — not in tap")
    elif not lts_up:
        print(f"- Next LTS: JDK {next_lts} (not released)")


def main() -> int:
    packages = discover_packages()
    if not packages:
        print("No packages found.", file=sys.stderr)
        return 1
    return print_report([check_package(pkg, packages) for pkg in packages])


if __name__ == "__main__":
    sys.exit(main())
