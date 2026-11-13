cask "towertail" do
  version "0.3.6"
  sha256 "3a96aebaab85086e9fe970efd9474db779df4e7cf718237c983f1c05512cbfd9"

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
