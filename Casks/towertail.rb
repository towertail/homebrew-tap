cask "towertail" do
  version "0.3.13"
  sha256 "0ee8d7d9a9f0d68b9590da4ceac5e4d7caae7a449d0ba9bf75915891aea7e32a"

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
