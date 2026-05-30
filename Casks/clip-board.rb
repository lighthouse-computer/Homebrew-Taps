cask "clip-board" do
  version "1.1.0"
  sha256 "05e8cb3347284e8e2d682c0ba6cb4c935800017f921df437b4089636841dfa22"

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
