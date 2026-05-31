cask "clip-board" do
  version "1.2.3"
  sha256 "1f5e9c8511a7db810309fe0e1398c834fa1c3d521444d460d0024822d5607311"

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
