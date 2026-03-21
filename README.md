# Homebrew Tap for Open Cowork

[![Lint](https://github.com/OpenCoworkAI/homebrew-tap/actions/workflows/lint.yml/badge.svg)](https://github.com/OpenCoworkAI/homebrew-tap/actions/workflows/lint.yml)

Official [Homebrew](https://brew.sh) Cask tap for [Open Cowork](https://github.com/OpenCoworkAI/open-cowork) — an open-source desktop AI agent app.

## Installation

```bash
brew tap OpenCoworkAI/tap
brew install --cask open-cowork
```

## Upgrade

```bash
brew upgrade --cask open-cowork
```

## Uninstall

```bash
brew uninstall --cask open-cowork
```

## Why use Homebrew?

Installing via Homebrew automatically removes the macOS Gatekeeper quarantine flag, so you won't see the "app is damaged" warning that affects unsigned DMG downloads.

## How it works

This tap is automatically updated when a new [Open Cowork release](https://github.com/OpenCoworkAI/open-cowork/releases) is published. The CI downloads the DMG, computes the SHA256 checksum, and commits the updated Cask formula.

## Requirements

- macOS Ventura (13.0) or later
- Apple Silicon (arm64)

## License

[MIT](LICENSE)
