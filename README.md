# homebrew-tap

Homebrew tap for Gokul Kulkarni's apps and tools.

| Name | Kind | Install |
| ---- | ---- | ------- |
| [Reclaim](https://github.com/gokul-kulkarni/reclaim): finds and safely reclaims disk space taken by developer caches and build artifacts | formula (command-line tool) | `brew install gokul-kulkarni/tap/reclaim` |
| [Narada](https://github.com/gokul-kulkarni/narada): free, local-first, Postman-compatible API client | cask (macOS app) | `brew install --cask gokul-kulkarni/tap/narada` |

Homebrew asks you to trust a third-party tap once before installing from it:

```sh
brew trust gokul-kulkarni/tap
```

After that, the short names work too: `brew install reclaim`, `brew install --cask narada`.

## About this repo

Each package's file is generated from its own repository; change it there, not here.

- `Formula/reclaim.rb` is written by Reclaim's
  [`scripts/update-tap.sh`](https://github.com/gokul-kulkarni/reclaim/blob/main/scripts/update-tap.sh)
  on every release. Its source of truth is
  [`packaging/homebrew/reclaim.rb`](https://github.com/gokul-kulkarni/reclaim/blob/main/packaging/homebrew/reclaim.rb);
  see [`docs/releasing.md`](https://github.com/gokul-kulkarni/reclaim/blob/main/docs/releasing.md).
- `Casks/narada.rb` is updated for each
  [Narada release](https://github.com/gokul-kulkarni/narada/releases).
  `brew uninstall --zap --cask narada` also deletes collections kept in Narada's default folder.

To add another package, put a formula in `Formula/` or a cask in `Casks/`, and add a row above.
