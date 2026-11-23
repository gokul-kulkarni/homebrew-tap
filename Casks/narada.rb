cask "narada" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "593540f111421574565103bb71fcf60133d856165e8074ec544bd081e348035a",
         intel: "a63f47990c6b0945ae47ef38c26222284817d227f70e764d960608edfb9ea6a5"

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
