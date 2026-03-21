# Homebrew Tap for Open Cowork

[![Lint](https://github.com/OpenCoworkAI/homebrew-tap/actions/workflows/lint.yml/badge.svg)](https://github.com/OpenCoworkAI/homebrew-tap/actions/workflows/lint.yml)

Official [Homebrew](https://brew.sh) Cask tap for [Open Cowork](https://github.com/OpenCoworkAI/open-cowork) — an open-source desktop AI agent app.

## Installation

```bash
brew tap OpenCoworkAI/tap
brew install --cask --no-quarantine open-cowork
```

> **Note:** The `--no-quarantine` flag prevents macOS Gatekeeper from blocking the app. Open Cowork is open-source but not signed with an Apple Developer certificate, so this flag is recommended.

## Upgrade

```bash
brew upgrade --cask open-cowork
```

## Uninstall

```bash
brew uninstall --cask open-cowork
```

## Why use Homebrew?

When you install with `--no-quarantine`, Homebrew skips the macOS Gatekeeper quarantine check entirely. This means no "Apple cannot verify this app" warning — the app just opens normally.

## How it works

This tap is automatically updated when a new [Open Cowork release](https://github.com/OpenCoworkAI/open-cowork/releases) is published. The CI downloads the DMG, computes the SHA256 checksum, and commits the updated Cask formula.

## Requirements

- macOS Ventura (13.0) or later
- Apple Silicon (arm64)

## License

[MIT](LICENSE)
