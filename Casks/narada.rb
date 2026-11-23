cask "narada" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "d0c7f84aa1d0f42d19e984a73457d70dbb264a87635560d65055f347abf0148f",
         intel: "797178b48cb478ca6ccbac9479325b6ea133c46d7fc9d317241f0dca4692f5eb"

  url "https://github.com/gokul-kulkarni/narada/releases/download/v#{version}/Narada_#{version}_#{arch}.dmg"
  name "Narada"
  desc "Free, local-first, Postman-compatible API client"
  homepage "https://github.com/gokul-kulkarni/narada"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Narada.app"

  # Narada is signed ad hoc, not notarized. Recent macOS reports such an app as
  # "damaged" while it carries the download quarantine flag, so clear it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "{{appdir}}/Narada.app",
        writable_paths: ["{{appdir}}/Narada.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.narada.app",
    "~/Library/Caches/com.narada.app",
    "~/Library/Saved Application State/com.narada.app.savedState",
    "~/Library/WebKit/com.narada.app",
  ]

  caveats <<~EOS
    Narada is not notarized by Apple yet. This cask clears macOS's download
    quarantine flag so the app opens; if macOS still says it is damaged, run:
      xattr -dr com.apple.quarantine /Applications/Narada.app
  EOS
end
