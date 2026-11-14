# TappoyGK Homebrew tap

## インストール

```sh
brew install tappoygk/tap/suz
```

Suzの検証済みバイナリをインストールする。対象はmacOS 26（Tahoe）以降のApple Siliconである。Suz v0.1.0の検証環境はmacOS 26.5・Apple Clang 21.0.0である。

`suz build` と `suz run` には外部のClang・リンカー・SDKが必要である。XcodeまたはCommand Line Toolsで用意する。

```sh
xcode-select --install
```

## 更新

```sh
brew update
brew upgrade suz
```

## Formulaの更新手順

1. Suzのリリース手順に従い、検証済みの `suz-macos-arm64.tar.gz` をGitHub Releaseで公開する。
2. `Formula/suz.rb` のバージョン・URL・SHA-256を更新する。ハッシュは公開するアーカイブから計算する。
3. `brew audit --strict tappoygk/tap/suz`、`brew reinstall tappoygk/tap/suz`、`brew test tappoygk/tap/suz` を実行する。
4. 差分を確認し、コミットしてpushする。
