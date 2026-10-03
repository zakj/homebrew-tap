# Generated from mac/seed.rb.in in zakj/seed; edit it there.
cask "seed" do
  version "2.1.0"
  sha256 "2e96a92cd375c3ad37d2ef91cb8e88881f7767b7aa5c6a804db9c235fb2eaac3"

  url "https://github.com/zakj/seed/releases/download/v#{version}/Seed-v#{version}-arm64.zip"
  name "Seed"
  desc "Task tracker for AI coding agents and humans"
  homepage "https://github.com/zakj/seed"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Seed.app"

  # Ad-hoc signed, so Gatekeeper blocks a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Seed.app"]
  end

  uninstall quit: "net.zakj.seed"

  zap trash: [
    "~/Library/Caches/net.zakj.seed",
    "~/Library/HTTPStorages/net.zakj.seed",
    "~/Library/Preferences/net.zakj.seed.plist",
  ]
end
