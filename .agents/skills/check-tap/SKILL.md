---
name: check-tap
description: >-
  Check all packages in this Homebrew tap against upstream versions. Reports
  stale casks/formulas and new Java LTS or feature releases. Use when asked to
  check latest versions, audit the tap, or see if bumps are needed.
---

# Check Tap Versions

Read-only. Report results only — use `bump-homebrew` to update.

```bash
python3 .agents/skills/check-tap/scripts/check-versions.py
```

## Check rules

| Package | Upstream |
|---------|----------|
| `corretto{N}` (+ `corretto@{N}` formula) | `corretto.aws` latest redirect |
| `thrift@{line}` | Latest `apache/thrift` release on that line |
| GitHub `homepage` or `url` | Latest GitHub release |
| `bitbar`, `shuttle` | Hard skip (`HARD_SKIP`) |
| Other | `unchecked` — add check logic to the script |

Corretto casks also report the next feature-release JDK and next LTS (8 → 11 → 17 → 21 → 25 → 29 → …).

## New packages

- GitHub releases: point `homepage` or `url` at `https://github.com/owner/repo`
- Corretto: `corretto{N}` cask + `corretto@{N}` formula
- Pinned line: `name@line` (e.g. `thrift@0.22`)
- Skip: add name to `HARD_SKIP` in `scripts/check-versions.py`

## Follow-up

| Result | Action |
|--------|--------|
| Behind upstream | `bump-homebrew` |
| Cask/formula mismatch | Bump the lagging file |
| New LTS JDK | Add cask + formula |
| `unchecked` | Extend `scripts/check-versions.py` |
