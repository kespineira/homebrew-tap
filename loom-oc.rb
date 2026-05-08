cask "loom-oc" do
  version "0.3.0"
  sha256 "f4bce03d7103547da79ded82abd73a9349c5659db6d5f84532cc33adbead82ce"

  url "https://github.com/kespineira/loom-oc/releases/download/v#{version}/Loom_#{version}_universal.dmg"
  name "Loom"
  desc "Visual config editor for OpenCode"
  homepage "https://github.com/kespineira/loom-oc"

  livecheck do
    url "https://api.github.com/repos/kespineira/loom-oc/releases/latest"
    strategy :json do
      json.map { |v| v["tag_name"].delete_prefix("v") }
    end
  end

  app "Loom.app"

  zap trash: [
    "~/Library/Application Support/ai.loom.oc",
    "~/Library/Preferences/ai.loom.oc.plist",
    "~/Library/Caches/ai.loom.oc",
  ]
end
