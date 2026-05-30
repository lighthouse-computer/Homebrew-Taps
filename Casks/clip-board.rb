cask "clip-board" do
  version "1.2.0"
  sha256 "7ba1c951fe1d522e6a09247995f3e5c9d480b13b929afb816b6e4dfd53f88335"

  url "https://github.com/Light-House-Group/Clip-Board/releases/download/v#{version}/Clip-Board.zip"
  name "Clip-Board"
  desc "Privacy-first clipboard history manager for macOS (AES-GCM at rest, no network code)"
  homepage "https://github.com/Light-House-Group/Clip-Board"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sonoma"

  app "Clip Board.app"

  zap trash: [
    "~/Library/Application Support/ClipboardManager",
    "~/Library/Preferences/Siddharth.Sangwa.ClipBoard.plist",
    "~/Library/Saved Application State/Siddharth.Sangwa.ClipBoard.savedState",
  ]
end
