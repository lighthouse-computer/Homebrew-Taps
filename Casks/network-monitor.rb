# Auto-maintained: tap-autobump.yml direct-commits the latest upstream release's
# version + verified sha256 on every release. It rewrites ONLY `version` +
# `sha256` — never the `url` line — so the URL template below must stay correct.
cask "network-monitor" do
  version "1.0.0"
  sha256 "c02c14ebaebff240a05df30423ca6ff49e58270e4fa469dfa70a153f718c82e9"

  url "https://github.com/Light-House-Group/Network-Monitor/releases/download/v#{version}/NetworkUsageMonitor-#{version}.dmg"
  name "Network Monitor"
  desc "Live per-app network usage monitor for the menu bar"
  homepage "https://github.com/Light-House-Group/Network-Monitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NetworkUsageMonitor.app"

  # The DMG ships a Developer-ID-signed, Apple-notarized, stapled app — no
  # Gatekeeper workaround needed. Launch right after install.
  postflight do
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/NetworkUsageMonitor.app"],
                   sudo: false
  end

  uninstall quit: "io.github.light-house-group.network-speed"

  # The com.networkmonitor.macos paths are from an older namespace; they're zapped
  # too and tagged inline so the list stays strictly alphabetized for `brew style`.
  zap trash: [
    "~/Library/Application Support/NetworkUsageMonitor",
    "~/Library/LaunchAgents/com.networkmonitor.macos.plist",   # old namespace
    "~/Library/Preferences/com.networkmonitor.macos.plist",    # old namespace
    "~/Library/Preferences/io.github.light-house-group.network-speed.plist",
  ]
end
