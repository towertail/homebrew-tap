cask "towertail" do
  version "0.3.5"
  sha256 "bdeb243fa4d0e69a97d105da86eefdd3ca916ba33cc065428fad74f9fb206a8e"

  url "https://github.com/towertail/towertail/releases/download/v#{version}/Towertail.zip"
  name "Towertail"
  desc "Menu bar monitor for remote servers over SSH and Tailscale"
  homepage "https://github.com/towertail/towertail"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Towertail.app"

  uninstall quit: "com.towertail.Towertail"

  zap trash: [
    "~/.towertail",
    "~/Library/Application Support/Towertail",
    "~/Library/Caches/com.towertail.Towertail",
    "~/Library/HTTPStorages/com.towertail.Towertail",
    "~/Library/Preferences/com.towertail.Towertail.plist",
  ]
end
