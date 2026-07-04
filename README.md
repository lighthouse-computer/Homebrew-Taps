# Lighthouse Computer — Homebrew tap

Homebrew tap for [Lighthouse Computer](https://github.com/lighthouse-computer) apps.

## Available casks

| Cask | Description |
| :--- | :--- |
| [`beacon`](Casks/beacon.rb) | Menu-bar utility for live per-app network monitoring (macOS 13+) |
| [`clip-board`](Casks/clip-board.rb) | Privacy-first clipboard history manager for macOS — AES-GCM at rest, no network code (macOS 14+) |
| [`network-monitor`](Casks/network-monitor.rb) | Legacy build of the network monitor — superseded by [`beacon`](Casks/beacon.rb) |

## Install

A tap is a third-party source you add to Homebrew — you have to add (trust) it
before installing from it. Add it once, then install:

```bash
brew tap lighthouse-computer/taps
brew install --cask beacon
```

Or as a single command (Homebrew adds the tap automatically the first time you
reference it by its full `owner/tap/cask` path):

```bash
brew install --cask lighthouse-computer/taps/beacon
```

Other casks:

```bash
brew install --cask lighthouse-computer/taps/clip-board
```

## Update

```bash
brew update
brew upgrade --cask beacon
```

## Uninstall

```bash
brew uninstall --cask beacon
```

Add `--zap` to also remove app data and preferences:

```bash
brew uninstall --zap --cask beacon
```

## Gatekeeper

`beacon` is signed ad-hoc, not notarized with a paid Developer ID, so by default
macOS refuses to launch it with the "Apple could not verify…" message. Its cask
runs a `postflight` block that strips the download-quarantine attribute
(`com.apple.quarantine`) on install so the app launches normally — the bytes are
pinned by the cask's `sha256`, so this is safe.

## Auto-bump

This tap runs [`.github/workflows/autobump.yml`](.github/workflows/autobump.yml)
hourly. For each cask it queries the upstream's latest GitHub release, downloads
the asset, verifies its `sha256` against the release's published `.sha256`
sidecar, and commits the `version` + `sha256` bump directly to `main`. No manual
editing — you can also trigger it from the Actions tab.

## License

The cask formulae in this repository are released under the [MIT License](LICENSE).
The apps they install have their own licenses, linked from each formula.
