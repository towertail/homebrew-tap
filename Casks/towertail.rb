cask "towertail" do
  version "0.3.1"
  sha256 "3bf3a9cf9ca85423b437fceb9a9497da4af3b280c98379359d15ea62d3f78acf"

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
