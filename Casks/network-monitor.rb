cask "network-monitor" do
  version "1.5.1"
  sha256 "eaf6bb2e4be1b0f134458e878e453df14508218c78ceda93fe2fc54953ce8eff"

  url "https://github.com/Light-House-Group/Network-Speed/releases/download/v#{version}/NetworkUsageMonitor.app.zip",
      verified: "github.com/Light-House-Group/Network-Speed/"
  name "Network Monitor"
  desc "Menu-bar utility for live per-app network monitoring"
  homepage "https://github.com/Light-House-Group/Network-Speed"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "NetworkUsageMonitor.app"

  # The app is signed ad-hoc, not notarized by Apple (notarization needs a paid
  # Developer ID). Without this, Gatekeeper shows "Apple could not verify…" and
  # blocks launch (#10). Stripping the quarantine xattr that the download path
  # set lets it open normally. Safe: the bytes came from our own GitHub release,
  # and the sha256 above already pins them.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/NetworkUsageMonitor.app"],
                   sudo: false
    # Launch right after install (#11).
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/NetworkUsageMonitor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/NetworkUsageMonitor",
    "~/Library/Preferences/com.networkmonitor.macos.plist",
    "~/Library/LaunchAgents/com.networkmonitor.macos.plist",
  ]
end
