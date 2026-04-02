cask "open-cowork" do
  version "3.3.0-beta.9"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
