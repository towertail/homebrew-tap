cask "towertail" do
  version "0.3.11"
  sha256 "cd1fc5a6a0967f6519df4abe1bf7e6937e83be42b6e197e69818b46e518b548b"

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
