# Leyline Homebrew tap

Install Leyline 1.0.0 on macOS 14 or later:

```sh
brew install scshafe/tap/leyline
ley install --start
```

Source builds need Swift 6 or newer from Xcode Command Line Tools. The formula
uses the Command Line Tools Python for packaging and supplies jq for optional
CLI diagnostics. The installer copies Leyline and Recovery to the user Applications directory and
preserves local settings. Grant Accessibility and Input Monitoring to Leyline.

See [Leyline](https://github.com/scshafe/leyline-wm) for usage, configuration and
recovery instructions. Local builds are ad-hoc signed. Universal application
previews and matching checksums are available on the
[release page](https://github.com/scshafe/leyline-wm/releases/tag/v1.0.0).

The formula is bound to the release's versioned source archive and SHA-256.
This tap and Leyline use the MIT License.
