cask "open-codesign" do
  version "0.1.2"

  on_arm do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-arm64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "6c3be603e32340c017b66ad8cd01822aa21a98cc28c3aac56912a94c0b53d5c4"
  end
  on_intel do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-x64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "349efb65326ff067c85b4d07731bcd04e17319707e3709f9c33a327ce9141753"
  end

  name "Open CoDesign"
  desc "Open-source desktop AI design tool — prompt to prototype, BYOK, local-first"
  homepage "https://opencoworkai.github.io/open-codesign/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"

  app "open-codesign.app"

  # Unsigned build — macOS will refuse the first launch with a generic
  # "damaged, move to Trash" dialog. Code-signing + notarization is on the
  # Stage-2 roadmap; until then users need the xattr workaround below.
  caveats <<~EOS
    #{token} is not yet notarized. On first launch macOS may refuse to open
    it. To bypass, either right-click the app and choose Open, or run:

      xattr -d com.apple.quarantine /Applications/open-codesign.app

    You only need to do this once per install/update.
  EOS

  zap trash: [
    "~/Library/Application Support/open-codesign",
    "~/Library/Preferences/ai.opencowork.codesign.plist",
    "~/Library/Logs/open-codesign",
    "~/Library/Saved Application State/ai.opencowork.codesign.savedState",
  ]
end
