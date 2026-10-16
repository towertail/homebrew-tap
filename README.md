# towertail/homebrew-tap

Homebrew tap for [Towertail](https://github.com/towertail/towertail), a menu bar monitor for remote servers.

## Install

```bash
brew install --cask towertail/tap/towertail
```

Requires macOS 14 Sonoma or later (Apple silicon or Intel).

The cask installs the signed and notarized `Towertail.zip` from the [latest release](https://github.com/towertail/towertail/releases/latest).

## Update

The app updates itself. The cask has `auto_updates true`, so `brew upgrade` does not replace the app. To make Homebrew install the latest cask version, use `brew upgrade --cask --greedy towertail`.

## Uninstall

```bash
brew uninstall --cask towertail          # remove the app
brew uninstall --cask --zap towertail    # also remove settings, history, logs, and caches
```

The `--zap` option removes these items:

- `~/Library/Application Support/Towertail` (settings, history database, logs)
- `~/Library/Preferences/com.towertail.Towertail.plist`
- `~/Library/Caches/com.towertail.Towertail` and `~/Library/HTTPStorages/com.towertail.Towertail`
- `~/.towertail` (the sampler, if this Mac is also a monitored host)

The SSH passwords in the login keychain (service `com.towertail.ssh`) stay. Remove them in Keychain Access.

## How the cask updates

Each Mac release of `towertail/towertail` runs `.github/workflows/release.yml`. Its last step sets `version` and `sha256` in `Casks/towertail.rb` and pushes to `main` with a deploy key. Do not edit these two lines by hand.

The `Test` workflow runs `brew style`, `brew audit --cask --strict --online`, an install, and an uninstall with `--zap` on macOS for each push and pull request.
