# Light-House-Group Homebrew tap

Homebrew tap for [Light-House-Group](https://github.com/Light-House-Group) apps.

## Available casks

| Cask | Description |
| :--- | :--- |
| [`clip-board`](Casks/clip-board.rb) | Privacy-first clipboard history manager for macOS — AES-GCM at rest, no network code |

## Install

```bash
brew install --cask light-house-group/tap/clip-board
```

Homebrew will auto-add this tap the first time you reference it. To add it explicitly:

```bash
brew tap light-house-group/tap
```

## Update

```bash
brew update
brew upgrade --cask clip-board
```

## Uninstall

```bash
brew uninstall --cask clip-board
```

Add `--zap` to also remove encrypted history and preferences:

```bash
brew uninstall --zap --cask clip-board
```

## License

The cask formulae in this repository are released under the [MIT License](LICENSE). The apps they install have their own licenses linked from each formula.
