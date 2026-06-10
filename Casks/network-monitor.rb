# Auto-maintained: tap-autobump.yml direct-commits the latest upstream release's
# version + verified sha256 on every release. It rewrites ONLY `version` +
# `sha256` — never the `url` line — so the URL template below must stay correct.
cask "network-monitor" do
  version "2.0.0"
  sha256 "8088f5ef6a283fbd8c074490b29853a098990e0fa6d7d92d0e7eb8af100b78e2"

  url "https://github.com/Light-House-Group/Network-Speed/releases/download/v#{version}/NetworkUsageMonitor-#{version}.dmg",
      verified: "github.com/Light-House-Group/Network-Speed/"
  name "Network Speed Pro"
  desc "Menu-bar network monitor with a per-app firewall"
  homepage "https://github.com/Light-House-Group/Network-Speed"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "NetworkUsageMonitor.app"

  # The DMG ships a Developer-ID-signed, Apple-notarized, stapled app — no
  # Gatekeeper workaround needed. Launch right after install.
  postflight do
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/NetworkUsageMonitor.app"],
                   sudo: false
  end

  uninstall quit: "io.github.light-house-group.network-speed"

  zap trash: [
    "~/Library/Application Support/NetworkUsageMonitor",
    "~/Library/Preferences/io.github.light-house-group.network-speed.plist",
    # Legacy v1 paths — cleaned up on uninstall for users upgrading from pre-2.0.
    "~/Library/Preferences/com.networkmonitor.macos.plist",
    "~/Library/LaunchAgents/com.networkmonitor.macos.plist",
  ]
end
