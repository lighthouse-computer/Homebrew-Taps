# Auto-maintained: autobump.yml direct-commits the latest upstream release's
# version + verified sha256 on every release. It rewrites ONLY `version` +
# `sha256` — never the `url` line — so the URL template below must stay correct.
cask "beacon" do
  version "1.0.0"
  sha256 "9e6c8e3de8f7310eab529409aa4dc7955621ac5da0051d0d63eb6af355f9a69d"

  url "https://github.com/lighthouse-computer/Beacon/releases/download/v#{version}/Beacon.app.zip",
      verified: "github.com/lighthouse-computer/Beacon/"
  name "Beacon"
  desc "Menu-bar utility for live per-app network monitoring"
  homepage "https://github.com/lighthouse-computer/Beacon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Beacon.app"

  # The app is signed ad-hoc, not notarized by Apple (notarization needs a paid
  # Developer ID). Without this, Gatekeeper shows "Apple could not verify…" and
  # blocks launch. Stripping the quarantine xattr that the download path set lets
  # it open normally. Safe: the bytes came from our own GitHub release, and the
  # sha256 above already pins them.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/Beacon.app"],
                   sudo: false
    # Launch right after install.
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/Beacon.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Beacon",
    "~/Library/Preferences/computer.lighthouse.beacon.plist",
    "~/Library/LaunchAgents/computer.lighthouse.beacon.plist",
  ]
end
