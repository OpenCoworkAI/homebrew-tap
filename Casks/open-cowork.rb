cask "open-cowork" do
  version "3.3.0-beta.5"
  sha256 "0b253443272b0eb22c71856ef69ae01b3f98c792526f6296a7c2141e07fba99d"

  url "https://github.com/OpenCoworkAI/open-cowork/releases/download/v#{version}/Open.Cowork-#{version}-mac-arm64.dmg"
  name "Open Cowork"
  desc "Desktop AI agent app with sandboxed environment"
  homepage "https://github.com/OpenCoworkAI/open-cowork"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Open Cowork.app"

  caveats <<~EOS
    Open Cowork is not signed with an Apple Developer certificate.
    If macOS shows "Apple cannot verify this app", reinstall with:
      brew reinstall --cask --no-quarantine open-cowork
    Or manually remove the quarantine flag:
      xattr -rd com.apple.quarantine /Applications/Open\\ Cowork.app
  EOS

  zap trash: [
    "~/Library/Application Support/open-cowork",
    "~/Library/Preferences/com.opencowork.app.plist",
  ]
end
