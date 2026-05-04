cask "loom-oc" do
  version "0.1.0"
  sha256 "7bc303d792d4670bbd510c495d9f84fe022e9d3f0e2399f1136f318dfcec3cea"

  url "https://github.com/kevin-espineira/loom-oc/releases/download/v#{version}/Loom_#{version}_universal.dmg"
  name "Loom"
  desc "Visual config editor for OpenCode"
  homepage "https://github.com/kevin-espineira/loom-oc"

  livecheck do
    url "https://api.github.com/repos/kevin-espineira/loom-oc/releases/latest"
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
