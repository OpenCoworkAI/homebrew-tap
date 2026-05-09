cask "open-codesign" do
  version "0.2.0"

  on_arm do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-arm64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "218f7348b0e87c323c42e09672ae7a98801d1da68fcb1eda2949b8dbbe1d8b3c"
  end
  on_intel do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-x64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "e5c849fbbd9952efe6e38d1830bf5274930df14d2ed8ff09f70596f57b455d9d"
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

  app "Open CoDesign.app"

  # Unsigned build — macOS will refuse the first launch with a generic
  # "damaged, move to Trash" dialog. Code-signing + notarization is on the
  # Stage-2 roadmap; until then users need the xattr workaround below.
  caveats <<~EOS
    #{token} is not yet notarized. On first launch macOS may refuse to open
    it. To bypass, either right-click the app and choose Open, or run:

      xattr -d com.apple.quarantine /Applications/Open CoDesign.app

    You only need to do this once per install/update.
  EOS

  zap trash: [
    "~/Library/Application Support/open-codesign",
    "~/Library/Preferences/ai.opencowork.codesign.plist",
    "~/Library/Logs/open-codesign",
    "~/Library/Saved Application State/ai.opencowork.codesign.savedState",
  ]
end
