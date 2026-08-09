# homebrew-tap

Homebrew tap for [reclaim](https://github.com/gokul-kulkarni/reclaim), a tool
for finding and safely reclaiming disk space taken by developer caches and
build artifacts.

```sh
brew install gokul-kulkarni/tap/reclaim
```

## About this repo

`Formula/reclaim.rb` is written by the `homebrew` job in
[reclaim's release workflow](https://github.com/gokul-kulkarni/reclaim/blob/main/.github/workflows/release.yml)
on every tagged release. It is not meant to be hand-edited here — change the
source of truth at
[`packaging/homebrew/reclaim.rb`](https://github.com/gokul-kulkarni/reclaim/blob/main/packaging/homebrew/reclaim.rb)
in the main repo instead.

See [`docs/releasing.md`](https://github.com/gokul-kulkarni/reclaim/blob/main/docs/releasing.md)
in the main repo for the full release process, including how to test the
formula locally before it ever reaches this repo.
